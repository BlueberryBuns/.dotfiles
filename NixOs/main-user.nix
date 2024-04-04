{lib, config, pkgs, ...}: 
let
 cfg = config.main-user;
in
{
  options.main-user = {
    enable
      = lib.mkEnableOption "enable user module";

    username = lib.mkOption {
      default = "zajonc-please-change";
      description = ''
        username
      '';
    };
  };
  
  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      isNormalUser = true;
      initialPassword = "zajonc";
      description = "initial user";
      shell = pkgs.zsh;
    };
  };
    
}
