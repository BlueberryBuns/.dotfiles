{
  description = "Configuration of NixOs system with flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	./hosts/default/configuration.nix
	./modules/nixos
	./modules/home-manager
	inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.hulewicz-pc = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/hulewicz-pc/configuration.nix
	./modules/nixos
	./modules/home-manager
	inputs.home-manager.nixosModules.default
      ];
    };

  };
}
