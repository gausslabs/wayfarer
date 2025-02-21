use rand::Rng;
use std::{collections::HashSet, env, usize};
use utilities::{
    gate_internals::get_bool_vector,
    stages::{SearchCircuit, SearchGate},
    write_file, Layer,
};

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, config, reference, search) = match args.len() {
        1 => (
            "streamInput.hex",
            "config.hex",
            "referenceStream.hex",
            "searchStream.hex",
        ),
        2 => (
            args[1].as_str(),
            "config.hex",
            "referenceStream.hex",
            "searchStream.hex",
        ),
        3 => (
            args[1].as_str(),
            args[2].as_str(),
            "referenceStream.hex",
            "searchStream.hex",
        ),
        4 => (
            args[1].as_str(),
            args[2].as_str(),
            args[3].as_str(),
            "searchStream.hex",
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
        let mut gate_seed = 0;
        let mut wire_seed = 0;
        if PASSTHROUGH {
            gate_seed = 0;
            wire_seed = 0;
        } else {
            let mut set = HashSet::new();
            while set.len() < 2 {
                set.insert(rng.gen_range(0..(1<< 16)));
            }
            let values = set.iter().map(|x| *x).collect::<Vec<usize>>();
            println!("The values are {:?}", values);
            gate_seed = values[0];
            wire_seed = values[1];
        }

        let g: SearchGate<NUMBER_OF_WIRES> = SearchGate::new(
            gate_seed as u16, wire_seed as u16
        );
        ref_gates.push(g);
    }

    let mut ref_circuit: SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_GATES> =
        SearchCircuit::new(ref_gates.try_into().unwrap());

    ref_circuit.sample();

    println!("The config is \n{}",ref_circuit.circuit_config_text());

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
