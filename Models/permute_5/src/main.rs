use rand::Rng;
use std::{env, usize};
use utilities::{
    write_file
};

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
    let mut rng = rand::thread_rng();
    //////////////////////////////////////////////////////////////////////////
    // Creating the reference values
    //////////////////////////////////////////////////////////////////////////
    println!("This is data for the model permute_5");

    let config_value = (0..10)
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    //////////////////////////////////////////////////////////////////////////
    // Creating input and output
    //////////////////////////////////////////////////////////////////////////

    let ref_value = (0..10)
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    let sequence = (0..10)
        .map(|_| rng.gen_range(0..100))
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
}
