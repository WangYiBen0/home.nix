{
  description = "Home Manager configuration of w1ngd1nga5ter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
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
          homeConfigurations."w1ngd1nga5ter" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              catppuccin.homeModules.catppuccin
              ./home.nix
            ];
            extraSpecialArgs = { inherit inputs; };
          };
        };
      }
    );
}
