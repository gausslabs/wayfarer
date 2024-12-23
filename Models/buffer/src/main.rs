use rand::{SeedableRng, Rng};
use std::env;
use std::fs::File;
use std::io::prelude::*;
use std::io::Result;

fn write_file(file_path: &str, contents: &str) -> Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())
}

fn main() {
    let args = env::args().collect::<Vec<_>>();
    
    let (destination, seed, size ) = match  args.len()   {
        1 => {
            ("input.hex", 1234, 255)
        },
        2 => {
            (args[1].as_str(), 45, 255)
        },
        3 => {
            let seed_result = args[2].parse::<i32>();
            let seed = match seed_result {
                Ok(val) => {
                    val
                },
                Err(e) =>{
                    println!("[Warning] Malformed {:?}, {:?}",args, e);
                    std::process::exit(1);
                }
            };
            (args[1].as_str(), seed, 255)
        },
        4 => {
            let seed_result = args[2].parse::<i32>();
            let seed = match seed_result {
                Ok(val) => {
                    val
                },
                Err(e) =>{
                    println!("[Warning] Malformed {:?}, {:?}",args, e);
                    std::process::exit(1);
                }
            };

            let size_result = args[3].parse::<i32>();
            let size = match size_result {
                Ok(val) => {
                    val
                },
                Err(e) =>{
                    println!("[Warning] Malformed {:?}, {:?}",args, e);
                    std::process::exit(1);
                }
            };
            (args[1].as_str(), seed, size)
        }
        _ => {
            println!("[Warning] Arguments sent are improper {:?}",args);
            println!("[INFO] The correct format is cmd [file location] [seed] [size]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    let mut rng = rand::rngs::StdRng::seed_from_u64(seed as u64);
    let strings = std::iter::repeat_with(move || rng.gen_range(0..((1 << 16) as usize)))
        .take(size as usize)
        .map(|x| format!("{:04x}", x))
        .collect::<Vec<String>>()
        .join("\n");
    match write_file(&destination, &strings) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        },
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.",e);
        }
    };
}
