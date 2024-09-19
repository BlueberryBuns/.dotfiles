{
  description = "Configuration of NixOs system with flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix/release-24.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
  };

  outputs = 
  { 
    self,
    nixpkgs,
    ...
  }@inputs:
  let
    inherit (self) outputs;
    inherit (nixpkgs) lib;
    configVars = import ./vars { inherit inputs lib; };
    configLib = import ./lib { inherit lib; };
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    specialArgs = {
      username = "hulewicz";
      inherit 
        inputs
        outputs
        configVars
        configLib
        nixpkgs;
    };
  in
  {
    nixosConfigurations.fractal = lib.nixosSystem {
      inherit specialArgs;

      modules = [
        ./hosts/fractal
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
	inputs.sops-nix.nixosModules.sops
      ];
    };
 };
}
