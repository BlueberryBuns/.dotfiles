{
  programs.nixvim = {
    plugins.neogit = {
      enable = false;
      settings = {
        disable_builtin_notifications = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>Neogit<CR>";
      }
    ];
  };
}
