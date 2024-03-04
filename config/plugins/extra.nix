{ pkgs, config, lib, ... }: {
  config = {
    plugins = {
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
        };
      };
      nvim-autopairs.enable = false;
    };

    extraPlugins = with pkgs.vimExtraPlugins; [
      nvim-transparent
      plenary-nvim
      nui-nvim
      #nvim-surround
      #CodeGPT-nvim


      onedarkpro-nvim

#      (pkgs.vimUtils.buildVimPlugin rec {
#        pname = "darkplus";
#        version = "1826879d9cb14e5d93cd142d19f02b23840408a6";
#        src = pkgs.fetchFromGitHub {
#          owner = "LunarVim";
#          repo = "darkplus.nvim";
#          rev = version;
#          sha256 = "sha256-/e7PCA931t5j0dlvfZm04dQ7dvcCL/ek+BIe1zQj5p4=";
#        };
#      })
    ];
    # ++ (with pkgs.vimExtraPlugins; [ nvim-transparent ]);

    extraConfigLuaPre = ''
      require("transparent").setup({
        groups = { -- table: default groups
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        },
        extra_groups = {}, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })

    '';



  };
}
