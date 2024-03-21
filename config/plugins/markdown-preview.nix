{pkgs, ...}: {
  config = {
    plugins.mkdnflow= {
      enable = true;
    };
    plugins.markdown-preview = {
      enable = true;
      settings = {
        autoClose = true;

        theme = "dark";

        browser = "${pkgs.ephemeral}/bin/com.github.cassidyjames.ephemeral";
      };
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
