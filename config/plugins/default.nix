{
  imports = [

    ./extra.nix
    ./markdown-preview.nix

    #./copilot.nix
    ./barbar.nix
    ./comment.nix
    ./floaterm.nix
    #./harpoon.nix # !TODO Broken
    ./lsp
    ./none-ls

    ./lualine.nix
    ./markdown-preview.nix
    #./neorg.nix
    ./neo-tree.nix
    ./startify.nix
    #./tagbar.nix
    ./telescope.nix
    ./treesitter.nix
    #./vimtex.nix
  ];

  config = {

    colorschemes.gruvbox.enable = true;

    plugins = {
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      #nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };
    };
  };
}
