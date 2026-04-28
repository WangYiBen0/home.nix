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

    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    NixVim = {
      url = "github:WangYiben0/nixvim.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixvim.follows = "nixvim";
        flake-utils.follows = "flake-utils";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      flake-utils,
      pre-commit-hooks,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        formatter = pkgs.nixfmt-tree;

        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt.enable = true;
              deadnix.enable = true;
              statix.enable = true;
            };
          };
        };

        devShells = {
          default =
            with pkgs;
            mkShell {
              inherit (self.checks.${system}.pre-commit-check) shellHook;
            };
        };
      }
    )
    // {

      homeConfigurations = {
        "w1ngd1nga5ter@nixos-matebook16d" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${import ./hosts/nixos-matebook16d/arch.nix};
          modules = [
            ./home.nix
            ./hosts/nixos-matebook16d
          ];
          extraSpecialArgs = { inherit inputs; };
        };

        "w1ngd1nga5ter@nixos-sxyz-9" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${import ./hosts/nixos-sxyz-9/arch.nix};
          modules = [
            ./home.nix
            ./hosts/nixos-sxyz-9
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };

    };
}
