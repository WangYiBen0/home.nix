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

    nixvim = {
      url = "github:nix-community/nixvim";
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
    flake-utils.lib.eachDefaultSystem (system: {
      formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;
    })
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
