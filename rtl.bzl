
def _lint_impl(ctx):
    out = ctx.actions.declare_file("Lint.tcl")
    ctx.actions.expand_template(
        output = out,
        template = ctx.file.template_file,
        substitutions = {
        "{PART}": ctx.attr.part,
        "{TOP}": ctx.attr.top,
        "{DIRS}": " ".join([ "\"" + s + "\"" for s in ctx.attr.include_dirs]),
        },
    )

    return [DefaultInfo(files = depset([out]))]

lint_rtl = rule(
    implementation = _lint_impl,
    attrs = {
      "top" : attr.string(),
      "include_dirs": attr.string_list(default= ["./HDL/Types","./HDL/Logic", "./HDL/Tests/Infra"]),
      "template_file": attr.label(allow_single_file = [".tcl.tpl"], default="Scripts/Lint.tcl.tpl"),
      "part" : attr.string(default= "xc7a35tcpg236-1"),
      "suffix": attr.string(default= "Lint.tcl")
    }
)

def _vivado_sim_proj_impl(ctx):
  sim_log = ctx.actions.declare_file(ctx.attr.name + "_proj.log")
  tcl_file = ctx.actions.declare_file(ctx.attr.name + "_proj.tcl")
  
  tcl_contents = ""
  # First, create the project directory (this TCL command creates the directory if it doesn't exist).
  proj_name = ctx.attr.top_module.lower() 
  proj_dir = ctx.attr.top_module.lower() + "_proj"
  tcl_contents += "file mkdir {}\n".format(proj_dir)
  # Create a new project with the provided project directory; use -force to overwrite if needed.
  tcl_contents += ("create_project {proj_name} {proj_dir} -force -part {part}\n"
                   .format(proj_name = proj_name,
                           proj_dir = proj_dir,
                           part = ctx.attr.part))
  # Add each provided SV file into the project
  for f in ctx.files.srcs:
      tcl_contents += "add_files {}\n".format(f.path)

  # Add each provided hex file into the project
  for h in ctx.files.hex_files:
    tcl_contents += "add_files -fileset sim_1 -norecurse {}\n".format(h.path)
  # Update compile order
  tcl_contents += "update_compile_order -fileset sim_1\n"
  # If include directories are provided, set them on the simulation fileset.
  if ctx.attr.includes:
      # Join the list of include directories into a single space‐separated string.
      incs = " ".join(ctx.attr.includes)
      tcl_contents += "set_property include_dirs {{{}}} [get_filesets sim_1]\n".format(incs)
  # Setting top and strating simulation
  tcl_contents += "set_property top {} [get_filesets sim_1]\n".format(ctx.attr.top_module)
  tcl_contents += "set_property top_lib xil_defaultlib [get_filesets sim_1]\n"
  tcl_contents += "launch_simulation\n"
  tcl_contents += "run -all\n"
  
  ctx.actions.write(output = tcl_file, content = tcl_contents)
  
  ctx.actions.run_shell(
      inputs = ctx.files.srcs + ctx.files.hex_files + [tcl_file],
      outputs = [sim_log],
      use_default_shell_env = False,
       env = {
        "PATH": ctx.configuration.default_shell_env["PATH"],
        "HOME": ctx.configuration.default_shell_env["HOME"],
        },
      command = " vivado -mode batch -source {} > {}".format(tcl_file.path, sim_log.path)
  )
  return DefaultInfo(files = depset([sim_log, tcl_file]))

vivado_sim_proj = rule(
    implementation = _vivado_sim_proj_impl,
    attrs = {
       "srcs": attr.label_list(allow_files = [".sv"],
                                doc = "SV sources to simulate in project mode"),
       "top_module": attr.string(
           default = "top",
           doc = "Name of the top module to set in the project"
       ),
       "includes": attr.string_list(
           default = [],
           doc = "List of include directory paths to add for simulation"
       ),
       "part": attr.string(
           default = "xc7a35tcpg236-1",
           doc = "Target part number for the project"
       ),
       "hex_files" : attr.label_list(allow_files = [".hex"],
                                doc = "Hex file for simulation"),
    },
    doc = "Creates a Vivado project, adds the SV files, sets include directories, and runs simulation in project mode."
)