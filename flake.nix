{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";

  };

  outputs =
    { nixpkgs
    , nixvim
    , flake-utils
    , nixneovimplugins
    , ...
    } @ inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      nixvimLib = nixvim.lib.${system};
      # overlat nur over nixpkgs, so that we can use nur packages in our config
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [ nixneovimplugins.overlays.default ];
      };
      #pkgs = import nixpkgs { inherit system; config = { allowUnfree = true; }; };

      nixvim' = nixvim.legacyPackages.${system};
      default = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = ./config/default.nix;
      };
      lite = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = ./config/lite.nix;
      };
      test = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = ./config/test.nix;
      };
    in
    {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit default;
          name = "default config";
        };
        lite = nixvimLib.check.mkTestDerivationFromNvim {
          inherit lite;
          name = "minimal";
        };
        test = nixvimLib.check.mkTestDerivationFromNvim {
          inherit test;
          name = "test config";
        };

      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = default;
        lite = lite;
        test = test;
      };
    });
}
