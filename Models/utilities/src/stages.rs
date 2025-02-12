use crate::bitfield::BitFeild;
use crate::lfsrs::LFSR16;

use super::gate_internals::Base2GateControlFunc;
use super::*;

/////////////////////////////////////////////////////////////////
// utilities
/////////////////////////////////////////////////////////////////

pub const fn n_p_3(size: usize) -> usize {
    size * (size - 1) * (size - 2)
}

// TODO:
// Make it a const func without clone, for loops and vec.
pub fn get_wire_permutations<const NUMBER_OF_WIRES: usize>(
) -> Vec<[usize; 3]> {
    let mut all = vec![];
    // let mut count = 0;
    for i in 0..NUMBER_OF_WIRES {
        let mut active_vals = [0; 3];
        active_vals[0] = i;
        for j in 0..NUMBER_OF_WIRES {
            if j != i {
                active_vals[1] = j;
                for k in 0..NUMBER_OF_WIRES {
                    if k == i || k == j {
                        continue;
                    } else {
                        active_vals[2] = k;
                        all.push(active_vals.clone());
                        // count += 1;
                    }
                }
            }
        }
    }
    all
}

/////////////////////////////////////////////////////////////////
// Reference modules
/////////////////////////////////////////////////////////////////

#[derive(Debug)]
pub struct Gate<const NUMBER_OF_WIRES: usize> {
    wire_choices: [u8; 3],
    passthrough: bool,
    func: Base2GateControlFunc,
}

impl<const NUMBER_OF_WIRES: usize> Gate<NUMBER_OF_WIRES> {
    pub fn new(wire_choices: [u8; 3], passthrough: bool, func: Base2GateControlFunc) -> Self {
        Self {
            wire_choices,
            passthrough,
            func,
        }
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

impl<const NUMBER_OF_WIRES: usize> Layer<NUMBER_OF_WIRES> for Gate<NUMBER_OF_WIRES> {
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

pub struct ReferenceCircuit<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> {
    gates: [Gate<NUMBER_OF_WIRES>; NUMBER_OF_STAGES],
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize>
    ReferenceCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    pub fn new(gates: [Gate<NUMBER_OF_WIRES>; NUMBER_OF_STAGES]) -> Self {
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
    for ReferenceCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
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

/////////////////////////////////////////////////////////////////
// Search modules
/////////////////////////////////////////////////////////////////

#[derive(Debug)]
pub struct SearchGate<const NUMBER_OF_WIRES: usize> {
    wire_permutations: Vec<[usize; 3]>,
    wire_choices: [usize;3],
    func: Base2GateControlFunc,
    gate_seed: u16,
    wire_seed: u16,
    gate_lfsr: LFSR16,
    wire_lfsr: LFSR16,
}

impl<const NUMBER_OF_WIRES: usize> SearchGate<NUMBER_OF_WIRES> {
    pub fn new(gate_seed: u16, wire_seed: u16) -> Self {
         
        Self {
            wire_permutations: get_wire_permutations::<NUMBER_OF_WIRES>(),
            wire_choices: [0;3],
            func:Base2GateControlFunc::from_u8(0),
            gate_seed: gate_seed,
            wire_seed: wire_seed,
            gate_lfsr: LFSR16::new(gate_seed, 1 << 16),
            wire_lfsr: LFSR16::new(wire_seed, 1 << 16),
        }
    }

    pub fn sample(&mut self) {
        let perm_size = bits(n_p_3(NUMBER_OF_WIRES));
        let permutation_mask = (1<<perm_size) - 1;
        let permutation_index = (self.wire_lfsr.next().unwrap() & permutation_mask) as usize  % self.wire_permutations.len();
        let gate_index = self.gate_lfsr.next().unwrap() % 256; 
        self.wire_choices = self.wire_permutations[permutation_index];
        self.func = Base2GateControlFunc::from_u8(gate_index as u8)
    }

    pub fn get_config(&self) -> usize {
        let mut bit_value = BitFeild::new(vec![
            ("gateSeed", 16),
            ("wireSelectionSeed", 16),
        ]);
        // setting the wire selections
        bit_value.set("wireSelectionSeed", self.wire_seed as usize);
        // setting the gate values
        bit_value.set("gateSeed", self.gate_seed as usize);
        bit_value.value()
    }
}

impl<const NUMBER_OF_WIRES: usize> Layer<NUMBER_OF_WIRES> for SearchGate<NUMBER_OF_WIRES> {
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let mut out = values;
        out[self.wire_choices[2] as usize] = self.func.evaluate(
            values[self.wire_choices[0] as usize],
            values[self.wire_choices[1] as usize],
            values[self.wire_choices[2] as usize],
        );
        out
    }
}

pub struct SearchCircuit<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> {
    gates: [SearchGate<NUMBER_OF_WIRES>; NUMBER_OF_STAGES],
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize>
    SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    pub fn new(gates: [SearchGate<NUMBER_OF_WIRES>; NUMBER_OF_STAGES]) -> Self {
        Self { gates }
    }

    pub fn sample(&mut self) {
        for i in 0..NUMBER_OF_STAGES {
            self.gates[i].sample()
        }
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
    for SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
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

/////////////////////////////////////////////////////////////////
// tests
/////////////////////////////////////////////////////////////////

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashSet;

    #[test]
    fn wire_permutations() {
        const NUMBER_OF_WIRES: usize = 13;
        const PERMUTATION_SIZE: usize = n_p_3(NUMBER_OF_WIRES);
        let perms = get_wire_permutations::<NUMBER_OF_WIRES>();
        let mut set = HashSet::new();
        for i in perms{
            set.insert(i);
        }
        assert_eq!(set.len(), PERMUTATION_SIZE)
    }
}
