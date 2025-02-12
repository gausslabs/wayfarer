use rand::Rng;
use std::{env, usize};
use utilities::{
    gate_internals::Base2GateControlFunc,
    stages::{Gate, ReferenceCircuit, SearchCircuit, SearchGate},
    write_file,
};

// use utilities::gate_internals::{Base2GateControlFunc, get_bool_vector, get_value_from_bool_vector};
// use utilities::stages::Gate;

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, reference, search) = match args.len() {
        1 => ("streamInput.hex", "referenceStream.hex", "searchStream.hex"),
        2 => (args[1].as_str(), "output.hex", "searchStream.hex"),
        3 => (args[1].as_str(), args[2].as_str(), "searchStream.hex"),
        4 => (args[1].as_str(), args[2].as_str(), args[3].as_str()),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [In file location] [Reference file location] [Search file location]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    const NUMBER_OF_WIRES: usize = 11;
    const NUMBER_OF_GATES: usize = 6;
    let mut rng = rand::thread_rng();
    //////////////////////////////////////////////////////////////////////////
    // Creating the reference gates
    //////////////////////////////////////////////////////////////////////////
    let mut ref_gates = vec![];
    for _i in 0..NUMBER_OF_GATES {
        let a_wire = rng.gen_range(0..=NUMBER_OF_WIRES);
        let b_wire = rng.gen_range(0..=NUMBER_OF_WIRES);
        let c_wire = rng.gen_range(0..=NUMBER_OF_WIRES);
        let operation = rng.gen_range(0..=15);

        let g: Gate<NUMBER_OF_WIRES> = Gate::new(
            [a_wire as u8, b_wire as u8, c_wire as u8],
            false,
            Base2GateControlFunc::from_u8(operation as u8),
        );
        ref_gates.push(g);
    }

    let ref_circuit: ReferenceCircuit<NUMBER_OF_WIRES, NUMBER_OF_GATES> =
        ReferenceCircuit::new(ref_gates.try_into().unwrap());

    let ref_value = ref_circuit
        .get_config()
        .iter()
        // adding an ID value of 2 
        .map(|n| *n + (2 << 12))
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    //////////////////////////////////////////////////////////////////////////
    // Creating the search gates
    //////////////////////////////////////////////////////////////////////////

    let mut search_gates = vec![];
    for _i in 0..NUMBER_OF_GATES {
        let g: SearchGate<NUMBER_OF_WIRES> = SearchGate::new(
            rng.gen_range(0..(1 << 16)) as u16,
            rng.gen_range(0..(1 << 16)) as u16,
        );
        search_gates.push(g);
    }

    let mut search_circuit: SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_GATES> =
        SearchCircuit::new(search_gates.try_into().unwrap());
    // assigning all the values;
    search_circuit.sample();
    let search_value = search_circuit
        .get_config()
        .iter()
        // adding an ID value of 2 
        .map(|n| *n + (2 << 12))
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    let ful_stream = ref_value.clone() + "\n" + &search_value.clone();

    match write_file(&input, &ful_stream) {
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

    match write_file(&search, &search_value) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };
}
