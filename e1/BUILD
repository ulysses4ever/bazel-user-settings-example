load("//e1:build_settings.bzl", "flavor")
load("//e1:rules.bzl", "drink_rule")
flavor(
    name = "favorite_flavor",
    build_setting_default = False
)

drink_rule(
    name = "my_drink",
    flavor = ":favorite_flavor",
)
