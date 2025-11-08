{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
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
