{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  home.username = "tbjers";
  home.homeDirectory = "/home/tbjers";
  programs.git = {
    enable = true;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
      add-nowhitespace =
        "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
    };
    userName = "Torgny Bjers";
    userEmail = "torgny@bjers.org";
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
      gpg.format = "ssh";
    };

    lfs.enable = true;
    ignores = [ ".direnv" "result" ];
  };
}
