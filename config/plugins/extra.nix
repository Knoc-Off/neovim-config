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

      nvim-autopairs.enable = true;
    };

    extraPlugins = with pkgs.vimExtraPlugins; [
      nvim-transparent
      plenary-nvim
      nui-nvim
      nvim-surround
      CodeGPT-nvim
      copilot-lua

      (pkgs.vimUtils.buildVimPlugin rec {
        pname = "darkplus";
        version = "1826879d9cb14e5d93cd142d19f02b23840408a6";
        src = pkgs.fetchFromGitHub {
          owner = "LunarVim";
          repo = "darkplus.nvim";
          rev = version;
          sha256 = "sha256-/e7PCA931t5j0dlvfZm04dQ7dvcCL/ek+BIe1zQj5p4=";
        };
      })
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

      require('nvim-surround').setup({
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss",
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "\"",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
        },
      })

      require('copilot').setup({
        panel = {
          enabled = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })

    '';



  };
}
