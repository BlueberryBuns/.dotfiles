{
  inputs,
  self,
  pkgs,
  ...
}: 

{
  programs.nixvim.globals.mapleader = " ";
  imports = [
    ./colorschemes.nix
    ./keymaps.nix
    ./bufferline.nix
    ./harpoon.nix
    ./lualine.nix
    ./neo-tree.nix

    # Bloated packages
    ./telescope
    ./treesitter
    ./lsp
  ] ++ [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    enableMan = true; # install man pages for nixvim options
    clipboard.register = "unnamedplus"; # use system clipboard instead of internal registers

    opts = {
      # # Lua reference:
      # vim.o behaves like :set
      # vim.go behaves like :setglobal
      # vim.bo for buffer-scoped options
      # vim.wo for window-scoped options (can be double indexed)

      #
      # ========= General Appearance =========
      #
      hidden = true; # Makes vim act like all other editors, buffers can exist in the background without being in a window. http://items.sjbach.com/319/configuring-vim-right
      number = true; # show line numbers
      relativenumber = true; # show relative linenumbers
      laststatus = 0; # Display status line always
      history = 1000; # Store lots of :cmdline history
      showcmd = true; # Show incomplete cmds down the bottom
      showmode = true; # Show current mode down the bottom
      autoread = true; # Reload files changed outside vim
      lazyredraw = true; # Redraw only when needed
      showmatch = true; # highlight matching braces
      ruler = true; # show current line and column
      visualbell = true; # No sounds

      listchars = "trail:·"; # Display tabs and trailing spaces visually

      wrap = false; # Don't wrap lines
      linebreak = true; # Wrap lines at convenient points

      # ========= Font =========
      guifont = "NotoSansMono:h9"; # fontname:fontsize

      # ========= Cursor =========
      guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,n-v-i:blinkon0";

      # ========= Redirect Temp Files =========
      # backup
      backupdir = "$HOME/.vim/backup//,/tmp//,.";
      writebackup = false;
      # swap
      directory = "$HOME/.vim/swap//,/tmp//,.";

      # ================ Indentation ======================
      autoindent = true;
      cindent = true; # automatically indent braces
      smartindent = true;
      smarttab = true;
      shiftwidth = 4;
      softtabstop = 4;
      tabstop = 4;
      expandtab = true;

      # ================ Folds ============================
      foldmethod = "indent"; # fold based on indent
      foldnestmax = 3; # deepest fold is 3 levels
      foldenable = false; # don't fold by default

      # ================ Splits ============================
      splitbelow = true;
      splitright = true;

      # ================ Completion =======================
      wildmode = "list:longest,list:full"; # for tab completion in : command mode
      wildmenu = true; # enable ctrl-n and ctrl-p to scroll thru matches
      # stuff to ignore when tab completing
      wildignore = "*.o,*.obj,*~,vim/backups,sass-cache,DS_Store,vendor/rails/**,vendor/cache/**,*.gem,log/**,tmp/**,*.png,*.jpg,*.gif";

      # ================ Scrolling ========================
      scrolloff = 4; # Start scrolling when we're 4 lines away from margins
      sidescrolloff = 15;
      sidescroll = 1;

      # ================ Search and Replace ========================
      incsearch = true; # searches incrementally as you type instead of after 'enter'
      hlsearch = true; # highlight search results
      ignorecase = true; # search case insensitive
      smartcase = true; # search matters if capital letter
      inccommand = "split"; # preview incremental substitutions in a split

      # ================ Movement ========================
      backspace = "indent,eol,start"; # allow backspace in insert mode
    };

    extraPlugins = builtins.attrValues {
      
    };
  };
}

