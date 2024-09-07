{ config, pkgs, ... }:

{
  home.username = "hulewicz";
  home.homeDirectory = "/home/hulewicz";

  home.stateVersion = "24.05";
  home.packages = [

  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
