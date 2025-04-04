use std::u128;

use local_mixing::replacement::permutations::{riffle_shuffle, walksman_permutation_5};
use local_mixing::replacement::{lfsr::WireEntries};
use local_mixing::replacement::{permutations::walksman_permutation_10};


fn int_wire(w: WireEntries) -> usize {
    let value = w.position as usize & ((1 << 4) - 1);
    let value = value + ((w.present as usize) << 4);
    value
}

fn string_wires(wires: &[WireEntries], start_value: u128) -> String {
    let mut value: u128 = start_value;
    for (_i, &w) in wires.iter().enumerate() {
        value = (value << (5) ) | int_wire(w) as u128;
    }
    format!("{:021x}",value)
}

fn config_from_int(index: usize) -> Vec<bool> {
    let mut control = vec![];
    for i in 0..32 {
        control.push(((index >> i) & 1) == 1);
    }

    control
}

fn flatten(wire: [[WireEntries;5];2]) -> [WireEntries;10] {
    let mut flattened = [WireEntries::default();10];
    for i in 0..10 {
        if i < 5 {
            flattened[i] = wire[0][i];
        } else {
            flattened[i] = wire[1][i - 5];
        }
    }

    flattened
}

fn reshape(wire: [WireEntries;10]) -> [[WireEntries;5];2] {
    let mut reshaped = [[WireEntries::default();5];2];
    for i in 0..10 {
        if i < 5 {
            reshaped[0][i] = wire[i];
        } else {
            reshaped[1][i-5] = wire[i];
        }
    }

    reshaped
}


fn collision_check (wires: [WireEntries;3]) -> bool {
    (wires[0].present & wires[1].present & (wires[0].position == wires[1].position)) | (wires[0].present & wires[2].present & (wires[0].position == wires[2].position))
}

#[derive(Debug)]
pub struct LFSR {
    state: u32,
}

fn get_tap(state: u32,n: u32) -> u32 {
    (state & (1<< n)) >> n
}

impl LFSR {
    pub fn new(seed: u32) -> Self {
        LFSR { state: seed}
    }
}

impl LFSR {

    fn next(&mut self) -> u32 {
        let new  = get_tap(self.state,7) ^ get_tap(self.state,5) ^ get_tap(self.state,4) ^ get_tap(self.state,3);
        let old = self.state;
        self.state = (self.state << 1) | (new);
        old
    }
}

#[derive(Debug)]
pub struct WireMatrix {
    controls: [[WireEntries;5];2],
    targets: [WireEntries;5],
    seed: u32,
    lfsr: LFSR 
}


impl WireMatrix {
    pub fn new(wires: [[WireEntries;5];3], seed: u32) -> Self {
        Self { controls: [wires[1], wires[2]], targets: wires[0], lfsr: LFSR::new(seed), seed: seed }
    }

    pub fn as_string (&self) -> String {
        let all_wires = self.targets.clone().into_iter().chain(self.controls[0].clone().into_iter().chain(self.controls[1].clone().into_iter())).collect::<Vec<_>>();
        string_wires(&all_wires, self.seed as u128)

    } 

    pub fn shuffle(&mut self) {
        loop {
        let conf = self.lfsr.next() as usize;
        let config = config_from_int(conf);

        let mut flattened_controls = flatten(self.controls);
        
        // println!("The flattened controls are \n {:?}", flattened_controls);
        flattened_controls = riffle_shuffle(&flattened_controls, config[26]);
        // println!("The riffled controls are \n {:?}", flattened_controls);
        flattened_controls.rotate_left(config[25] as usize);
        // println!("The rotated controls are \n {:?}", flattened_controls);

        flattened_controls = walksman_permutation_10(&flattened_controls, &config[0..25]);

        self.controls = reshape(flattened_controls);
        
        let mut flattened_targets = self.targets.clone();
        
        flattened_targets = riffle_shuffle(&flattened_targets, config[3]);
        flattened_targets.rotate_left(config[2] as usize);

        flattened_targets = walksman_permutation_5(&flattened_targets, &config[0..=2].into_iter().chain(config[27..=31].into_iter()).map(|x| *x).collect::<Vec<bool>>());

        self.targets = flattened_targets; 
        if !self.collision() {
            break;
        }
        println!("In a collisiion  with state = {}",conf);
        }
    }

    fn collision(&self) -> bool {
        let mut ans = false;

        for i in 0..5 {
            ans = ans | collision_check([self.targets[i], self.controls[0][i], self.controls[1][i]]);
            ans = ans | collision_check([self.controls[0][i], self.controls[1][i], self.targets[i]]);
            ans = ans | collision_check([self.controls[1][i], self.targets[i], self.controls[0][i] ]);
        }

        ans
    }
}


#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_shuffle() {
        let wires = [[WireEntries{present:false, position: 0}, WireEntries{present:false, position: 1}, WireEntries{present:false, position: 2}, WireEntries{present:false, position: 3}, WireEntries{present:false, position: 4}],
        [WireEntries{present:false, position: 5}, WireEntries{present:false, position: 6}, WireEntries{present:false, position: 7}, WireEntries{present:false, position: 8}, WireEntries{present:false, position:9}],
        [WireEntries{present:false, position: 10}, WireEntries{present:false, position: 11}, WireEntries{present:false, position: 12}, WireEntries{present:false, position: 13}, WireEntries{present:false, position: 14}]];

        let mut wr = WireMatrix::new(wires, 123);

        println!("The initial wires are \n {}",wr.as_string());
        println!("The initial controls are \n {:?}",wr.controls);
        println!("The initial targets are \n {:?}",wr.targets);

        wr.shuffle();

        println!("The second wires are \n {}",wr.as_string());
        println!("The second controls are \n {:?}",wr.controls);
        println!("The second targets are \n {:?}",wr.targets);

        wr.shuffle();

        println!("The third wires are \n {}",wr.as_string());
        println!("The third controls are \n {:?}",wr.controls);
        println!("The third targets are \n {:?}",wr.targets);


    }
}
