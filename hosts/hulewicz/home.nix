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
      keepassxc
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
      size = 12;
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

  # =================== ZSH
  programs.zsh = {
    enable = true;

    # relative to ~
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    autosuggestion.enable = true;
    history.size = 10000;
    history.share = true;

    plugins = [
    ];

    initExtra = ''
      # autoSuggestions config

      unsetopt correct # autocorrect commands

      setopt hist_ignore_all_dups # remove older duplicate entries from history
      setopt hist_reduce_blanks # remove superfluous blanks from history items
      setopt inc_append_history # save history entries as soon as they are entered

      # auto complete options
      setopt auto_list # automatically list choices on ambiguous completion
      setopt auto_menu # automatically use menu completion
      zstyle ':completion:*' menu select # select completions with arrow keys
      zstyle ':completion:*' group-name "" # group results by category
      zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

      #      bindkey '^I' forward-word         # tab
      #      bindkey '^[[Z' backward-word      # shift+tab
      #      bindkey '^ ' autosuggest-accept   # ctrl+space
    '';

    oh-my-zsh = {
      enable = true;
      # Standard OMZ plugins pre-installed to $ZSH/plugins/
      # Custom OMZ plugins are added to $ZSH_CUSTOM/plugins/
      # Enabling too many plugins will slowdown shell startup
      plugins = [
        "git"
        "sudo" # press Esc twice to get the previous command prefixed with sudo https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
      ];
      extraConfig = ''
        # Display red dots whilst waiting for completion.
        COMPLETION_WAITING_DOTS="true"
      '';
    };

    shellAliases = {
      # Overrides those provided by OMZ libs, plugins, and themes.
      # For a full list of active aliases, run `alias`.

      #-------------Bat related------------
      cat = "bat";
      diff = "batdiff";
      rg = "batgrep";
      man = "batman";

      #------------Navigation------------
      l = "eza -lah";
      la = "eza -lah";
      ll = "eza -lh";
      ls = "eza";
      lsa = "eza -lah";

      #-------------Neovim---------------
      e = "nvim";
      vi = "nvim";
      vim = "nvim";

      #-----------Nix related----------------
      ne = "nix-instantiate --eval";
      nb = "nix-build";
      ns = "nix-shell";

      #-------------Git Goodness-------------
      # just reference `$ alias` and use the defautls, they're good.
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };

  programs.home-manager.enable = true;
}
