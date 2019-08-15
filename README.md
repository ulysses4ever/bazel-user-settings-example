## Example of [build configurations](https://docs.bazel.build/versions/0.28.0/skylark/config.html)

This is to show a bug in Bazel's ([recently added](https://docs.bazel.build/versions/0.28.0/skylark/config.html)) ability
to employ user-defined build flags.

### The minimal working setup

If you do:

```bash
bazel clean && bazel build //:my_drink
```
it will print:
```
DEBUG: .../rules.bzl:7:9: Get the default (False)
```

In contrast, if you do
```bash
bazel clean && bazel build //:my_drink --//:favorite_flavor=True
```
it will print:

```
DEBUG: .../rules.bzl:5:9: Get the opposite of default (True)
```

### The bug (branch: [bug](https://github.com/ulysses4ever/bazel-user-settings-example/commit/1d79b746b0323e0450a99aedea9e8e3c3d924c07))

Same code, except using workspace prefix for referencing the build-sertting target. Both commands listed above yield the same result:
```
DEBUG: .../rules.bzl:7:9: Get the default (False)
```
That is, the flag set in the command-line has no effect. 
It might make sense to modify the command to use the 
workspace prefix too:
```bash
bazel clean && bazel build //:my_drink --@bsws//:favorite_flavor=True
```
Unfortunately (and surpriingly) this yields:
```
ERROR: Unrecognized option: --@bsws//:favorite_flavor=True
```
