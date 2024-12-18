
def _lint_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name+ctx.attr.suffix)
    ctx.actions.write(
        output = out,
        content = "Hello {}!\n".format(ctx.attr.top),
    )
    return [DefaultInfo(files = depset([out]))]

lint_rtl = rule(
    implementation = _lint_impl,
    attrs = {
      "top" : attr.string(),
      "include_dirs": attr.string_list(default= ["./HDL/Logic", "./HDL/Tests/Infra"]),
      "template_file": attr.label(allow_files = [".tcl.tpl"], default="./Scripts/Lint.tcl.tpl"),
      "part" : attr.string(default= "xc7a35tcpg236-1"),
      "suffix": attr.string(default= "Lint.tcl")
    }
)