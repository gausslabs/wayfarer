#[derive(Debug)]
struct Gate<'a> {
    wire_permutation: &'a [u8;3]
}

impl<'a> Eq for Gate<'a> { 
}

impl<'a> PartialEq for Gate<'a> {
    // add code here
    fn eq(&self, other: &Self) -> bool {
        let mut atleast_one_is_equal = false;
        for v in other.wire_permutation.iter(){
            for i in self.wire_permutation.iter(){
                atleast_one_is_equal = atleast_one_is_equal || (*i == *v);
            }
        }

        return atleast_one_is_equal;
    }
}

#[derive(Debug)]
struct CircuitGateList<'a> {
    gates: Vec<Gate<'a>>,
}

impl <'a> CircuitGateList <'a> {
    pub fn add(&mut self, permutaion: &'a [u8;3]) {
        self.gates.push(Gate{wire_permutation: permutaion})
    }

    pub fn connection_array(&self) -> Vec<Vec<u8>>{
        let mut connectins_list = Vec::new();
        for upper_gate in self.gates.iter(){
            let mut connections = Vec::new();
            for lower_gate in self.gates.iter(){
                match *upper_gate == *lower_gate {
                    true => connections.push(1),
                    false => connections.push(0),
                };
            }
            connectins_list.push(connections);
        }

        connectins_list
    }

    pub fn weakly_connected_check(&self) -> bool{
        let connection_array = self.connection_array();
        let columns= connection_array[0].len();
        let rows = connection_array.len();
        let  mut row_collapsed_array = Vec::new();
        for i in 0..rows {
            let mut sum = 0;
            for j in 0..columns{
                sum += connection_array[j][i];
            }
            row_collapsed_array.push(sum);
        }
        println!("The row_collapsed_array array {:?}", row_collapsed_array);

        row_collapsed_array.retain(|&x|{
            x >= 2
        });
        println!("The row row_collapsed_array filters {:?}", row_collapsed_array);

        return row_collapsed_array.len() == columns
    } 
}


fn main() {
    let perm_1:[u8;3] = [ 1, 2, 3];
    let perm_2:[u8;3] = [ 6, 0, 4];
    let perm_3:[u8;3] = [ 4, 2, 5];
    let mut gate_list = CircuitGateList{
        gates: Vec::new()
    };
    gate_list.add(&perm_1);
    gate_list.add(&perm_2);
    gate_list.add(&perm_3);
    println!("The list is {:?}",gate_list);
    println!("The connections {:?}",gate_list.connection_array());
    println!("The graph is weak connected ? {:}",gate_list.weakly_connected_check());
    
    let perm_1:[u8;3] = [ 1, 2, 3];
    let perm_2:[u8;3] = [ 6, 0, 7];
    let perm_3:[u8;3] = [ 4, 2, 5];
    let mut gate_list = CircuitGateList{
        gates: Vec::new()
    };
    gate_list.add(&perm_1);
    gate_list.add(&perm_2);
    gate_list.add(&perm_3);
    println!("The list is {:?}",gate_list);
    println!("The connections {:?}",gate_list.connection_array());
    println!("The graph is weak connected ? {:}",gate_list.weakly_connected_check());

}
