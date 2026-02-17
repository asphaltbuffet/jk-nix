{ ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        bufferline = "always";
        file-picker.hidden = false;
        lsp.display-inlay-hints = true;
      };
    };

    languages = {
      language-server.ruff = {
        command = "ruff-lsp";
        config.settings = {
          lineLength = 79;
          args = [
            "--ignore=E203,W503"
          ];
        };
      };

      language-server.pylsp.config.pylsp.plugins = {
        pylint.enabled = true;
      };

      language = [
        {
          name = "python";
          language-servers = [
            "ruff"
            "pylsp"
          ];
          auto-format = true;
        }
        {
          name = "nix";
          formatter.command = "nixfmt";
          auto-format = true;
        }
      ];
    };
  };
}
