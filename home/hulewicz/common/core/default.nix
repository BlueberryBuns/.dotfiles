{config, lib, pkgs, outputs, ...}:

{ 
  imports = [
    ./bash.nix
    ./bat.nix
    ./fonts.nix
    ./kitty.nix
    ./zoxide.nix
    ./zsh.nix
    ./nixvim
  ];

  services.ssh-agent.enable = true;

  home = {
    username = "hulewicz";
    homeDirectory = lib.mkDefault "/home/hulewicz";
    stateVersion = lib.mkDefault "24.05";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      EDITOR = "nvim";
    };
  };

  stylix.targets.vim.enable = false;
  stylix.targets.nixvim.enable = false;
  
  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Packages that don't have custom configs go here

      # TODO: spaces before comment are removed by nixpkgs-fmt
      # See: https://github.com/nix-community/nixpkgs-fmt/issues/305
      borgbackup # backups
      btop # resource monitor
      coreutils # basic gnu utils
      # curl
      eza # ls replacement
      fd # tree style ls
      findutils # find
      fzf # fuzzy search
      jq # JSON pretty printer and manipulator
      nix-tree # nix package tree viewer
      ncdu # TUI disk usage
      pciutils
      killall
      just
      exercism
      sops
      glow
      pfetch # system info
      pre-commit # git hooks
      p7zip # compression & encryption
      ripgrep # better grep
      usbutils
      tree # cli dir tree viewer
      unzip # zip extraction
      unrar # rar extraction
      wget # downloader
      zip
      ; # zip compression
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {};
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };
}	
