{
  pkgs,
  inputs,
  config,
  lib,
  configVars,
  configLib,
  ...
}:
#
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in 
{
      sops.secrets.user-password.neededForUsers = true;
      users.mutableUsers = false;
      users.users."${configVars.username}" = {
        hashedPasswordFile = config.sops.secrets."${configVars.username}/user-password".path;
        isNormalUser = true;
        description = "${configVars.username}";
        shell = pkgs.zsh;
        home = "/home/${configVars.username}";

        packages = [
          pkgs.home-manager
	];

        extraGroups = [ "wheel" ]
          ++ ifTheyExist [
            "audio"
            "video"
            "docker"
            "git"
            "networkmanager"
          ];
      };
      
      # Import this user's personal/home configurations
      home-manager.users.${configVars.username} = import (
        configLib.relativeToRoot "home/${configVars.username}/${config.networking.hostName}.nix"
      );
      
      programs.zsh.enable = true;
      programs.git.enable = true;
      environment.systemPackages = [
        pkgs.just
        pkgs.rsync
      ];
}
