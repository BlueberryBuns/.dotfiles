{
  pkgs,
  inputs,
  outputs,
  config,
  lib,
  configVars,
  configLib,
  ...
}:

{
  sops.secrets.user-password.neededForUsers = true;
  users.mutableUsers = false;
  users.users.hulewicz = {
    hashedPasswordFile = config.sops.secrets."hulewicz/user-password".path;
    isNormalUser = true;
    description = "A very good boy";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.users.${configVars.username} = import (
    configLib.relativeToRoot "home/hulewicz/${config.networking.hostName}.nix"
  );

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  programs.zsh.enable = true;
  programs.git.enable = true;
  environment.systemPackages = [
    pkgs.just
    pkgs.rsync
  ];
}
