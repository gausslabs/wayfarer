// #[derive(Hash, Eq, PartialEq, Debug, PartialOrd, Ord, Clone, Copy)]
// pub enum Wires {
//     A = 0,
//     B = 1,
//     C = 2,
//     D = 3,
// }

// pub impl GateWires for Wires {
//     type Item = u8;
//     fn new(value: u8) -> Option<Box<Self>> {
//         match value {
//             0 => Some(Box::new(Self::A)),
//             1 => Some(Box::new(Self::B)),
//             2 => Some(Box::new(Self::C)),
//             3 => Some(Box::new(Self::D)),
//             _ => None,
//         }
//     }

//     fn value(&self) -> u8 {
//         match self {
//             Self::A => 0,
//             Self::B => 1,
//             Self::C => 2,
//             Self::D => 3,
//         }
//     }

//     fn all() -> BTreeSet<Box<Self>> {
//         BTreeSet::from([Self::A, Self::B, Self::C, Self::D])
//     }

//     fn number_of_choices() -> usize {
//         let len = Self::all().len();
//         ((len - 2)..=len).product()
//     }
// }

// pub trait GateWires: Ord + PartialOrd + Clone + Copy + Debug {
//     type Item;

//     fn new(value: Self::Item) -> Option<Box<Self>>;

//     fn value(&self) -> Self::Item;

//     fn all() -> BTreeSet<Box<Self>>;

//     fn number_of_choices() -> usize {
//         let len = Self::all().len();
//         ((len - 2)..=len).product()

// }

// fn bits(len: usize) -> u32 {
//     (len as f32).log2().ceil() as u32
// }

// #[derive(Hash, Eq, PartialEq, Debug, PartialOrd, Ord, Clone)]
// pub struct WirePermutations<T: GateWires> {
//     value: T,
//     set: BTreeSet<Box<WirePermutations<T>>>,
// }

// impl<T: GateWires>  WirePermutations<T> {
//     pub fn new(value: T, _set: BTreeSet<T>) -> Self {
//         Self {
//             value: value,
//             set: BTreeSet::new(),
//         }
//     }

//     // iterating for only three levels
//     pub fn from_value(value: T, set: BTreeSet<T>, depth: u8) -> Self {
//         if depth <= 1 {
//             return Self {
//                 value: value,
//                 set: BTreeSet::new(),
//             };
//         }

//         let sub_set = set
//             .iter()
//             .clone()
//             .filter(|w| **w != value)
//             .map(|w| *w)
//             .collect::<BTreeSet<T>>();

//         let permutaion_set = sub_set
//             .iter()
//             .map(|x| Box::new(WirePermutations::from_value(*x, sub_set.clone(), depth - 1)))
//             .collect::<BTreeSet<Box<WirePermutations<T>>>>();

//         Self {
//             value: value,
//             set: permutaion_set,
//         }
//     }

//     pub fn to_string(&self, store: &mut Vec<String>) {
//         if self.set.is_empty() {
//             // base case of having no children
//             store.append(&mut vec![format!("{:#?}", self.value.value())]);
//         } else {
//             // iterating through children and appending them
//             store.append(&mut vec![format!("{:#?}", self.value.value())]);
//             for w in self.set.iter() {
//                 w.to_string(store);
//             }
//         }
//     }
// }
// #[derive(Debug)]
// pub struct PermutationTree<T: GateWires> {
//     elements: Vec<WirePermutations<T>>,
// }

// impl<T: GateWires> PermutationTree<T> {
//     pub fn generate(set: BTreeSet<T>) -> Self {
//         let mut seen = HashSet::new();
//         let tree = set
//             .iter()
//             .map(|w| WirePermutations::from_value(*w, set.clone(), 3))
//             .filter(|w| seen.insert(w.clone()))
//             .collect();

//         Self { elements: tree }
//     }

//     pub fn get_string_representation(&self) -> Vec<Vec<String>> {
//         let mut permutaion_store = Vec::new();
//         for i in self.elements.iter() {
//             // creating an 1D array strinf representation
//             let mut val = Vec::new();
//             i.to_string(&mut val);

//             // transforming it into a 2D representation
//             // with 3 columns and n rows
//             for i in 0..(((val.len() - 1) / 3) as usize) {
//                 let mut one_case = vec![val[0].clone()];
//                 one_case.extend(val.drain(1..3));
//                 let mut second_case = vec![one_case[0].clone(), one_case[1].clone()];
//                 second_case.extend(val.drain(1..2));

//                 permutaion_store.insert(i * 2, one_case.clone());
//                 permutaion_store.insert(i * 2 + 1, second_case.clone());
//             }
//         }
//         // returning
//         permutaion_store
//     }
// }
