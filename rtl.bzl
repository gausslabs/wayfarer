
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
      "include_dirs": attr.string_list(default= ["./HDL/Logic", "./HDL/Tests/Infra"]),
      "template_file": attr.label(allow_single_file = [".tcl.tpl"], default="Scripts/Lint.tcl.tpl"),
      "part" : attr.string(default= "xc7a35tcpg236-1"),
      "suffix": attr.string(default= "Lint.tcl")
    }
)