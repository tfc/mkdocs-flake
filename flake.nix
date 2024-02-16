{
  description = "Mkdocs Distribution Flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    poetry2nix.url = "github:tfc/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          python = pkgs.python3;

        in {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              (import ./overlay.nix)
              inputs.poetry2nix.overlays.default
            ];
          };
          devShells.default = pkgs.mkShell {
            nativeBuildInputs = [
              config.packages.default
              pkgs.poetry
              python.pkgs.plantuml-markdown
              pkgs.fontconfig
              pkgs.dejavu_fonts
            ];
          };
          packages.default = pkgs.poetry2nix.mkPoetryEnv {
            inherit python;
            projectDir = ./mkdocs;
            overrides = pkgs.poetry2nix.overrides.withDefaults (self: super: {
            });
          };
        };
    };
}
