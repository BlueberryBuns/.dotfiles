{ config, pkgs, username, ... }:
{
  # Setup standard user
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."${username}/user-password".path;
    extraGroups = [ "wheel" "input" "video" "render" ];
  };

  # Setup root user
  users.users."root" = {
    hashedPasswordFile = config.sops.secrets."${username}/root-password".path;
    shell = pkgs.zsh;
  };

  sops.secrets = {
    "${username}/user-password" = {
      neededForUsers = true;
    };

    "${username}/root-password" = {
      neededForUsers = true;
    };
  };

  # Only Nix can mutate users
  users.mutableUsers = false;
}