{ config, pkgs, ... }:

{
  users.users.hulewicz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}
