macro_rules! create_wire_enum {
    ($name:ident<$output:ty> { $($variant:ident = $value:expr),* $(,)? }) => {
        #[derive(Debug, Clone, PartialEq, Eq)]
        pub enum $name {
            $($variant),*
        }

        impl $name {
            pub fn all_variants() -> Vec<Self> {
                vec![$(Self::$variant),*]
            }

            pub fn get_value(&self) -> $output {
                match self {
                    $(Self::$variant => $value as $output),*
                }
            }

            pub fn value_from(val: $output) -> Self {
                match val {
                    $($value => Self::$variant,)*
                    _ => unreachable!()
                }
            }
        }
    };
}

create_wire_enum! {
    Wires<u8>{
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
