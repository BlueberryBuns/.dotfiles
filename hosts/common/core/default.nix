{
  inputs,
  outputs,
  configLib,
  ...
}:
{
  imports = ( map configLib.relativeToRoot [
    "hosts/common/core/locale.nix"
    "hosts/common/core/nix.nix"
    "hosts/common/core/zsh.nix"
    "hosts/common/core/sops.nix"
  ]) 
  ++ [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
