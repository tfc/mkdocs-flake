{ pkgs, lib, config, system, mkdocs-flake, ... }:

let
  cfg = config.documentation;
in

{
  options.documentation = {
    mkdocs-root = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = lib.mdDoc "Path to a mkdocs documentation project";
    };

    mkdocs-package = lib.mkOption {
      type = lib.types.package;
      default = mkdocs-flake.withSystem system ({ config, ... }: config.packages.mkdocs);
      description = lib.mdDoc "The mkdocs package to use.";
    };
  };

  config = lib.mkIf (cfg.mkdocs-root != null) {
    packages.documentation = pkgs.runCommand "mkdocs-flake-documentation" {} ''
      cp -r ${cfg.mkdocs-root}/* .
      ${cfg.mkdocs-package}/bin/mkdocs build --strict
      mv site $out
    '';
  };
}
