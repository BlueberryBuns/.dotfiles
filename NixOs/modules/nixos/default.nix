{lib, pkgs, config, ...}:

{
  imports = [
    ./hardware/bluetooth.nix
    ./hardware/openrgb.nix
    ./users/sudo-user.nix
  ];

  bluetooth.enable = lib.mkDefault true;
  openrgb.enable = lib.mkDefault true;
  user.enable = lib.mkDefault true;
}
