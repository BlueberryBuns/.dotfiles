{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Screen capture
      flameshot

      # Productivity
      libreoffice
      drawio

      # Privacy
      keepassxc

      # Media
      audacity
      blender
      gimp
      inkscape
      obs-studio
      ;
  };
}
