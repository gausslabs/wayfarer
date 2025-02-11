fn get_tap(state: u8, n: u8) -> u8 {
    (state & (1 << n)) >> n
}

fn get_tap_16(state: u16, n: u16) -> u16 {
    (state & (1 << n)) >> n
}

// used this as a reference - https://datacipy.elektroniche.cz/lfsr_table.pdf

///////////////////////////////////////////////////////////////////////
// Simple 8 bit LFSR of the polynomial x^16 + x^14 + x^13 + x^11 + 1
///////////////////////////////////////////////////////////////////////
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
    size: i32,
}

impl LFSR8 {
    pub fn new(seed: u8, sequence_size: i32) -> Self {
        Self {
            state: seed,
            size: sequence_size,
        }
    }
}

impl Iterator for LFSR8 {
    type Item = u8;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size = self.size;
        self.size -= 1;
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

#[cfg(test)]
mod tests {
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
}
