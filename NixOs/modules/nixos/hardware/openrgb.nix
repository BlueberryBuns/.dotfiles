{lib, pkgs, config, ... }:

{
  options.openrgb = {
    enable = lib.mkEnableOption "Enable OpenRGB service";
    motherboard = lib.mkOption {
      default = "intel";
    };
  };

  config = lib.mkIf config.openrgb.enable {
    services.hardware.openrgb = {
      enable = true;
      motherboard = config.openrgb.motherboard;
    };
  };
}
