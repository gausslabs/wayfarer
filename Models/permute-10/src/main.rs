use local_mixing::replacement::{lfsr::WireEntries};
use local_mixing::replacement::{permutations::walksman_permutation_10};
use rand::Rng;
use std::{env, fmt::{format, Debug}, usize};
use utilities::{
    write_file
};


fn int_wire(w: WireEntries) -> usize {
    let value = w.position as usize & ((1 << 4) - 1);
    let value = value + ((w.present as usize) << 4);
    value
}

fn string_wires(wires: [WireEntries;10]) -> String {
    let mut value = 0;
    for (_i, &w) in wires.iter().enumerate() {
        value = (value << (5) ) | int_wire(w);
    }
    format!("{:014x}",value)
}

fn config_from_int(index: usize) -> Vec<bool> {
    let mut control = vec![];
    for i in 0..25 {
        control.push(((index >> i) & 1) == 1);
    }

    control
}


fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, config, reference) = match args.len() {
        1 => (
            "streamInput.hex",
            "config.hex",
            "referenceStream.hex",
        ),
        2 => (
            args[1].as_str(),
            "config.hex",
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
    println!("This is data for the model permute-10");

    let mut rng = rand::thread_rng();
    let config_sequence = (0..15600)
        .map(|_| rng.gen_range(0..(1<<25)))
        .collect::<Vec<_>>();


    let config_value = config_sequence.clone().into_iter()
        .map(|n| format!("{:07x}", n))
        .collect::<Vec<_>>()
        .join("\n");
    
    let wires = [WireEntries{ position: 0, present: true}, WireEntries{present: false, position: 1}, WireEntries{ position: 2, present: true}, WireEntries{position: 3, present: false}, WireEntries{position: 4, present: true}, WireEntries{ position: 0, present: true}, WireEntries{present: false, position: 1}, WireEntries{ position: 2, present: true}, WireEntries{position: 3, present: false}, WireEntries{position: 4, present: true} ];
    println!("Using the following wires {:?}", wires);
    println!("Using the following wires {:?}", string_wires(wires));
    println!("The config vec {:?}", config_from_int(6623783));
    println!("Using the following wires {:?}", string_wires(walksman_permutation_10(&wires, &config_from_int(6623783))));
    println!("Using the following wires {:?}", walksman_permutation_10(&wires, &config_from_int(6623783)));
    //////////////////////////////////////////////////////////////////////////
    // Creating input and output
    //////////////////////////////////////////////////////////////////////////

    let ref_value = (0..256)
        .map(|_| string_wires(wires) )
        .collect::<Vec<_>>()
        .join("\n");

    let sequence = config_sequence.into_iter()
        .map(|n| {
            walksman_permutation_10(&wires, &config_from_int(n))
        } )
        .map(|w| string_wires(w) )
        .collect::<Vec<_>>()
        .join("\n");

    match write_file(&config, &config_value) {
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
