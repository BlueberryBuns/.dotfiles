{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>hm";
      toggleQuickMenu = "<C-e>";
      navNext = "<leader>hn";
      navPrev = "<leader>hp";
      navFile = {
        "1" = "<C-j>";
        "2" = "<C-k>";
        "3" = "<C-l>";
        "4" = "<C-m>";
      };
    };
  };
}
