use std::u128;

use local_mixing::replacement::permutations::{riffle_shuffle, walksman_permutation_5};
use local_mixing::replacement::lfsr::WireEntries;
use local_mixing::replacement::permutations::walksman_permutation_10;


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

fn config_from_int<const NUMBER_ELEMENTS: usize>(index: usize) -> Vec<bool> {
    let mut control = vec![];
    for i in 0..NUMBER_ELEMENTS {
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
        let new  = get_tap(self.state,31) ^ get_tap(self.state,29) ^ get_tap(self.state,25) ^ get_tap(self.state,24);
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
        let config = config_from_int::<32>(conf);

        self.shuffle_data(config);
        
        if !self.collision() {
            break;
        }
        println!("In a collisiion  with state = {}",conf);
        }
    }

    pub fn shuffle_data_new(&mut self, config_targets: Vec<bool>, config_controls: Vec<bool>) {

        // println!("The un-flattened controls are \n {:?}", self.controls);
        let mut flattened_controls = flatten(self.controls);
        
        // println!("The flattened controls are \n {:?}", flattened_controls);
        flattened_controls = riffle_shuffle(&flattened_controls, config_controls[26]);
        // println!("The riffled controls are \n {:?}", flattened_controls);
        flattened_controls.rotate_left(config_controls[25] as usize);
        // println!("The rotated controls are \n {:?}", flattened_controls);
        
        flattened_controls = walksman_permutation_10(&flattened_controls, &config_controls[0..25]);
        // println!("The permuted controls are \n {:?}", flattened_controls);

        self.controls = reshape(flattened_controls);
        
        let mut flattened_targets = self.targets.clone();
        
        flattened_targets = riffle_shuffle(&flattened_targets, config_targets[0]);
        flattened_targets.rotate_left(config_targets[1] as usize);

        flattened_targets = walksman_permutation_5(&flattened_targets, &config_targets[2..]);

        self.targets = flattened_targets;
    }

    pub fn shuffle_data(&mut self, config: Vec<bool>) {

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
    use std::{collections::{HashMap, HashSet}, fmt::Pointer, usize};
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

    #[test]
    fn test_shuffle_distribution( ) {
        let mut set: HashSet<[[WireEntries;5];3]> = HashSet::new();
        // The size should be 10!(3628800) * 5!(120)
        const SET_SIZE: usize = 435456000;    

        let mut wire_data: [[WireEntries;5];3] = [[WireEntries::default();5];3];
        let mut pointer = 0;
        for i in 0..3 {

            for j in 0..5 {
                wire_data[i][j].position = pointer;
                pointer += 1;
            }
            
        }
        
        println!("The wires base are {:?}", wire_data);

        assert!(set.insert(wire_data.clone()));

        let mut wr = WireMatrix::new(wire_data, 123123);

        let max: u64 = 1 << 30;

        for  _ in 0..max {
            let conf = wr.lfsr.next() as usize;
            let config = config_from_int::<32>(conf);
            wr.shuffle_data(config);
            set.insert([wr.targets.clone(), wr.controls[0].clone(), wr.controls[1].clone()]);
        }

        println!("The set size is {:?}", set.len());

        assert!(set.len() == SET_SIZE, "The set size should be 0")
    }

    #[test]
    fn test_shuffle_distribution_new( ) {
        let mut set: HashSet<[[WireEntries;5];3]> = HashSet::new();
        // The size should be 10!(3628800) * 5!(120)
        const SET_SIZE: usize = 435456000;    

        let mut wire_data: [[WireEntries;5];3] = [[WireEntries::default();5];3];
        let mut pointer = 0;
        for i in 0..3 {

            for j in 0..5 {
                wire_data[i][j].position = pointer;
                pointer +=1;
            }
            
        }
        
        println!("The wires base are {:?}", wire_data);

        assert!(set.insert(wire_data.clone()));

        let mut wr = WireMatrix::new(wire_data, 345668);
        let mut second_lfsr = LFSR::new(12332);

        let max: u64 = 1 << 29;

        for _i in 0..max {
            let conf = wr.lfsr.next() as usize;
            let config_controls = config_from_int::<27>(conf);
            let target_configs = config_from_int::<10>(second_lfsr.next() as usize);
            wr.shuffle_data_new(target_configs, config_controls);
            set.insert([wr.targets.clone(), wr.controls[0].clone(), wr.controls[1].clone()]);
        }

        println!("The set size is {:?}", set.len());

        assert!(set.len() == SET_SIZE, "The set size should be 0")
    }

    #[test]
    fn test_shuffle_occurance( ) {
        let mut occurance: HashMap<WireEntries, [usize; 10]> = HashMap::new();

        let mut wire_data: [[WireEntries;5];3] = [[WireEntries::default();5];3];
        let mut pointer = 0;
        for i in 0..3 {

            for j in 0..5 {
                wire_data[i][j].position = pointer;
                occurance.insert(wire_data[i][j], [0;10]);
                pointer +=1;
            }
            
        }
        
        println!("The wires base are {:?}", wire_data);
        println!("The wires 0 are {:?}", wire_data[0]);
        println!("The wires 1 are {:?}", wire_data[1]);
        println!("The wires 2 are {:?}", wire_data[2]);

        let mut wr = WireMatrix::new(wire_data, 345668);
        let mut second_lfsr = LFSR::new(12332);
        println!("The targets  {:?}", wr.targets);
        println!("The controls  {:?}", wr.controls);
        let max: u64 = 1 << 29;

        for i in 0..max {
            let conf = wr.lfsr.next() as usize;
            let config_controls = config_from_int::<27>(conf);
            let target_configs = config_from_int::<10>(second_lfsr.next() as usize);
            wr.shuffle_data_new(target_configs, config_controls);
            // populating the map
            for (index, w) in wr.targets.iter().enumerate() {
                let values = occurance.get_mut(w).unwrap();
                values[index] += 1;
            }

            for (position,wires) in wr.controls.iter().enumerate() {
                for (index, w) in wires.iter().enumerate() {
                    if w.position == 3 || w.position == 2 {
                        println!("The should nout get this in controls are {:?}", w);
                        println!("{}:The targets {:?}", i, wr.targets);
                        println!("{}:The controls {:?}",i, wr.controls);
                        return;
                    }
                    let values = occurance.get_mut(w).unwrap();
                    values[index + (position * 5)] += 1;
                }
            }
        }

        println!("The occurances are {:?}", occurance);
        println!("The targets  {:?}", wr.targets);
        println!("The controls  {:?}", wr.controls);
    }
    
}
