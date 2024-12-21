extern crate lfsr_library;

use std::env;
use std::fs::File;
use std::io::prelude::*;
use std::io::Result;
use lfsr_library::{LFSR};

fn write_file(file_path: &str, contents: &str) -> Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())
}

fn main() {
    let args = env::args().collect::<Vec<_>>();
    
    let (destination, seed, size, exclude ) = match  args.len()   {
        1 => {
            ("input.hex", 45, 255, 8)
        },
        2 => {
            (args[1].as_str(), 45, 255, 8)
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
            (args[1].as_str(), seed, 255, 8)
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

            let exclude_result = args[3].parse::<i32>();
            let exclude = match exclude_result {
                Ok(val) => {
                    val
                },
                Err(e) =>{
                    println!("[Warning] Malformed {:?}, {:?}",args, e);
                    std::process::exit(1);
                }
            };
            (args[1].as_str(), seed, 255, exclude)
        }
        _ => {
            println!("[Warning] Arguments sent are improper {:?}",args);
            println!("[INFO] The correct format is cmd [file location] [seed]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    let lfsr = LFSR::new(seed as u8, size);
    let strings = lfsr
                .filter(|x| *x != (exclude as u8))
                .map(|n| format!("{:02x}",n))
                .collect::<Vec<_>>()
                .join("\n");

    match write_file(&destination, &strings) {
        Ok(_) => {
            println!("[INFO] Successfully written to file!");
        },
        Err(e) => {
            println!("[ERROR] Unable to write to file {:?}.",e);
        }
    };

    // println!("The values {}", strings);
}