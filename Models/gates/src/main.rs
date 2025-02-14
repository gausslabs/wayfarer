use std::{env, error::Error, fs};

use serde::Serialize;
use tera::{Context, Tera};
use utilities::{
    bits,
    stages::{get_wire_permutations, n_p_3},
};

#[derive(Debug, Serialize)]
pub struct Case {
    index: usize,
    permutations: Vec<Permutation>,
}

#[derive(Debug, Serialize)]
pub struct Permutation {
    index: usize,
    value: String,
}

fn main() -> std::io::Result<()> {
    // getting the arguments
    let args = env::args().collect::<Vec<_>>();

    let (out_file_name, template_folder) = match args.len() {
        1 => {
            println!(
                "[Warning] Using defaults out_file = permutation.sv template_dir = templates/**/*"
            );
            ("permutation.sv", "templates/**/*")
        }
        2 => {
            println!(
                "[Warning] Using default template_dir = templates/**/* and input out_file = {:?}",
                args[1]
            );
            (args[1].as_str(), "templates/**/*")
        }
        3 => (args[1].as_str(), args[2].as_str()),
        _ => {
            println!("[Warning] Arguments sent are improper {:?}", args);
            println!("[INFO] The correct format is cmd [name of output file] [template folder location]. Both arguments are optional.");
            std::process::exit(1);
        }
    };

    // Creating the tera object
    let templates: Tera = {
        let mut tera = match Tera::new(template_folder) {
            Ok(t) => t,
            Err(e) => {
                println!("Parsing error(s): {}", e);
                ::std::process::exit(1);
            }
        };
        tera.autoescape_on(vec![".sv"]);
        tera
    };

    // Creating the permutation tree
    const NUMBER_OF_WIRES: usize = 13;
    let permutaion_store = get_wire_permutations::<NUMBER_OF_WIRES>();

    let cases = permutaion_store
        .iter()
        .enumerate()
        .map(|(i, s)| Case {
            index: i,
            permutations: s
                .iter()
                .enumerate()
                .map(|(i, p)| Permutation {
                    index: i,
                    value: p.to_string(),
                })
                .collect::<Vec<Permutation>>(),
        })
        .collect::<Vec<Case>>();

    let default = &cases[0];

    // configuring the data for templating
    let mut context = Context::new();
    let name = "SafePermutationGenerator".to_string() + &NUMBER_OF_WIRES.to_string();
    context.insert("module_name", &name);
    context.insert("perm_size", &bits(n_p_3(NUMBER_OF_WIRES)));
    context.insert("port_size", &bits(NUMBER_OF_WIRES));
    context.insert("cases", &cases);
    context.insert("default", &default);

    // A one off template
    Tera::one_off("safe_permutation", &Context::new(), true).unwrap();

    // rendering the template
    match templates.render("case_generator.sv.tpl", &context) {
        Ok(s) => {
            fs::write(out_file_name, s)?;
        }
        Err(e) => {
            println!("Error: {}", e);
            let mut cause = e.source();
            while let Some(e) = cause {
                println!("Reason: {}", e);
                cause = e.source();
            }
        }
    };
    Ok(())
}
