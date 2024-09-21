{ pkgs, ... }:

{
  # dunst/mako are also required or else the discord will crash upon receiving a notification
  # I have decided to choose mako
  home.packages = builtins.attrValues {
    inherit (pkgs)
        vesktop;
  }; 
}
