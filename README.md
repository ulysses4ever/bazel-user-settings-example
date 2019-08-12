## Example of [build configurations](https://docs.bazel.build/versions/0.28.0/skylark/config.html)

This is to show off Bazel's ([recently added](https://docs.bazel.build/versions/0.28.0/skylark/config.html)) ability
to employ user-defined build flags.

If you do:

```bash
bazel clean && bazel build //e1:my_drink
```
it will print:
```
DEBUG: .../e1/rules.bzl:7:9: Get the default (False)
```

In contrast, if you do
```bash
bazel clean && bazel build //e1:my_drink --//e1:favorite_flavor=True
```
it will print:

```
DEBUG: .../e1/rules.bzl:5:9: Get the opposite of default
```
