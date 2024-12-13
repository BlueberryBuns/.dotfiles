{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      notify_on_error = true;
      formatters_by_ft = {
        html = [
          "prettierd"
          "prettier"
        ];
        css = [
          "prettierd"
          "prettier"
        ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        # java = ["google-java-format"]; # Figure it out for yourself @konrand @maciek, anyhow java in vim? Naaaah
        python = [
          "black"
        ];
        lua = [
          "stylua"
        ];
        markdown = [
          "prettierd"
          "prettier"
        ];
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
        go = [
          "gofumpt"
          "goimports"
        ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespaces"
          "trim_newlines"
        ];
      };
    };
    };
  };
}
