{ pkgs, ... }:
{
  programs.nixvim.plugins.luasnip = {
    enable = true;
    extraConfig = {  # Soon to be replaced by settings
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
}

