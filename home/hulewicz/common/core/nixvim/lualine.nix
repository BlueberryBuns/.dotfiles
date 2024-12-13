{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
        always_divide_middle = true;
        extensions = ["fzf"];
        theme = "auto";

        ignore_focus = ["neo-tree"];
        sections = {
            lualine_a = ["mode"]; 
            lualine_b = [
                {name = "branch"; icon = "";}
                "diff"
                "diagnostics"
            ];
            lualine_c = ["filename"];
            lualine_x = ["filetype"];
            lualine_y = ["progress"];
            lualine_z = [''" " .. os.date("%R")''];
        };

        options = {
            globalstatus = true;
            section_separators = {
                left = "█"; # 
                right = "█"; # 
            };
            
            component_separators = {
                left = "|";
                right = "|";
            };
        };      
    };  
  };
}
