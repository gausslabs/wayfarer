use std::collections::HashMap;

#[derive(Debug)]
pub struct BitFeild<'a> {
    feilds: Vec<(&'a str, u8)>,
    dict: HashMap<String, usize>,
}


impl<'a> BitFeild<'a> {
    pub fn new(feilds: Vec<(&'a str, u8)>) -> Self {
        Self{
            feilds,
            dict: HashMap::new()
        }
    }

    pub fn value(&self) -> usize {
        let (_, sum) = self.feilds.iter().fold((0,0), |(position, sum), &(key, shift)|{
           let mut new_sum = sum;
           let mut new_pos = position;
           new_pos += shift as usize;
           if self.dict.contains_key(key) {
               new_sum += self.dict.get(key).unwrap() << position;
           }
           (new_pos, new_sum)
        });
        sum
    }

    pub fn set(&mut self,key: &str, value: usize) -> bool{
        if self.feilds.iter().any(|&(s,_)| s == key) == false {
            return  false;
        }
        match self.dict.insert(key.to_string(), value) {
            _ => true
        }
    }
}


#[cfg(test)]
mod tests {
    // Bring everything from the outer scope into this test module.
    use super::*;

    #[test]
    fn test_bitfield_operations() {
        // Arrange
        let fields = vec![("field1", 4), ("field2", 4), ("field3", 1)];

        // Act
        let mut bitfield = BitFeild::new(fields);
        
        assert_eq!(bitfield.set("field1", 0xf), true);

        // Assert
        // Check correct value comes.
        assert_eq!(bitfield.value(), 0xf);

        // Assert
        // if the set is behaving properly
        assert_eq!(bitfield.set("field2", 0), true);
        assert_eq!(bitfield.set("field3", 1), true);
        assert_eq!(bitfield.set("f1", 0xf), false);

        // Check correct value comes.
        assert_eq!(bitfield.value(), (0xf + (1 << 8)));
    }
}