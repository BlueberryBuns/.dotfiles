{
  pkgs,
  inputs,
  config,
  lib,
  configVars,
  configLib,
  ...
}:

{
  sops.secrets.user-password.neededForUsers = true;
  users.mutableUsers = false;
  users.users."${configVars.username}" = {
    hashedPasswordFile = config.sops.secrets."${configVars.username}/user-password".path;
    isNormalUser = true;
    description = "${configVars.username}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };
}
