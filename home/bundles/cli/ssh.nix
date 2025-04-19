{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      personalgit = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_github_jack-kelly";
        identitiesOnly = true;
      };
      workgit = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
    includes = [ "~/.ssh/config.work" ];
  };
}
