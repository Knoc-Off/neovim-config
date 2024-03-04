{ pkgs, config, lib, ... }: {
  config = {
    plugins = {
      packer= {
        enable = true;
        plugins = [
          (x)
        ];
      };

    };
  };
}

