{pkgs, lib, userSettings, config, ...}:
let
  podman = virtualisation.podman;
in
{
  options.docker-podman = {
    enable = lib.mkEnableOption "enable docker service";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;

    # Create a `docker` alias for podman, to use it as a drop-in replacement
    podman.enable = true;
    podman.dockerCompact = true;

    # Required for containers under podman-compose to be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  
    environment.systemPackages = with pkgs; [
      dive
      podman-tui
      docker-compose
    ];
  };
}
