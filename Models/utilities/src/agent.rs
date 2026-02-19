use crate::{bitfield::BitFeild, stages::{ReferenceCircuit, SearchCircuit}, Layer};

pub struct SearchAgent<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> {
    ref_circuit: ReferenceCircuit<NUMBER_OF_WIRES,NUMBER_OF_STAGES>,
    search_circuit: SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>,
    id: usize,
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> SearchAgent<NUMBER_OF_WIRES, NUMBER_OF_STAGES> {
    pub fn new(id: usize, ref_circuit: ReferenceCircuit<NUMBER_OF_WIRES,NUMBER_OF_STAGES>, search_circuit: SearchCircuit<NUMBER_OF_WIRES, NUMBER_OF_STAGES>) -> Self {
        Self { ref_circuit, search_circuit, id }
    }

    pub fn sample(&mut self) {
        self.search_circuit.sample()
    }

    pub fn get_config(&self) -> Vec<usize> {
        // Setting up the bitfeild
        let mut bit_value: BitFeild<'_> = BitFeild::new(vec![
            ("data", 12),
            ("id", 4),
        ]);

        bit_value.set("id", self.id);

        let mut configs = vec![];
        // Stroring all the ref values
        for data in self.ref_circuit.get_config() {
            bit_value.set("data", data);
            configs.push(bit_value.value());
        }

        // Stroring all the search values
        for data in self.search_circuit.get_config() {
            bit_value.set("data", data);
            configs.push(bit_value.value());
        }

        configs
    }
}

impl<const NUMBER_OF_WIRES: usize, const NUMBER_OF_STAGES: usize> Layer<NUMBER_OF_WIRES>
    for SearchAgent<NUMBER_OF_WIRES, NUMBER_OF_STAGES>
{
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES] {
        let out = self.search_circuit.evaluate(values);
        let out = self.ref_circuit.evaluate(out);
        out
    }
}