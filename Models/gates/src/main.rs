use std::collections::{BTreeSet, HashSet};

#[derive(Hash, Eq, PartialEq, Debug, PartialOrd, Ord, Clone, Copy)]
pub enum Wires {
    A = 0,
    B = 1,
    C = 2,
}

impl Wires {
    pub fn new(value: u8) -> Option<Self> {
        match value {
            0 => Some(Self::A),
            1 => Some(Self::B),
            2 => Some(Self::C),
            _ => None
        }
    }

    pub fn value(&self) -> u8 {
        match self{
            Self::A => 0,
            Self::B => 1,
            Self::C => 2
        }
    }

    pub fn all() -> BTreeSet<Self> {
        BTreeSet::from([Self::A, Self::B, Self::C])
    }
}

#[derive(Hash, Eq, PartialEq, Debug, PartialOrd, Ord)]
pub struct WirePermutations {
    value: Wires,
    set: BTreeSet<Box<WirePermutations>>,
}

impl WirePermutations {
    pub fn new(value: Wires, _set: BTreeSet<Wires>) -> Self {
        Self { value: value, set: BTreeSet::new() }
    }

    pub fn from_value(value: Wires, set: BTreeSet<Wires>) -> Self {
        if set.is_empty(){
            return Self { value: value, set: BTreeSet::new() };
        }

        let sub_set = set.iter().clone().filter(|w| **w != value).map(|w|*w).collect::<BTreeSet<Wires>>();

        let permutaion_set = sub_set.iter()
            .map(|x|{ 
                Box::new(WirePermutations::from_value(*x, sub_set.clone()))
            }).collect::<BTreeSet<Box<WirePermutations>>>();
        
        Self { value: value, set: permutaion_set }
    }
}
#[derive(Debug)]
pub struct PermutationTree {
    elements: HashSet<WirePermutations>,
}

impl PermutationTree {
    pub fn generate(set: BTreeSet<Wires>) -> Self{
        let tree = set.iter().map(|w|{ 
            WirePermutations::from_value(*w, set.clone())
        });

        Self { elements: HashSet::from_iter(tree) }
    }
}

fn main() {
    let root = PermutationTree::generate(Wires::all());
    println!("The tree is as follows!");
    for i in root.elements.iter(){
        let v = format!("{:?} => {:?}",i.value,i.set);
        println!("The elements are {:?}",v);
    }
}
