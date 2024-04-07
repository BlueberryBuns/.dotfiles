{pkgs, lib, userSettings, config, ...}:
{
  options.docker-podman = {
    enable = lib.mkEnableOption "enable docker service";
  };

  config = lib.mkIf config.docker-podman.enable {
    virtualisation.containers.enable = true;

    # Create a `docker` alias for podman, to use it as a drop-in replacement
    virtualisation.podman.enable = true;
    virtualisation.podman.dockerCompat = true;

    environment.systemPackages = with pkgs; [
      dive
      podman-tui
      docker-compose
    ];
  };
}
