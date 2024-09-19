{
  programs.nixvim = {
    plugins = {
      bufferline = {
        enable = true;
        separatorStyle = "slant"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };
}
