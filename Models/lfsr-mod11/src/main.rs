use std::{env, usize};
use local_mixing::replacement::permutations::LFSR10;
use utilities::{
    write_file
};

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let input = match args.len() {
        1 => (
            "referenceStream.hex",
        ),
        2 => (
            args[1].as_str(),
        ),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [Reference file location]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    //////////////////////////////////////////////////////////////////////////
    // Creating the reference values
    //////////////////////////////////////////////////////////////////////////
    println!("This is data for the model lfsr-mod11");
    let mut lfsr = LFSR10::new(123); 

    //////////////////////////////////////////////////////////////////////////
    // Creating input and output
    //////////////////////////////////////////////////////////////////////////

    let ref_value = (0..1024)
        .map(|_| lfsr.sample_mod_11())
        .map(|n| format!("{:04x}", n))
        .collect::<Vec<_>>()
        .join("\n");



    match write_file(&input.0, &ref_value) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        }
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.", e);
        }
    };

}
