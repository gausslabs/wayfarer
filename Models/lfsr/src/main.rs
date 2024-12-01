extern crate lfsr_library;

use lfsr_library::{LFSR};

fn main() {
    let lfsr = LFSR::new(45, 5);
    let strings = lfsr
                .map(|n| format!("{:02x}",n))
                .collect::<Vec<_>>();
    println!("The values {:?}", strings);
}
