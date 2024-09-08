{ config, pkgs, ... }:

{
  home.username = "hulewicz";
  home.homeDirectory = "/home/hulewicz";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
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
      pfetch # system info
      pre-commit # git hooks
      p7zip # compression & encryption
      ripgrep # better grep
      usbutils
      tree # cli dir tree viewer
      unzip # zip extraction
      wget # downloader
      zip

      # =========== FONTS ===========
      noto-fonts
      nerdfonts # loads the complete collection. look into overide for FiraMono or potentially mononoki
      meslo-lgs-nf

  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  fonts.fontconfig.enable = true;
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    font = {
      #package = "";
      name = "notosansmono";
      size = 9;
    };

    settings = {
       scrollback_lines = 10000;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
    #theme = "";

    extraConfig = ''
#: Cursor customization {{{

cursor #c66e02

#: Default cursor color

cursor_text_color #282828

#: Choose the color of text under the cursor. If you want it rendered
#: with the background color of the cell underneath instead, use the
#: special keyword: background

cursor_shape block

#: The cursor shape can be one of (block, beam, underline). Note that
#: when reloading the config this will be changed only if the cursor
#: shape has not been set by the program running in the terminal.

cursor_beam_thickness 1.5

#: Defines the thickness of the beam cursor (in pts)

cursor_underline_thickness 2.0

#: Defines the thickness of the underline cursor (in pts)

cursor_blink_interval -1

#: The interval (in seconds) at which to blink the cursor. Set to zero
#: to disable blinking. Negative values mean use system default. Note
#: that numbers smaller than repaint_delay will be limited to
#: repaint_delay.

cursor_stop_blinking_after 15.0

#: Stop blinking cursor after the specified number of seconds of
#: keyboard inactivity.  Set to zero to never stop blinking.

#: }}}
    '';
  };
  # ====================
    programs.bat = {
    enable = true;
    config = {
      # Show line numbers, Git modifications and file header (but no grid)
      style = "numbers,changes,header";
      theme = "gruvbox-dark";
    };
    extraPackages = builtins.attrValues {
      inherit (pkgs.bat-extras)

        batgrep # search through and highlight files using ripgrep
        batdiff # Diff a file against the current git index, or display the diff between to files
        batman
        ; # read manpages using bat as the formatter
    };
  };
  programs.home-manager.enable = true;
}
