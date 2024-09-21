{
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        code_actions = {
          # gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          yamllint.enable = true;
        };
        formatting = {
          black = {
            enable = true;
          };
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
          stylua.enable = true;
          yamlfmt.enable = true;
          hclfmt.enable = true;
          gofumpt.enable = true;
        };
      };
    };
    keymaps = [
      {
        mode = [
          "n"
          "v"
        ]; 
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
    ];
  };
}
