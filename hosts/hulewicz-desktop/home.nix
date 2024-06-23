{ pkgs, ... }: {
  imports = [
    ../../home/cli
  ];

  home = {
    username = "hulewicz";
    homeDirectory = "/home/hulewicz";
    file."dotfiles".source = ../../.;
    stateVersion = "23.11";
  };
}
