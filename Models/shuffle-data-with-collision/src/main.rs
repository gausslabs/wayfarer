use local_mixing::replacement::lfsr::WireEntries;
use utilities::shuffle::{config_from_int, string_wires, WireMatrix, LFSR, flatten_full };
use std::env;
use utilities::write_file;

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, collision, reference) = match args.len() {
        1 => (
            "streamInput.hex",
            "collision.hex",
            "referenceStream.hex",
        ),
        2 => (
            args[1].as_str(),
            "collision.hex",
            "referenceStream.hex",
        ),
        3 => (
            args[1].as_str(),
            args[2].as_str(),
            "referenceStream.hex",
        ),
        4 => (
            args[1].as_str(),
            args[2].as_str(),
            args[3].as_str(),
        ),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [Input file location] [config file location] [Reference file location]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    //////////////////////////////////////////////////////////////////////////
    // Creating the reference values
    //////////////////////////////////////////////////////////////////////////
    println!("This is data for the model shuffle-data");
    let mut wire_data: [[WireEntries;5];3] = [[WireEntries::default();5];3];
    let mut pointer = 0;
    for i in 0..3 {
        for j in 0..5 {
            wire_data[i][j].position = pointer;
            wire_data[i][j].present = true;
            pointer +=1;
        }
    }
    // creating duplicates
    wire_data[0][2].position = 3;
    wire_data[1][2].position = 3;
    wire_data[2][2].position = 3;

    let mut wire_list:Vec<[[WireEntries;5];3]> = Vec::new();
    let mut collisions: Vec<bool> = Vec::new();
    let mut wr = WireMatrix::new(wire_data, 345668);
    let mut first_lfsr = LFSR::new(345668);
    let mut second_lfsr = LFSR::new(12332);

    wire_list.push(wire_data);
    // collisions.push(wr.collision());
    
    let max: u64 = 1 << 9;
    
    for _ in 0..max {
        let contol_configs = config_from_int::<27>(first_lfsr.next() as usize);
        let target_configs = config_from_int::<10>(second_lfsr.next() as usize);
        wr.shuffle_data_new(target_configs, contol_configs);
        // populating the vec
        wire_list.push(wr.current_wire_data());
        collisions.push(wr.collision());
    }

    let collision_value = collisions.iter()
        .map(|&b| {
            if b {
                1
            } else {
                0
            }
        })
        .map(|n| format!("{:01x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    //////////////////////////////////////////////////////////////////////////
    // Creating input and output
    //////////////////////////////////////////////////////////////////////////

    let ref_value = wire_list[0..(wire_list.len() - 1)].iter()
        .map(|n| string_wires( &flatten_full(n) , 0) )
        .collect::<Vec<_>>()
        .join("\n");

    let sequence = wire_list[1..].iter()
        .map(|n| string_wires(&flatten_full(n), 0) )
        .collect::<Vec<_>>()
        .join("\n");

    match write_file(&collision, &collision_value) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };

    match write_file(&input, &ref_value) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };

    match write_file(&reference, &sequence) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };
}
