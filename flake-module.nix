mkdocs-flake: { self, flake-parts-lib, lib, ... }: {
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ config, ... }: {
    imports = [
      ./modules/documentation.nix
    ];

    config = {
      _module.args.mkdocs-flake = mkdocs-flake;
    };
  });

  _file = __curPos.file;
}
