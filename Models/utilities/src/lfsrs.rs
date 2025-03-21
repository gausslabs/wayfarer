use rand::{ Error, RngCore, SeedableRng};

fn get_tap(state: u8, n: u8) -> u8 {
    (state & (1 << n)) >> n
}

fn get_tap_16(state: u16, n: u16) -> u16 {
    (state & (1 << n)) >> n
}

// fn get_tap_t<T: Shl + BitAnd + Shr> (state: T, n: T) -> T {
//     (state & ((1 as T) << n)) >> n
// }

fn get_tap_128(state: u128, n: u128) -> u128 {
    (state & (1 << n)) >> n
}

// used this as a reference - https://datacipy.elektroniche.cz/lfsr_table.pdf

///////////////////////////////////////////////////////////////////////
// Simple 128 bit LFSR of the polynomial x^128 + x^127 + x^126 + x^121 + 1
///////////////////////////////////////////////////////////////////////
#[derive(Debug)]
pub struct LFSR128 {
    state: u128,
    size: i32,
}

impl LFSR128 {
    pub fn new(seed: u128, sequence_size: i32) -> Self {
        Self {
            state: seed,
            size: sequence_size,
        }
    }
}

impl Iterator for LFSR128 {
    type Item = u128;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size = self.size;
        self.size -= 1;
        let new  = get_tap_128(self.state, 127)
            ^ get_tap_128(self.state, 126)
            ^ get_tap_128(self.state, 125)
            ^ get_tap_128(self.state, 120);
        let old = self.state;
        self.state = (self.state << 1) | (new);
        if old_size > 0 {
            Some(old)
        } else {
            self.size = 0;
            None
        }
    }
}

///////////////////////////////////////////////////////////////////////
// Simple 16 bit LFSR of the polynomial x^16 + x^14 + x^13 + x^11 + 1
///////////////////////////////////////////////////////////////////////
#[derive(Debug)]
pub struct LFSR16 {
    state: u16,
    size: i32,
}

impl LFSR16 {
    pub fn new(seed: u16, sequence_size: i32) -> Self {
        Self {
            state: seed,
            size: sequence_size,
        }
    }
}

impl Iterator for LFSR16 {
    type Item = u16;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size = self.size;
        self.size -= 1;
        let new: u16 = get_tap_16(self.state, 15)
            ^ get_tap_16(self.state, 13)
            ^ get_tap_16(self.state, 12)
            ^ get_tap_16(self.state, 10);
        let old = self.state;
        self.state = (self.state << 1) | (new);
        if old_size > 0 {
            Some(old)
        } else {
            self.size = 0;
            None
        }
    }
}

///////////////////////////////////////////////////////////////////////
// Simple 8 bit LFSR of the polynomial x^8 + x^6 + x^5 + x^4 + 1
///////////////////////////////////////////////////////////////////////
pub struct LFSR8 {
    state: u8,
    never_stop: bool,
    size: i32,
}

impl LFSR8 {
    pub fn new(seed: u8, sequence_size: i32) -> Self {
        Self {
            state: seed,
            never_stop: false,
            size: sequence_size,
        }
    }
}

impl Iterator for LFSR8 {
    type Item = u8;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size =  self.size;
        if ! self.never_stop {
            self.size -= 1;
        }
        let new: u8 = get_tap(self.state, 7)
            ^ get_tap(self.state, 5)
            ^ get_tap(self.state, 4)
            ^ get_tap(self.state, 3);
        let old = self.state;
        self.state = (self.state << 1) | (new);
        if old_size > 0 {
            Some(old)
        } else {
            self.size = 0;
            None
        }
    }
}

impl RngCore for LFSR8 {
    
    fn next_u32(&mut self) -> u32 {
        (self.next().unwrap_or(0) as u32) << 24 |
        (self.next().unwrap_or(0) as u32) << 16 |
        (self.next().unwrap_or(0) as u32) << 8  |
         self.next().unwrap_or(0) as u32
    }

    fn next_u64(&mut self) -> u64 {
        (self.next_u32() as u64) << 32 | self.next_u32() as u64
    }

    fn fill_bytes(&mut self, dest: &mut [u8]) {
        for byte in dest.iter_mut() {
            *byte = self.next().unwrap_or(0);
        }
    }
    
    fn try_fill_bytes(&mut self, dest: &mut [u8]) -> Result<(), rand::Error> {
        for byte in dest.iter_mut() {
            *byte = self.next().unwrap_or(0); //.ok_or(Error::new(Err(128)))?;
        }
        Ok(())
    }
}

impl SeedableRng for LFSR8 {
    /// Define the type of the seed. Here we use a single-element array of `u8` for simplicity.
    type Seed = [u8; 1];
    fn from_seed(seed: Self::Seed) -> Self {
        Self{
            state: seed[0],
            never_stop: true,
            size: i32::MAX,
        }
    }
}

#[cfg(test)]
mod tests {
    use std::collections::HashMap;

    use super::*;

    #[test]
    fn first_element() {
        let mut lfsr8 = LFSR8::new(2, 2);
        let result = lfsr8.next();
        assert_eq!(result, Some(2));
    }

    #[test]
    fn max_length_test_8() {
        let seed: u8 = 45;
        let lfsr8 = LFSR8::new(seed, 256);
        let sequence = lfsr8.map(|n| n).collect::<Vec<_>>();
        let result = sequence.iter().filter(|n| **n == seed).collect::<Vec<_>>();
        assert_eq!(result, vec![&seed, &seed]);
    }

    #[test]
    fn max_length_test_16() {
        let seed: u16 = 45;
        let lfsr16 = LFSR16::new(seed, (1 << 16) + 1);
        let sequence = lfsr16.map(|n| n).collect::<Vec<_>>();
        let result = sequence.iter().filter(|n| **n == seed).collect::<Vec<_>>();
        assert_eq!(result, vec![&seed, &seed]);
    }

    #[test]
    fn none_check() {
        let mut lfsr = LFSR8::new(2, 0);
        let result = lfsr.next();
        assert_eq!(result, None);
        assert_eq!(lfsr.size, 0);
    }

    #[test]
    fn none_check_16() {
        let mut lfsr = LFSR16::new(2, 0);
        let result = lfsr.next();
        assert_eq!(result, None);
        assert_eq!(lfsr.size, 0);
    }

    #[test]
    fn cehck_distribution() {
        let mut lfsr = LFSR8::from_seed([123 as u8]);
        let mut number_of_runs = (1  << 16) * 100;
        let mut value_map: HashMap<u8, usize> = HashMap::new();
        while number_of_runs > 0 {
            number_of_runs -=1;
            let v = lfsr.next().unwrap_or(0) % 16;
            match value_map.contains_key(&v) {
                true => value_map.insert(v, value_map.get(&v).unwrap() + 1),
                false => value_map.insert(v, 1)
            };
        }
        let mut values: Vec<f64> = vec![];
        let mut sum = 0;
        let mut count = 0;
        for (k, v) in value_map {
            println!("The [mod 16] value: {} --> {} (number of elememts)", k, v);
            values.push(v as f64);
            sum += v;
            count += 1;
        }
        println!("The [mod 16] mean is {}",sum as f64 / count as f64);
        let mut std = 0.0;
        let mean = sum as f64 / count as f64;
        for i in values {
            std += (i - mean) * (i - mean);
        }
        std = std /count as f64;
        println!("The [mod 16] std is {}",std.sqrt());
        let mut number_of_runs = (1  << 16) * 100;
        let mut value_map: HashMap<u8, usize> = HashMap::new();
        while number_of_runs > 0 {
            number_of_runs -=1;
            let v = lfsr.next().unwrap_or(0) % 24;
            match value_map.contains_key(&v) {
                true => value_map.insert(v, value_map.get(&v).unwrap() + 1),
                false => value_map.insert(v, 1)
            };
        }

        let mut sum = 0;
        let mut count = 0;

        for (k, v) in value_map {
            println!("The [mod 24] value: {} --> {} (number of elememts)", k, v);
            sum += v;
            count += 1;
        }
        println!("The [mod 24] mean is {}",sum as f64 / count as f64);
        // different seed 
        let mut lfsr = LFSR8::from_seed([16 as u8]);
        let mut number_of_runs = (1  << 16) * 100;
        let mut value_map: HashMap<u8, usize> = HashMap::new();
        while number_of_runs > 0 {
            number_of_runs -=1;
            let v = lfsr.next().unwrap_or(0) % 16;
            match value_map.contains_key(&v) {
                true => value_map.insert(v, value_map.get(&v).unwrap() + 1),
                false => value_map.insert(v, 1)
            };
        }
        for (k, v) in value_map {
            println!("The [mod 16] value: {} --> {} (number of elememts)", k, v);
        }
        // let result = lfsr.next();
        // assert_eq!(result, None);
        // assert_eq!(lfsr.size, 0);
    }
}
