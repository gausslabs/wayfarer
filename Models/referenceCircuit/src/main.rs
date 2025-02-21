use rand::Rng;
use std::{collections::HashSet, env, usize};
use utilities::{
    gate_internals::{get_bool_vector, Base2GateControlFunc},
    stages::{Gate, ReferenceCircuit},
    write_file, Layer,
};

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, config, reference, search) = match args.len() {
        1 => (
            "streamInput.hex",
            "config.hex",
            "referenceStream.hex",
            "gateStream.hex",
        ),
        2 => (
            args[1].as_str(),
            "config.hex",
            "referenceStream.hex",
            "gateStream.hex",
        ),
        3 => (
            args[1].as_str(),
            args[2].as_str(),
            "referenceStream.hex",
            "gateStream.hex",
        ),
        4 => (
            args[1].as_str(),
            args[2].as_str(),
            args[3].as_str(),
            "gateStream.hex",
        ),
        5 => (
            args[1].as_str(),
            args[2].as_str(),
            args[3].as_str(),
            args[4].as_str(),
        ),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [In file location] [Reference file location] [Search file location]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    const NUMBER_OF_GATES: usize = 6;
    const NUMBER_OF_WIRES: usize = (2 * NUMBER_OF_GATES) + 1;
    const PASSTHROUGH: bool = false;
    let mut rng = rand::thread_rng();
    //////////////////////////////////////////////////////////////////////////
    // Creating the reference gates
    //////////////////////////////////////////////////////////////////////////
    let mut ref_gates = vec![];
    for i in 0..NUMBER_OF_GATES {
        let mut a_wire = 0;
        let mut b_wire = 0;
        let mut c_wire = 0;
        if PASSTHROUGH {
            a_wire = i;
            b_wire = i;
            c_wire = i;
        } else {
            let mut set = HashSet::new();
            while set.len() < 3 {
                set.insert(rng.gen_range(0..NUMBER_OF_WIRES));
            }
            let values = set.iter().map(|x| *x).collect::<Vec<usize>>();
            println!("The values are {:?}", values);
            a_wire = values[0];
            b_wire = values[1];
            c_wire = values[2];
        }
        println!("The wires are {:?}", [a_wire, b_wire, c_wire]);
        let operation = rng.gen_range(0..=15);

        let g: Gate<NUMBER_OF_WIRES> = Gate::new(
            [a_wire as u8, b_wire as u8, c_wire as u8],
            a_wire == b_wire,
            Base2GateControlFunc::from_u8(operation as u8),
        );
        ref_gates.push(g);
    }

    let ref_circuit: ReferenceCircuit<NUMBER_OF_WIRES, NUMBER_OF_GATES> =
        ReferenceCircuit::new(ref_gates.try_into().unwrap());

    let config_value = ref_circuit
        .get_config()
        .iter()
        .map(|n| format!("{:03x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    //////////////////////////////////////////////////////////////////////////
    // Creating gate input and output
    //////////////////////////////////////////////////////////////////////////

    let ref_value = (0..(1 << NUMBER_OF_WIRES))
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    let sequence = (0..(1 << NUMBER_OF_WIRES))
        .map(|x| {
            let bool_inputs = get_bool_vector(x);
            let output = ref_circuit.evaluate(bool_inputs);
            utilities::gate_internals::get_value_from_bool_vector(output)
        })
        .map(|n| format!("{:04x}", n))
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

    match write_file(&reference, &ref_value) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };

    match write_file(&search, &sequence) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };
}
