{ pkgs, config, lib, ... }:

{
  # Bluetooth
  options = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
