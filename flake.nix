{
  description = "Configuration of NixOs system with flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
#    stylix.url = "github:danth/stylix/release-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.hulewicz = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/hulewicz/configuration.nix
#	inputs.stylix.nixosModules.stylix
	inputs.home-manager.nixosModules.default
      ];
    };
 };
}
