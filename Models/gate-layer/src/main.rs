use std::usize;

#[repr(u8)]
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum Base2GateControlFunc {
    F = 0,      // false,
    AND = 1,    // a & b,
    AND_NB = 2, // a & (!b),
    A = 3,      // a,
    AND_NA = 4, // (!a) & b,
    B = 5,      // b,
    XOR = 6,    // a ^ b,
    OR = 7,     // a | b,
    NOR = 8,    // !(a | b),
    EQUIV = 9,  // (a & b) | ((!a) & (!b)),
    NB = 10,    // !b,
    OR_NB = 11, // (!b) | a,
    NA = 12,    // !a,
    OR_NA = 13, // (!a) | b,
    NAND = 14,  // !(a & b),
    T = 15,     // true,
}

impl Base2GateControlFunc {
    const fn from_u8(v: u8) -> Self {
        match v {
            0 => Self::F,
            1 => Self::AND,
            2 => Self::AND_NB,
            3 => Self::A,
            4 => Self::AND_NA,
            5 => Self::B,
            6 => Self::XOR,
            7 => Self::OR,
            8 => Self::NOR,
            9 => Self::EQUIV,
            10 => Self::NB,
            11 => Self::OR_NB,
            12 => Self::NA,
            13 => Self::OR_NA,
            14 => Self::NAND,
            15 => Self::T,
            _ => unreachable!(),
        }
    }

    const fn evaluate(&self, a: bool, b: bool) -> bool {
        match self {
            Self::F => false,
            Self::AND => a & b,
            Self::AND_NB => a & (!b),
            Self::A => a,
            Self::AND_NA => (!a) & b,
            Self::B => b,
            Self::XOR => a ^ b,
            Self::OR => a | b,
            Self::NOR => !(a | b),
            Self::EQUIV => (a & b) | ((!a) & (!b)),
            Self::NB => !b,
            Self::OR_NB => (!b) | a,
            Self::NA => !a,
            Self::OR_NA => (!a) | b,
            Self::NAND => !(a & b),
            Self::T => true,
        }
    }
}

#[derive(Debug)]
pub struct GateLayer<const NUMBER_OF_WIRES: usize> {
    wire_choices: [u8; 3],
    passthrough: bool,
    func: Base2GateControlFunc
}

trait Layer< const NUMBER_OF_WIRES: usize> {
    type Items;
    
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES];
}

impl <const NUMBER_OF_WIRES: usize> Layer<NUMBER_OF_WIRES> for GateLayer<NUMBER_OF_WIRES>  {
    type Items = bool;
    fn evaluate(&self, values: [Self::Items; NUMBER_OF_WIRES]) -> [Self::Items; NUMBER_OF_WIRES]{
        let mut out = values;
        if !self.passthrough {
            out[self.wire_choices[2] as usize] = self.func.evaluate(values[self.wire_choices[0] as usize], values[self.wire_choices[1] as usize]);
        }
        out
    }
}



fn main() {
    let g: GateLayer<3> =GateLayer{
        passthrough: false,
        wire_choices:[0, 1, 2],
        func: Base2GateControlFunc::from_u8(9)
    };
    let inp = [true, true, false];
    println!("Hello, gates {:?} ==> input ({:?}) -> output ({:?})", g, inp, g.evaluate(inp) );
}
