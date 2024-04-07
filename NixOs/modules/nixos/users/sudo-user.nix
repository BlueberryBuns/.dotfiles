{pkgs, config, lib, ...}:
let
  cfg = config.user;
in
{
  options.user = {
    enable = lib.mkEnableOption "enable main user";
    username = lib.mkOption {
      default = "user";
    };
    
    defaultPassword = lib.mkOption {
      default = "password";
    };
    
    shell = lib.mkOption {
      default = pkgs.zsh;
    };

    uid = lib.mkOption {
      default = 1000;
    };

  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      isNormalUser = true;
      initialPassword = cfg.defaultPassword;
      shell = cfg.shell;
      extraGroups = [ "networkmanager" "wheel" ]; # we can add "inpu" and "dial", but I dont need them
      uid = cfg.uid;
      packages = [];
    };
  };
}
