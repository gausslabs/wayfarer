use crate::bitfield::BitFeild;

use super::gate_internals::Base2GateControlFunc;
use super::*;

#[derive(Debug)]
pub struct GateLayer<const NUMBER_OF_WIRES: usize> {
    wire_choices: [u8; 3],
    passthrough: bool,
    func: Base2GateControlFunc,
}

impl<const NUMBER_OF_WIRES: usize> GateLayer<NUMBER_OF_WIRES> {

    pub fn new(wire_choices: [u8; 3], passthrough: bool, func: Base2GateControlFunc,) -> Self {
        Self { wire_choices, passthrough, func }
    }

    pub fn get_config(&self) -> usize {
        let mut bit_value = BitFeild::new(vec![
            ("aSelect", 4),
            ("bSelect", 4),
            ("cSelect", 4),
            ("gateSelect", 4),
        ]);
        // setting the wire selections
        bit_value.set("aSelect", self.wire_choices[0] as usize);
        bit_value.set("bSelect", self.wire_choices[1] as usize);
        bit_value.set("cSelect", self.wire_choices[2] as usize);
        // setting the gate values
        bit_value.set("gateSelect", self.func.value() as usize);
        bit_value.value()
    }
}

impl<const NUMBER_OF_WIRES: usize> Layer<NUMBER_OF_WIRES> for GateLayer<NUMBER_OF_WIRES> {
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let mut out = values;
        if !self.passthrough {
            out[self.wire_choices[2] as usize] = self.func.evaluate(
                values[self.wire_choices[0] as usize],
                values[self.wire_choices[1] as usize],
                values[self.wire_choices[2] as usize],
            );
        }
        out
    }
}

pub struct Stages<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> {
    gates: [GateLayer<NUMBER_OF_WIRES>; NUMBER_OF_STAGES],
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize>
    Stages<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    pub fn new(gates: [GateLayer<NUMBER_OF_WIRES>; NUMBER_OF_STAGES]) -> Self {
        Self { gates }
    }

    pub fn get_config(&self) -> [usize; NUMBER_OF_STAGES] {
        let mut configs = [0; NUMBER_OF_STAGES];
        for i in 0..NUMBER_OF_STAGES {
            configs[i] = self.gates[i].get_config()
        }
        configs
    }
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> Layer<NUMBER_OF_WIRES>
    for Stages<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let mut out = values;
        for i in 0..NUMBER_OF_STAGES {
            out = self.gates[i].evaluate(out)
        }
        out
    }
}
