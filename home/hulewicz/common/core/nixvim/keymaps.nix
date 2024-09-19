{
  # Keymaps
  programs.nixvim.keymaps = [
    # General Keymaps

    {
      mode = [ "i" ];
      key = "jk";
      action = "<ESC>";
      options = {
        desc = "Exit insert mode with jk";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>nh";
      action = ":nohl<CR>";
      options = {
        desc = "Clear search highlights";
        noremap = true;
      };
    }

    # Increment/Decrement Numbers
    {
      mode = [ "n" ];
      key = "<Leader>+";
      action = "<C-a>";
      options = {
        desc = "Increment number";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>-";
      action = "<C-x>";
      options = {
        desc = "Decrement number";
        noremap = true;
      };
    }

    # Window Management
    {
      mode = [ "n" ];
      key = "<Leader>sv";
      action = "<C-w>v";
      options = {
        desc = "Split window vertically";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>sh";
      action = "<C-w>s";
      options = {
        desc = "Split window horizontally";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>se";
      action = "<C-w>=";
      options = {
        desc = "Make splits equal size";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>sx";
      action = "<cmd>close<CR>";
      options = {
        desc = "Close current split";
        noremap = true;
      };
    }

    # Tab Management
    {
      mode = [ "n" ];
      key = "<Leader>to";
      action = "<cmd>tabnew<CR>";
      options = {
        desc = "Open new tab";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>tx";
      action = "<cmd>tabclose<CR>";
      options = {
        desc = "Close current tab";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>tn";
      action = "<cmd>tabn<CR>";
      options = {
        desc = "Go to next tab";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>tp";
      action = "<cmd>tabp<CR>";
      options = {
        desc = "Go to previous tab";
        noremap = true;
      };
    }
    {
      mode = [ "n" ];
      key = "<Leader>tf";
      action = "<cmd>tabnew %<CR>";
      options = {
        desc = "Open current buffer in new tab";
        noremap = true;
      };
    }
  ];
}



