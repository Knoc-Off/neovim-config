{
  config = {
    plugins.none-ls = {
      enable = true;

      sources.formatting.mdformat.enable = true;
      sources.formatting.markdownlint.enable = true;
    };
  };
}
