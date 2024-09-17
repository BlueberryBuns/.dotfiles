{ pkgs, inputs, ... }:

{
  stylix.enable = true;
  stylix.image = pkgs.fetchurl{
    url = "https://4kwallpapers.com/images/wallpapers/porsche-911-turbo-s-black-background-amoled-pitch-black-3840x2880-7730.jpg";
    sha256 = "34943981f01dca2a15fa2b9b4bbede14349c63137047fd3f26ffe9171fccddac";
  };
  
  # colorschemes: https://github.com/tinted-theming/base16-schemes
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
  stylix.polarity = "dark";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 15;
    desktop = 10;
    popups = 10;
  };

  stylix.opacity = {
    applications = 1.0;
    terminal = 1.0;
    desktop = 1.0;
    popups = 1.0;
  };
}
