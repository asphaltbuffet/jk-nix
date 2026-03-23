{
  pkgs,
  ...
}:
{
  home.file.".claude/CLAUDE.md".text = ''
    All repos live under ~/code/ with paths matching the git remote URL.
    For example, the repo `github.com/<org>/<repo>` is cloned to `~/code/github.com/<org>/<repo>`.
  '';

  home.file.".claude/settings.json".text = builtins.toJSON {
    permissions = {
      allow = [
        "WebSearch"
        "WebFetch"
        "Read"
        "Glob"
        "Grep"
        "Bash(git status:*)"
        "Bash(git log:*)"
        "Bash(git diff:*)"
        "Bash(git branch:*)"
        "Bash(git show:*)"
        "Bash(cargo:*)"
        "Bash(jj status:*)"
        "Bash(jj log:*)"
        "Bash(jj diff:*)"
        "Bash(jj show:*)"
        "Bash(jj branch list:*)"
        "Bash(nix eval:*)"
        "Bash(nix flake show:*)"
        "Bash(nix flake metadata:*)"
        "Bash(nix flake info:*)"
        "Bash(nix flake check:*)"
        "Bash(nix search:*)"
        "Bash(nix path-info:*)"
        "Bash(nix derivation show:*)"
        "Bash(nix store ls:*)"
        "Bash(nix why-depends:*)"
        "Bash(nixos-option:*)"
        "Bash(nix build --dry-run:*)"
        "Bash(nix log:*)"
        "Bash(nix diff-closures:*)"
      ];
      additionalDirectories = [
        "/home/jack/code"
        "/nix"
      ];
    };
    enabledPlugins = {
      "rust-analyzer-lsp@claude-plugins-official" = true;
    };
  };
}
