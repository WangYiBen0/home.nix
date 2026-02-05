{
  description = "Home Manager configuration of w1ngd1nga5ter";

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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      stylix,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        formatter = pkgs.nixfmt-tree;

        legacyPackages = {
          homeConfigurations."w1ngd1nga5ter@nixos-matebook16d" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home.nix
              ./hosts/nixos-matebook16d
            ];
            extraSpecialArgs = { inherit inputs; };
          };
          homeConfigurations."w1ngd1nga5ter@nixos-sxyz-9" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home.nix
              ./hosts/nixos-sxyz-9
            ];
            extraSpecialArgs = { inherit inputs; };
          };
        };
      }
    );
}
