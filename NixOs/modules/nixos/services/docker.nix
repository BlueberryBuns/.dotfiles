{pkgs, lib, config, ...}:

{
  options.docker = {
    enable = lib.mkEnableOption "enable docker service";
    username = lib.mkOption{
      type = lib.types.str;
    };
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    users.users.${config.docker.username}.extraGroups = [ "docker" ];

    environment.systemPackages = with pkgs; [
      dive
      docker-compose
    ];
  };
}
