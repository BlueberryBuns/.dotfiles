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
      zinit
      # =========== FONTS ===========
      noto-fonts
      nerdfonts # loads the complete collection. look into overide for FiraMono or potentially mononoki
      meslo-lgs-nf
      go
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
    # theme = "";

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
      theme = "catppuccin";
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
      {
        name = "zinit";
	src = pkgs.zinit;
	file = "share/zinit/zinit.zsh";
      }
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

  programs.oh-my-posh = {
    enable = true;
    settings = {
    version = 2;
    final_space = true;
    console_title_template = "{{ .Shell }} in {{ .Folder }}";
    blocks = [
        {
          type = "prompt";
          alignment = "left";
          newline = true;
          segments = [
            {
              type = "path";
              style = "plain";
              background = "transparent";
              foreground = "blue";
              template = "{{ .Path }}";
              properties = {
                style = "full";
              };
            }
            {
              type = "git";
              style = "plain";
              foreground = "p:grey";
              background = "transparent";
              template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
              properties = {
                branch_icon = "";
                commit_icon = "@";
                fetch_status = true;
              };
            }
          ];
        }
        {
          type = "rprompt";
          overflow = "hidden";
          segments = [
            {
              type = "executiontime";
              style = "plain";
              foreground = "yellow";
              background = "transparent";
              template = "{{ .FormattedMs }}";
              properties = {
                threshold = 5000;
              };
            }
          ];
        }
        {
          type = "prompt";
          alignment = "left";
          newline = true;
          segments = [
            {
              type = "text";
              style = "plain";
              foreground_templates = [
                "{{if gt .Code 0}}red{{end}}"
                "{{if eq .Code 0}}magenta{{end}}"
              ];
              background = "transparent";
              template = "❯";
            }
          ];
        }
      ];
      transient_prompt = {
        foreground_templates = [
          "{{if gt .Code 0}}red{{end}}"
          "{{if eq .Code 0}}magenta{{end}}"
        ];
        background = "transparent";
        template = "❯ ";
      };
      secondary_prompt = {
        foreground = "magenta";
        background = "transparent";
        template = "❯❯ ";
      };
    };
  };

  programs.home-manager.enable = true;
}
