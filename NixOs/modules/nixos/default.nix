{lib, pkgs, config, ...}:

{
  imports = [
    # ===== Hardware configuration =====
    ./hardware/bluetooth.nix
    ./hardware/openrgb.nix


    # ===== Services configuration =====
    # ./services/docker-podman.nix
    ./services/docker.nix

    # ===== User configuration =====
    ./users/sudo-user.nix
  ];

  bluetooth.enable = lib.mkDefault true;
  openrgb.enable = lib.mkDefault true;

  # docker-podman.enable = lib.mkDefault true;
  docker.enable = lib.mkDefault false;
  user.enable = lib.mkDefault false;
}
