{
  config = {
    plugins.markdown-preview = {
      enable = true;

      autoClose = false;

      theme = "dark";

      browser = "chromium";
    };

    keymaps = [
      {
        action = ":MarkdownPreview<cr>";
        key = "<leader>m";
        options = {
          silent = true;
        };
      }
    ];
  };
}
