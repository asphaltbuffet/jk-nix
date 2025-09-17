{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Jack Kelly";

    aliases = {
      p = "pull --ff-only";
      ff = "merge --ff-only";
      graph = "log --decorate --oneline --graph";
    };

    extraConfig = {
      init.defaultBranch = "main";
      rerere.enabled = true;
    };

    includes = [
      {
        condition = "gitdir:~/code/github.com/jack-kelly/";
        contents = {
          user = {
            email = "jpk.lly@gmail.com";
          };
        };
      }
      {
        condition = "gitdir:~/code/github.com/utilidata/";
        contents = {
          user = {
            email = "jkelly@utilidata.com";
          };
        };
      }
    ];

    difftastic.enable = true;
    lfs.enable = true;

    ignores = [
      ".direnv"
    ];
  };
}
