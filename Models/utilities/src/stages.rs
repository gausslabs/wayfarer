use std::fmt::format;

use crate::bitfield::BitFeild;
use crate::lfsrs::LFSR16;

use super::gate_internals::Base2GateControlFunc;
use super::*;

/////////////////////////////////////////////////////////////////
// utilities
/////////////////////////////////////////////////////////////////

pub fn byte_vector_from(value: usize, number_of_bytes: usize) -> Vec<u8> {
    let mut store = vec![];
    let byte_mask: usize = (1 << 8) - 1;
    for i in 0..number_of_bytes {
        let v = (value >> (8 * i)) & byte_mask;
        store.push(v as u8);
    }
    store
}

pub const fn n_p_3(size: usize) -> usize {
    size * (size - 1) * (size - 2)
}

// TODO:
// Make it a const func without clone, for loops and vec.
pub fn get_wire_permutations<const NUMBER_OF_WIRES: usize>() -> Vec<[usize; 3]> {
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
const REFERENCE_BYTES_IN_CONFIG: usize = 2;
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

    pub fn get_config_as_bytes(&self) -> Vec<u8> {
        byte_vector_from(self.get_config(), REFERENCE_BYTES_IN_CONFIG)
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

    pub fn get_config(&self) -> Vec<usize> {
        // Setting up the bitfeild
        let mut bit_value = BitFeild::new(vec![
            ("data", 8),
            ("id", bits(NUMBER_OF_STAGES) as u8),
            ("configType", 1),
        ]);

        // setting config type to REFERENCE
        bit_value.set("configType", 0);

        // Iterating over the gates config and adding the agent config
        let mut configs = vec![];
        for (i, val) in self.get_config_as_bytes().iter().enumerate() {
            bit_value.set("id", (i / REFERENCE_BYTES_IN_CONFIG) as usize);
            bit_value.set("data", *val as usize);
            configs.push(bit_value.value());
        }
        configs
    }

    pub fn get_config_as_bytes(&self) -> Vec<u8> {
        let mut store = vec![];
        for i in 0..NUMBER_OF_STAGES {
            store.append(&mut self.gates[i].get_config_as_bytes());
        }
        store
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
const SEARCH_BYTES_IN_CONFIG: usize = 4;
#[derive(Debug)]
pub struct SearchGate<const NUMBER_OF_WIRES: usize> {
    wire_permutations: Vec<[usize; 3]>,
    wire_choices: [usize; 3],
    func: Base2GateControlFunc,
    permutation_index: usize,
    gate_index: usize,
    gate_seed: u16,
    wire_seed: u16,
    gate_lfsr: LFSR16,
    wire_lfsr: LFSR16,
}

impl<const NUMBER_OF_WIRES: usize> SearchGate<NUMBER_OF_WIRES> {
    pub fn new(gate_seed: u16, wire_seed: u16) -> Self {
        Self {
            wire_permutations: get_wire_permutations::<NUMBER_OF_WIRES>(),
            wire_choices: [0; 3],
            func: Base2GateControlFunc::from_u8(0),
            gate_seed: gate_seed,
            wire_seed: wire_seed,
            permutation_index: 0,
            gate_index: 0,
            gate_lfsr: LFSR16::new(gate_seed, 1 << 16),
            wire_lfsr: LFSR16::new(wire_seed, 1 << 16),
        }
    }

    pub fn config_text(&self) -> String {
        format!("wire permutation -> {}, gate index -> {}, wire choices {:?}, wire seed {}, gate seed {}", self.permutation_index, self.gate_index % 16, self.wire_choices, self.wire_seed, self.gate_seed)
    }

    pub fn sample(&mut self) {
        let perm_size = bits(n_p_3(NUMBER_OF_WIRES));
        let permutation_mask = (1 << perm_size) - 1;
        self.permutation_index = (self.wire_lfsr.next().unwrap() & permutation_mask) as usize
            % self.wire_permutations.len();
        self.gate_index = self.gate_lfsr.next().unwrap() as usize % 256;
        self.wire_choices = self.wire_permutations[self.permutation_index];
        self.func = Base2GateControlFunc::from_u8((self.gate_index % 16) as u8)
    }

    pub fn get_config(&self) -> usize {
        let mut bit_value = BitFeild::new(vec![("wireSelectionSeed", 16), ("gateSeed", 16)]);
        // setting the wire selections
        bit_value.set("wireSelectionSeed", self.wire_seed as usize);
        // setting the gate values
        bit_value.set("gateSeed", self.gate_seed as usize);
        bit_value.value()
    }

    pub fn get_config_as_bytes(&self) -> Vec<u8> {
        byte_vector_from(self.get_config(), SEARCH_BYTES_IN_CONFIG)
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

    pub fn circuit_config_text(&self) -> String {
        self.gates.iter().enumerate().map(|(i,n)| format!("{}: {}",i,  n.config_text()))
        .collect::<Vec<_>>()
        .join("\n")
    }

    pub fn get_config(&self) -> Vec<usize> {
        // Setting up the bitfeild
        let mut bit_value = BitFeild::new(vec![
            ("data", 8),
            ("id", bits(NUMBER_OF_STAGES) as u8),
            ("configType", 1),
        ]);

        // setting config type to SEARCH
        bit_value.set("configType", 1);

        // Iterating over the gates config and adding the agent config
        let mut configs = vec![];
        for (i, val) in self.get_config_as_bytes().iter().enumerate() {
            bit_value.set("id", (i / SEARCH_BYTES_IN_CONFIG) as usize);
            bit_value.set("data", *val as usize);
            configs.push(bit_value.value());
        }
        configs
    }

    pub fn get_config_as_bytes(&self) -> Vec<u8> {
        let mut store = vec![];
        for i in 0..NUMBER_OF_STAGES {
            store.append(&mut self.gates[i].get_config_as_bytes());
        }
        store
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
        for i in perms {
            set.insert(i);
        }
        assert_eq!(set.len(), PERMUTATION_SIZE)
    }
}
