use std::{collections::{BTreeSet, HashSet}, error::Error, fs};

#[derive(Hash, Eq, PartialEq, Debug, PartialOrd, Ord, Clone, Copy)]
pub enum Wires {
    A = 0,
    B = 1,
    C = 2,
    D = 3,
}

impl Wires {
    pub fn new(value: u8) -> Option<Self> {
        match value {
            0 => Some(Self::A),
            1 => Some(Self::B),
            2 => Some(Self::C),
            3 => Some(Self::D),
            _ => None
        }
    }

    pub fn value(&self) -> u8 {
        match self{
            Self::A => 0,
            Self::B => 1,
            Self::C => 2,
            Self::D => 3,
        }
    }

    pub fn all() -> BTreeSet<Self> {
        BTreeSet::from([Self::A, Self::B, Self::C, Self::D])
    }

    pub fn number_of_choices() -> usize {
        let len = Self::all().len();
        ((len -2)..=len).product()
    }
    
}

fn bits(len: usize) -> u32 {
    (len as f32).log2().ceil() as u32
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

    // iterating for only three levels
    pub fn from_value(value: Wires, set: BTreeSet<Wires>, depth: u8) -> Self {
        if depth <= 1{
            return Self { value: value, set: BTreeSet::new() };
        }

        let sub_set = set.iter().clone().filter(|w| **w != value).map(|w|*w).collect::<BTreeSet<Wires>>();

        let permutaion_set = sub_set.iter()
            .map(|x|{ 
                Box::new(WirePermutations::from_value(*x, sub_set.clone(), depth - 1))
            }).collect::<BTreeSet<Box<WirePermutations>>>();
        
        Self { value: value, set: permutaion_set }
    }

    pub fn to_string(&self, store: &mut Vec<String>) {
        if self.set.is_empty(){
            // base case of having no children
            store.append(&mut vec![format!("{}", self.value.value())]);
        } else {

        // iterating through children and appending them
        store.append(&mut vec![format!("{}", self.value.value())]);
        for w in self.set.iter(){
            w.to_string(store);
        }
        }
    }
}
#[derive(Debug)]
pub struct PermutationTree {
    elements: HashSet<WirePermutations>,
}

impl PermutationTree {
    pub fn generate(set: BTreeSet<Wires>) -> Self{
        let tree = set.iter().map(|w|{ 
            WirePermutations::from_value(*w, set.clone(), 3)
        });

        Self { elements: HashSet::from_iter(tree) }
    }

    pub fn get_string_representation(&self) -> Vec<Vec<String>> {
        let mut permutaion_store = Vec::new();
        for i in self.elements.iter(){

            // creating an 1D array strinf representation
            let mut val = Vec::new();
            i.to_string(&mut val);
            
            // transforming it into a 2D representation
            // with 3 columns and n rows
            for i in 0..(((val.len() - 1)/3) as usize){
                let mut one_case = vec![val[0].clone() ];
                one_case.extend(val.drain(1..3));
                let mut second_case = vec![one_case[0].clone(), one_case[1].clone()];
                second_case.extend(val.drain(1..2));
               
                permutaion_store.insert(i*2, one_case.clone());
                permutaion_store.insert(i*2 + 1, second_case.clone());
            }
    
        }
        // returning 
        permutaion_store
    }
}
#[macro_use(lazy_static)]
extern crate lazy_static;
use serde::Serialize;
use tera::{Context, Tera};

lazy_static! {
    pub static ref TEMPLATES: Tera = {
        let mut tera = match Tera::new("templates/**/*") {
            Ok(t) => t,
            Err(e) => {
                println!("Parsing error(s): {}", e);
                ::std::process::exit(1);
            }
        };
        tera.autoescape_on(vec![".sv"]);
        tera
    };
}

#[derive(Debug, Serialize)]
pub struct Case{
    index: usize,
    permutations: Vec<Permutation>,
}

#[derive(Debug, Serialize)]
pub struct Permutation{
    index: usize,
    value: String,
}

fn main() -> std::io::Result<()>{
    let root = PermutationTree::generate(Wires::all());
    // println!("The tree is as follows!");
    let permutaion_store = root.get_string_representation();
    // println!("The full 2D list \n{:?}",permutaion_store);
    // println!("The full list \n{:?}",permutaion_store.iter().map(|v|v.join(",")).collect::<Vec<String>>());
    let cases = permutaion_store.iter().enumerate().map(|(i, s)|{
        Case{index:i, permutations: s.iter().enumerate().map(|(i,p)| Permutation{index:i, value:p.clone()}).collect::<Vec<Permutation>>()}
    }).collect::<Vec<Case>>();
    // println!("The full 2D list \n{:?}",cases);
    let default = &cases[0];
    println!("The default \n{:?}",default);
    let mut context = Context::new();
    context.insert("module_name", &"SafePermutationGenerator");
    context.insert("perm_size", &bits(Wires::number_of_choices()));
    context.insert("port_size", &bits(Wires::all().len()));
    context.insert("cases", &cases);
    context.insert("default", &default);

    // A one off template
    Tera::one_off("hello", &Context::new(), true).unwrap();

    match TEMPLATES.render("case_generator.sv.tpl", &context) {
        Ok(s) => {
            fs::write("permutation.sv", s)?;
        },
        Err(e) => {
            println!("Error: {}", e);
            let mut cause = e.source();
            while let Some(e) = cause {
                println!("Reason: {}", e);
                cause = e.source();
            }
        }
    };  
    Ok(())
}
