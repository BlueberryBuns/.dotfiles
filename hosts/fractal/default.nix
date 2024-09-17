{ inputs, configLib, ... }:

{
  imports = [
    ./configuration.nix
  ] ++ ( map configLib.relativeToRoot [
    ################ Required Configs ################
    "hosts/common/core"

    ################ Optional Configs ################
    "hosts/common/optional/pipewire.nix"
    "hosts/common/optional/vlc.nix"
    "hosts/common/optional/nvidia.nix"
    "hosts/common/optional/stylix.nix"

    ################ Selected Users ################
    "hosts/common/users/hulewicz"
  ]);


  networking = {
    hostName = "fractal";
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05";
}
