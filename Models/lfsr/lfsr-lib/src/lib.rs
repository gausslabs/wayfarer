///////////////////////////////////////////////////////////////////////
// Simple 8 bit LFSR of the polynomial x^8 + x^6 + x^5 + x^4 + 1
///////////////////////////////////////////////////////////////////////
pub struct LFSR {
    state: u8,
    size: i32,
}

fn get_tap(state: u8,n: u8) -> u8 {
    (state & (1<< n)) >> n
}

impl LFSR {
    pub fn new(seed: u8,sequence_size: i32) -> Self {
        LFSR { state: seed, size: sequence_size}
    }
}

impl Iterator for LFSR {
    type Item = u8;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size = self.size;
        self.size -= 1;
        let new: u8 = get_tap(self.state,7) ^ get_tap(self.state,5) ^ get_tap(self.state,4) ^ get_tap(self.state,3);
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
        let mut lfsr = LFSR::new(2, 2);
        let result = lfsr.next();
        assert_eq!(result, Some(2));
    }

    #[test]
    fn max_length_test() {
        let seed: u8 = 45;
        let mut lfsr = LFSR::new(seed, 256);
        let sequence = lfsr.map(|n| n).collect::<Vec<_>>();
        let result = sequence.iter()
                        .filter(|n| **n == seed)
                        .collect::<Vec<_>>();
        assert_eq!(result, vec![&seed, &seed]);
    }


    #[test]
    fn none_check() {
        let mut lfsr = LFSR::new(2, 0);
        let result = lfsr.next();
        assert_eq!(result, None);
        assert_eq!(lfsr.size, 0);
    }

}
