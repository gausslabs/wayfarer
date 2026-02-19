use std::{collections::HashSet, usize};

#[derive(Debug,  Eq, PartialEq, Clone, Copy, Hash)]
pub enum Stages {
    A = 0,
    B = 1,
    C = 2,
    D = 3,
    E = 4,
}

impl Stages {
    pub fn new(value: u8) -> Option<Self> {
        match value {
            0 => Some(Self::A),
            1 => Some(Self::B),
            2 => Some(Self::C),
            3 => Some(Self::D),
            4 => Some(Self::E),
            _ => None,
        }
    }

    pub fn value(&self) -> u8 {
        match self {
            Self::A => 0,
            Self::B => 1,
            Self::C => 2,
            Self::D => 3,
            Self::E => 4,
        }
    }

    pub fn all() -> Vec<Stages> {
        vec![Self::A, Self::B, Self::C, Self::D, Self::E]
    }
}

#[derive(Debug, Clone)]
pub struct Node{
    stage: Stages,
    connection_list: Vec<bool>,
}

impl Node {
    pub fn new(position: u8, connections: Vec<bool>) -> Option<Self>{
        let stage = Stages::new(position)?;
        Option::from(Self { stage: stage, connection_list: connections })
    }

    pub fn connection_check(&self, stage: Stages) -> bool {
        self.connection_list[stage.value() as usize]
    }

    pub fn remove_self(&self, stages: Vec<Stages>) -> Vec<Stages>{
        stages.iter().filter(|v|{
            **v != self.stage
        }).map(|x |{
            *x
        }).collect::<Vec<Stages>>()
    }
}

#[derive(Debug)]
pub struct Graph {
    root: Node,
    nodes: Vec<Node>
}

impl Graph {
    pub fn from_matrix(matrix: Vec<Vec<bool>>, root_index: u8) -> Option<Self>{
        if matrix.len() > Stages::all().len(){
            return None;
        }
        let extractor = matrix.iter().enumerate().map(|(i,v)|{
            Node::new(i as u8, v.clone()).unwrap()
        });
        let nodes = extractor.collect::<Vec<Node>>();
        let root = Node::new(root_index, matrix[root_index as usize].clone()).unwrap();
        Option::from(Graph{root, nodes})
    }
    
    // get_connected_stages_count just tells us how many stages are connected in the current graphs
    pub fn get_connected_stages_count(&self) -> usize {
        let stage_set: HashSet<Stages> = self.get_connected_stages_set(&self.root, self.root.remove_self(Stages::all()));    
        stage_set.len()
    }

    // get_connected_stages_set returns the set of all stages it is connected to and everything it
    // children are connectied to.
    fn get_connected_stages_set(&self, node: &Node, stages_sublist: Vec<Stages>) -> HashSet<Stages> {
        // Creating the set for that level.
        let mut stage_set: HashSet<Stages> = HashSet::new();
        // inserting the current value into the set.
        stage_set.insert(node.stage);
        println!("The current node is {:?}, sublist is {:?}", node, stages_sublist);
        // returning if the sage sublist is empty
        if stages_sublist.len() == 0 {
            return stage_set;
        } else {
           let sublist = stages_sublist.clone();
           for stage in sublist {
            // Iterating over the value of the stages in the sublist and
            // checking if they are connected to the current node. 
            let stage_position = stage.value() as usize;
            println!("The current iteration stage is {:?}", stage);
            if node.connection_list[stage_position] {
                // If the stage is connected to the node then we get the set of stages it is
                // connected to and add it to the current set.
                let node = self.nodes[stage_position].clone();
                let subset = self.get_connected_stages_set(&node, node.remove_self(stages_sublist.clone()));
                stage_set = stage_set.union(&subset).cloned().collect();
            }
           } 
        }
        // Sending the set out after getting all the sub connections added to the set.
        stage_set
    }


}




#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn exploration() {
        
        for i in 0..5 {
            let val = Stages::new(i as u8).unwrap();
            assert_eq!(val.value(), i as u8);
        }
    }

    #[test]
    fn graph_from_list(){
        let root_index = 0;
        let matrix = vec![
            vec![true, false, false, false, false],
            vec![false, true, false, false, false],
            vec![false, false, true, false, false],
            vec![false, false, false, true, false],
            vec![false, false, false, false, true],
        ];
        let graph = Graph::from_matrix(matrix, root_index).unwrap();
        assert_eq!(graph.get_connected_stages_count(), 1);
        let root_index = 0;
        let matrix = vec![
            vec![true, true, true, true, true],
            vec![true, true, false, false, false],
            vec![true, false, true, false, false],
            vec![true, false, false, true, false],
            vec![true, false, false, false, true],
        ];
        let graph = Graph::from_matrix(matrix, root_index).unwrap();
        assert_eq!(graph.get_connected_stages_count(), 5);
        println!("The last test");
        let root_index = 0;
        let matrix = vec![
            vec![true, true, true, true, false],
            vec![true, true, false, false, false],
            vec![true, false, true, false, false],
            vec![true, false, false, true, true],
            vec![false, false, false, true, true],
        ];
        let graph = Graph::from_matrix(matrix, root_index).unwrap();
        assert_eq!(graph.get_connected_stages_count(), 5)
    }
}
