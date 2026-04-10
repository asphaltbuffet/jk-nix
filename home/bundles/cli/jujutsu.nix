{ ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = "Jack Kelly";
      "--scope" = [
        {
          "--when".repositories = [ "~/code/github.com/jack-kelly/" ];
          user.email = "jpk.lly@gmail.com";
        }
        {
          "--when".repositories = [ "~/code/github.com/utilidata/" ];
          user.email = "jkelly@utilidata.com";
        }
      ];
    };
  };
}
