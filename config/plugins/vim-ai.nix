{
  pkgs,
  config,
  lib,
  ...
}: {
  config = {
    extraPlugins = with pkgs.vimExtraPlugins; [
      (pkgs.vimUtils.buildVimPlugin rec {
        pname = "vim-ai";
        version = "819c1bb3c79080128a076aff03b16cfc1f4548c7";
        src = pkgs.fetchFromGitHub {
          owner = "madox2";
          repo = "vim-ai";
          rev = version;
          sha256 = "sha256-BZCrQkJzGKZQTvRR/ib6W9vFOSQXlo2nzEQ52jOmJDc=";
        };
      })
    ];

    extraConfigVim = ''
      let g:vim_ai_edit = {
      \  "options": {
      \    "model": "gpt-3.5-turbo",
      \    "temperature": 0.2,
      \  },
      \}


      " custom command suggesting git commit message, takes no arguments
      function! GitCommitMessageFn()
        let l:diff = system('git --no-pager diff --staged')
        let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
        let l:range = 0
        let l:config = {
        \  "engine": "chat",
        \  "options": {
        \    "model": "gpt-3.5-turbo",
        \    "initial_prompt": ">>> system\nyou are a code assistant",
        \    "temperature": 1,
        \  },
        \}
        call vim_ai#AIRun(l:range, l:config, l:prompt)
      endfunction
      command! GitCommitMessage call GitCommitMessageFn()


    '';
  };
}
