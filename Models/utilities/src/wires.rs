use std::collections::BTreeSet;

macro_rules! create_wire_enum {
    ($name:ident<$output:ty> { $($variant:ident = $value:expr),* $(,)? }) => {
        #[derive(Debug, Clone, PartialEq, Eq, Ord, PartialOrd)]
        pub enum $name {
            $($variant),*
        }

        impl $name {
            pub fn all() -> BTreeSet<Self> {
                BTreeSet::from([$(Self::$variant),*])
            }

            pub fn value(&self) -> $output {
                match self {
                    $(Self::$variant => $value as $output),*
                }
            }

            pub fn new(val: $output) -> Self {
                match val {
                    $($value => Self::$variant,)*
                    _ => unreachable!()
                }
            }

            pub fn number_of_choices() -> usize {
                let len = Self::all().len();
                ((len - 2)..=len).product()
            }
        }
    };
}

create_wire_enum! {
    Wires<u16>{
        Wire1 = 1,
        Wire2 = 2,
        Wire3 = 3,
        Wire4 = 4,
        Wire5 = 5,
        Wire6 = 6,
        Wire7 = 7,
        Wire8 = 8,
        Wire9 = 9,
        Wire10 = 10,
        Wire11 = 11,
    }
}
