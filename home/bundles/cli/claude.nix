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
      ];
      additionalDirectories = [
        "/home/jack/code"
      ];
    };
    enabledPlugins = {
      "rust-analyzer-lsp@claude-plugins-official" = true;
    };
  };
}
