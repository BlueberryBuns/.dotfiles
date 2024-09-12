{  
  pkgs,
  inputs,
  config,
  configVars,
  configLib,
  ...
}:
let
  homeDirectory = if pkgs.stdenv.isLinux then "/home/${configVars.username}" else "/Users/${configVars.username}";
in
{
  sops = {
    defaultSopsFile = configLib.relativeToRoot "secrets/secrets.yaml"; 
    validateSopsFiles = false;

    secrets = {
      "${configVars.username}/user-password" = {
        neededForUsers = true;
        
	# This cannot be enabled as neededForUsers requjires root ownership
	# owner = config.users.users.${configVars.username}.name;
        # inherit (config.users.users.${configVars.username}) group;
	
	sopsFile = configLib.relativeToRoot "secrets/${configVars.username}-secrets.yaml";
	format = "yaml";
      };

      "${configVars.username}/root-password" = {
        neededForUsers = true;
	sopsFile = configLib.relativeToRoot "secrets/${configVars.username}-secrets.yaml";
	format = "yaml";
      };
    };

    age = {
      sshKeyPaths = [ "/home/${configVars.username}/.ssh/id_ed25519" ];
      keyFile = "/home/${configVars.username}/.config/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
