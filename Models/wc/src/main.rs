use std::collections::HashSet;

fn is_wc(adj_matrix: &[Vec<bool>]) -> bool {
    let mut visited = HashSet::new();

    fn dfs(curr_node: usize, visited: &mut HashSet<usize>, adj_matrix: &[Vec<bool>]) {
        if visited.contains(&curr_node) {
            return;
        }

        visited.insert(curr_node);

        for neigh_node in 0..adj_matrix.len() {
            if adj_matrix[curr_node][neigh_node] == true {
                dfs(neigh_node, visited, adj_matrix);
            }
        }
    }

    dfs(0, &mut visited, adj_matrix);

    if visited.len() == adj_matrix.len() {
        return true;
    } else {
        return false;
    }
}

fn construct(
    curr_n: usize,
    n: usize,
    connections: &mut Vec<usize>,
    wc_connections: &mut Vec<Vec<usize>>,
) {
    if curr_n == 1 {
        // dbg!(connections.len());
        assert!(connections.len() == n - 1);
        let mut adj_matrix = vec![vec![false; n]; n];
        for k in 0..n {
            for l in k + 1..n {
                if connections[k] >> (l - k - 1) & 1 != 0 {
                    adj_matrix[k][l] = true;
                    adj_matrix[l][k] = true;
                } else {
                    adj_matrix[k][l] = false;
                    adj_matrix[l][k] = false;
                }

                // DFS the matrix
            }
        }

        // is weakly connected ?
        if is_wc(&adj_matrix) {
            wc_connections.push(connections.clone());
        }

        // Pretty print the matrix
        // let is_wc = is_wc(&adj_matrix);
        // println!("\nAdjacency Matrix:");
        // println!("\nis_wc: {is_wc}");
        // for row in &adj_matrix {
        //     for &cell in row {
        //         print!("{} ", if cell { "1" } else { "0" });
        //     }
        //     println!();
        // }
        // println!();
        return;
    }

    for i in 0..1 << curr_n - 1 {
        connections.push(i);
        construct(curr_n - 1, n, connections, wc_connections);
        connections.pop().unwrap();
    }
}

fn main() {
    let n = 5;
    let mut connections = vec![];
    let mut wc_connections = vec![];
    construct(n, n, &mut connections, &mut wc_connections);

    println!("{}", wc_connections.len());
}
