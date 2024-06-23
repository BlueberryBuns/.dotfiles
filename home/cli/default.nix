{ pkgs, lib, ... }: {
  imports = [
    ./vim.nix
  ];

  programs.home-manager.enable = true;
}
