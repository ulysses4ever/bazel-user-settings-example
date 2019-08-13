load("//e1:build_settings.bzl", "FlavorProvider")
def _rule_impl(ctx):
    type = ctx.attr.flavor[FlavorProvider].type
    if type:
        print("Get the opposite of default")
    else:
        print("Get the default (False)")

drink_rule = rule(
    implementation = _rule_impl,
    attrs = {
        "flavor": attr.label(
            default = "//e1:favorite_flavor",
        )
    }
)
