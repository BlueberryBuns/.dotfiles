{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
      formattersByFt = {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        # java = ["google-java-format"]; # Figure it out for yourself @konrand @maciek, anyhow java in vim? Naaaah
        python = ["black"];
        lua = ["stylua"];
        markdown = [["prettierd" "prettier"]];
        yaml = [["yamllint" "yamlfmt"]];
        go = [["gofumpt" "goimports"]];
      };
    };
  };
}
