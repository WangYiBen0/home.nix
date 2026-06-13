{
  description = "W1ngD1nGa5ter's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    NixVim = {
      url = "github:WangYiben0/nixvim.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixvim.follows = "nixvim";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.git-hooks-nix.flakeModule
      ];

      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          formatter = pkgs.nixfmt-tree;

          pre-commit = {
            settings = {
              hooks = {
                nixfmt.enable = true;
                deadnix.enable = true;
                statix.enable = true;
              };
            };
          };

          devShells.default = pkgs.mkShell {
            inherit (config.pre-commit) shellHook;
          };
        };

      flake = {
        homeConfigurations = {
          "w1ngd1nga5ter@matebook16d" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.${import ./hosts/matebook16d/arch.nix};
            modules = [
              ./home.nix
              ./hosts/matebook16d
            ];
            extraSpecialArgs = { inherit inputs; };
          };

          "w1ngd1nga5ter@sxyz-9" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.${import ./hosts/sxyz-9/arch.nix};
            modules = [
              ./home.nix
              ./hosts/sxyz-9
            ];
            extraSpecialArgs = { inherit inputs; };
          };
        };
      };
    };
}
