{
  imports = [
    ./autocommands.nix
    ./theme.nix
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./todo.nix
  ];

  # not shure where this belongs: probably in my home manager conf.
  config = {
    plugins.lsp.servers.rust-analyzer.installRustc = true;
    plugins.lsp.servers.rust-analyzer.installCargo = true;
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    # Highlight and remove extra white spaces
    highlight.ExtraWhitespace.bg = "#242628"; # TODO! ADD Nix-Colors
    match.ExtraWhitespace = "\\s\\+$";
  };
}
