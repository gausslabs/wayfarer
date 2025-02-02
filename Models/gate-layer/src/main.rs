use std::io::prelude::*;
use std::io::Result;
use std::{env, fs::File, io::Write, usize};
extern crate gate_internals;

use gate_internals::{Base2GateControlFunc, GetBoolVector, GetValueFromBoolVector};

#[derive(Debug)]
pub struct GateLayer<const NUMBER_OF_WIRES: usize> {
    wire_choices: [u8; 3],
    passthrough: bool,
    func: Base2GateControlFunc,
}

trait Layer<const NUMBER_OF_WIRES: usize> {
    type Items;

    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES];
}

impl<const NUMBER_OF_WIRES: usize> Layer<NUMBER_OF_WIRES> for GateLayer<NUMBER_OF_WIRES> {
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let mut out = values;
        if !self.passthrough {
            out[self.wire_choices[2] as usize] = self.func.evaluate(
                values[self.wire_choices[0] as usize],
                values[self.wire_choices[1] as usize],
            );
        }
        out
    }
}

pub struct Stages<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> {
    gates: [GateLayer<NUMBER_OF_WIRES>; NUMBER_OF_STAGES],
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> Layer<NUMBER_OF_WIRES>
    for Stages<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let mut out = values;
        out
    }
}

fn write_file(file_path: &str, contents: &str) -> Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())
}

fn main() {
    let args = env::args().collect::<Vec<_>>();

    let (input, destination) = match args.len() {
        1 => ("input.hex", "outpur.hex"),
        2 => (args[1].as_str(), "output.hex"),
        3 => (args[1].as_str(), args[2].as_str()),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [file location] [seed]. Both arguments are optional.");
            std::process::exit(1);
        }
    };
    const BIT_WIDTH: usize = 3;
    let strings = (0..(1 << BIT_WIDTH))
        .map(|n| format!("{:02x}", n))
        .collect::<Vec<_>>()
        .join("\n");

    let g: GateLayer<BIT_WIDTH> = GateLayer {
        passthrough: false,
        wire_choices: [0, 1, 2],
        func: Base2GateControlFunc::from_u8(9),
    };
    let sequence = (0..(1 << BIT_WIDTH))
        .map(|x| {
            let bool_inputs = GetBoolVector(x);
            let output = g.evaluate(bool_inputs);
            GetValueFromBoolVector(output)
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
