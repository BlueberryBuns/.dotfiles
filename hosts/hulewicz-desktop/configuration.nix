{ config, pkgs, lib, ... }:

{
  imports =
  [
    ../../nixos/system
    ../../nixos/programs
    ../../nixos/services
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "desktop";
  system.stateVersion = "23.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
