{

  programs.nixvim = {
    plugins.project-nvim = {
      enable = true;
      enableTelescope = true;
    };

    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      keymaps = {
        "<leader>ff" = {
            action = "find_files";
            options.desc = "Fuzzy find files in cwd";
        };

        "<leader>fr" = {
            action = "oldfiles";
            options.desc = "Fuzzy find recent files";
        };

        "<leader>fs" = {
            action = "live_grep";
            options.desc = "Find string in cwd";
        };

        "<leader>fc" = {
            action = "grep_string";
            options.desc = "Find string under cursor in cwd";
        };
      };
    };

    extraConfigLua = ''
        local telescope = require('telescope')
        local actions = require("telescope.actions")

        telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
    '';
  };
}
