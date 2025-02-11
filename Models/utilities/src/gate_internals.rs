pub fn get_bool_vector<const BIT_WIDTH: usize>(value: usize) -> [bool; BIT_WIDTH] {
    let mut bit_store = [false; BIT_WIDTH];
    for i in 0..BIT_WIDTH {
        bit_store[i] = (((value & (1 << i)) >> i) == 1) as bool;
    }
    bit_store
}

pub fn get_value_from_bool_vector<const BIT_WIDTH: usize>(bit_store: [bool; BIT_WIDTH]) -> usize {
    let mut value: usize = 0;
    for i in 0..BIT_WIDTH {
        value = value + ((bit_store[i] as usize) * (1 << i));
    }
    value
}

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
    pub const fn from_u8(v: u8) -> Self {
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

    pub const fn evaluate(&self, a: bool, b: bool, c: bool) -> bool {
        let func = match self {
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
        };

        func ^ c
    }
}
