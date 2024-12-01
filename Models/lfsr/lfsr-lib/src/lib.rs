///////////////////////////////////////////////////////////////////////
// Simple 8 bit LFSR of the polynomial x^8 + x^6 + x^5 + x^4 + 1
///////////////////////////////////////////////////////////////////////
struct LFSR {
    state: u8,
    size: i32,
}

impl LFSR {
    fn new(seed: u8,sequence_size: i32) -> Self {
        LFSR { state: seed, size: sequence_size}
    }
}

impl Iterator for LFSR {
    type Item = u8;

    fn next(&mut self) -> Option<Self::Item> {
        let old_size = self.size;
        self.size -= 1;
        let new: u8 = (self.state & (1<< 7)) ^ (self.state & (1<< 5)) ^ (self.state & (1<< 4)) ^ (self.state & (1<< 3));
        let old = self.state;
        self.state = (self.state << 1) & (new);
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
    fn none_check() {
        let mut lfsr = LFSR::new(2, 0);
        let result = lfsr.next();
        assert_eq!(result, None);
    }

}
