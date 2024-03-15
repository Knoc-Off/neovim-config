{
  config = {
    options.completeopt = [ "menu" "menuone" "noselect" ];

    plugins = {
      luasnip.enable = true;

      #coq-nvim.enable = true;

      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            #coq_nvim = "[coq_nvim]";
            nvim_lsp = "[LSP]"; # New

            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
            #cmp_tabby = "[Tabby]"; # should swap to this when possible.
            cmp_tabnine = "[TabNine]";
          };
        };
      };

      cmp = {
        enable = true;

        settings = {
          snippet.expand = "luasnip";

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            #"<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [

            #{ ncoq_nvim= "path"; }
            { name = "path"; }
            { name = "nvim_lsp"; }
            { name = "cmp_tabnine"; }
            #{ name = "cmp_tabby"; }
            #{ name = "nvim_lua"; }
            { name = "luasnip"; }
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
            { name = "neorg"; }
          ];
        };
      };
    };
  };
}

