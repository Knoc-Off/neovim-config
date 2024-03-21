{pkgs, ...}: {
  config = {
    plugins.vimtex = {
      enable = true;
    };
    #browser = "${pkgs.ephemeral}/bin/com.github.cassidyjames.ephemeral";

    keymaps = [
      {
        #action = ":MarkdownPreview<cr>";
        #key = "<leader>m";
        #options = {
        #  silent = true;
        #};
      }
    ];
  };
}
