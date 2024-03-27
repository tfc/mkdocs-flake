To build documentation in your project with just plain nix flakes, use the
`mkdocs` package that `mkdocs-flake` provides.

Example:

```nix
{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    mkdocs-flake.url = "github:applicative-systems/mkdocs-flake";
  };

  outputs = { self, nixpkgs, mkdocs-flake }:
    let
      system = "x86_64-linux"; # Change this to your system

      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.runCommand "documentation" {} ''
        cp -r ${./docs}/* .
        ${mkdocs-flake.packages.${system}.mkdocs}/bin/mkdocs build --strict
        mv site $out
      '';

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          mkdocs-flake.packages.${system}.mkdocs
        ];
      };

    };
}
```
