{ inputs, lib }:
{
  networking = import ./networking.nix { inherit lib; };

  username = "hulewicz";
  isMinimal = false; # Used to indicate nixos-installer build
}
