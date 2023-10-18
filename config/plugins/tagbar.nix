{
  config = {
    plugins.tagbar = {
      enable = true;
      extraConfig.width = 50;
    };

    keymaps = [
      {
        action = ":TagbarToggle<cr>";
        key = "<C-g>";
        options = {
          silent = true;
        };
      }
    ];
  };
}
