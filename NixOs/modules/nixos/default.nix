{lib, pkgs, config, ...}:

{
  imports = [
    ./bluetooth.nix
    ./openrgb.nix
  ]

  bluetooth.enable = lib.mkDefault true;
  openrgb.enable = lib.mkDefault true;
}
