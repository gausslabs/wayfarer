
use std::{env, usize};
use utilities::{write_file, Layer};

use utilities::gate_internals::{Base2GateControlFunc, get_bool_vector, get_value_from_bool_vector};
use utilities::stages::GateLayer;

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, destination) = match args.len() {
        1 => ("input.hex", "output.hex"),
        2 => (args[1].as_str(), "output.hex"),
        3 => (args[1].as_str(), args[2].as_str()),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [file location] [seed]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    const BIT_WIDTH: usize = 5;
    let a_wire = 0;
    let b_wire = 1;
    let c_wire = 3;
    let strings = (0..(1 << BIT_WIDTH))
        .map(|n| format!("{:02x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    let g: GateLayer<BIT_WIDTH> = GateLayer::new(
        [a_wire, b_wire, c_wire],
        false,
        Base2GateControlFunc::from_u8(9)
    );
    let sequence = (0..(1 << BIT_WIDTH))
        .map(|x| {
            let bool_inputs = get_bool_vector(x);
            let output = g.evaluate(bool_inputs);
            get_value_from_bool_vector(output)
        })
        .map(|n| format!("{:02x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    match write_file(&input, &strings) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };

    match write_file(&destination, &sequence) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };
}
