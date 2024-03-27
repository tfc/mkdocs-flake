
## Quick Simple Use

To simply run the pre-bundled version of this mkdocs bundle on your own
documentation, you can run it in wach mode via `nix run` even without cloning
the repository:

```console
nix run github:applicative-systems/mkdocs-flake
```

Result:

```console
$ nix run github:applicative-systems/mkdocs-flake
INFO    -  Building documentation...
INFO    -  Cleaning site directory
INFO    -  Documentation built in 14.62 seconds
INFO    -  [14:36:50] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO    -  [14:36:50] Serving on http://127.0.0.1:8000/foo/bar/
INFO    -  [14:36:53] Browser connected:
           http://localhost:8000/foo/bar/index.html
```

This process watches changes and rebuilds the docs if necessary.
Keep it open while you are editing your docs.

### Command line reference

Please refer to the [mkdocs documentation, section "Command Line Interface"](https://www.mkdocs.org/user-guide/cli/)

This command runs mkdocs with the `serve` parameter for your convenience.

```console
nix run github:applicative-systems/mkdocs-flake
```

To run it with other parameters, do it like this:

```console
$ nix run github:applicative-systems/mkdocs-flake#mkdocs -- build --strict
```

The `--strict` is optional but is helpful to avoid usual mistakes.

## Nix Flake



## Docker Image
