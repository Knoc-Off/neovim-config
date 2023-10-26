{
  imports = [
    ./theme.nix
    #./autocommands.nix
    #./completion.nix
    #./keymappings.nix
    #./options.nix
    #./todo.nix

    #./plugins/lsp.nix
    #./plugins/extra.nix
    ./plugins/lsp
  ];

  config = {
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    # Highlight and remove extra white spaces
    highlight.ExtraWhitespace.bg = "#242628"; # TODO! ADD Nix-Colors
    match.ExtraWhitespace = "\\s\\+$";
  };
}
