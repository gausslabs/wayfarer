use std::io::Result;
use std::{fs::File, io::Write, usize};
pub mod bitfield;
pub mod gate_internals;
pub mod lfsrs;
pub mod stages;
pub mod wires;
pub mod agent;

pub fn write_file(file_path: &str, contents: &str) -> Result<()> {
    let mut file = File::create(file_path)?;
    file.write_all(contents.as_bytes())
}

pub trait Layer<const NUMBER_OF_WIRES: usize> {
    type Items;

    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES];
}

pub fn bits(len: usize) -> u32 {
    (len as f32).log2().ceil() as u32
}
