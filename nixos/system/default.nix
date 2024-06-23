{ config, pkgs, ... }:

{
  imports = [
    ./users.nix
    ./nix-config.nix
    ./locale.nix
    ./bluetooth.nix
    ./sound.nix
    ./network.nix
    ./xserver.nix
  ];

  time.timeZone = "Europe/Warsaw";

  security = {
    sudo = {
      wheelNeedsPassword = true;
    };
  };
}


