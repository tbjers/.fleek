{ pkgs, misc, lib, config, ... }:{
  # FEEL FREE TO EDIT: This file is NOT managed by fleek.
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors

  home.sessionVariables = {
    FLEEK_MANAGED = "1";
    EDITOR = "nano";
  };

  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
  '';

  # For information about available direnv options,
  # please see: https://direnv.net/man/direnv.toml.1.html
  programs.direnv.enable = true;
  programs.direnv.enableBashIntegration = true;
  programs.direnv.config.global.load_dotenv = true;
  programs.direnv.config.global.strict_env = true;
  programs.direnv.config.global.warn_timeout = "400ms";

  programs.emacs.package = pkgs.emacs28-nox;

  programs.gh.enable = true;
  programs.gh.enableGitCredentialHelper = true;
  programs.gh.settings.git_protocol = "ssh";

  programs.git.enable = true;

  programs.git.aliases = {
    br = "branch";
    ci = "commit";
    co = "checkout";
    pu = "pull";
    pul = "pull";
    pus = "push";
    rb = "rebase";
    rbc = "rebase --continue";
    rbs = "rebase --skip";
    st = "status -s";
    push-all = "push --follow-tags";
    pa = "push-all";

    lg =
      "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    merge-ours = "!git checkout --ours   . && git add -u && git commit";
    merge-theirs = "!git checkout --theirs . && git add -u && git commit";
    patch = "!git --no-pager diff --no-color";
    stage = "add";
    staged = "diff --staged";
    sync =
      "!sh -c 'git pull && git diff --quiet HEAD || (git commit $1 && git push)' -";
    tags = "tag -l";
    undo = "reset --soft HEAD^";
    unstage = "reset HEAD";
    unstaged = "diff";
    who = "shortlog -s --";
  };

  programs.git.diff-so-fancy.enable = true;
  programs.git.diff-so-fancy.pagerOpts = [
    "--tabs=4"
    "-RFX"
  ];

  programs.git.extraConfig = {
    advice = {
      detachedHead = false;
    };
    init = {
      defaultBranch = "main";
    };
    commit = {
      gpgSign = true;
    };
    gpg = lib.mkForce {
      program = lib.mkForce "${pkgs.gnupg}/bin/gpg2";
    };
    tag = {
      forceSignAnnotated = true;
      gpgSign = true;
    };
    credential = {
      credentialStore = "gpg";
    };
    url = {
      "ssh://git@github.com" = {
        insteadOf = "https://github.com";
      };
    };
  };

  programs.git.signing = lib.mkForce {
    key = "F189ABC3C4117523";
    gpgPath = "${pkgs.gnupg}/bin/gpg2";
    signByDefault = true;
  };


  programs.gpg.homedir = "${config.home.homeDirectory}/.gnupg";
  programs.gpg.mutableKeys = true;
  programs.gpg.mutableTrust = true;
  programs.gpg.settings = {
    keyid-format = "0xlong";
    keyserver = "hkps://keyserver.ubuntu.com:443";
    personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
    charset = "utf-8";
    no-comments = true;
    no-emit-version = true;
    no-greeting = true;
    list-options = "show-uid-validity";
    with-fingerprint = true;
    require-cross-certification = true;
    no-symkey-cache = true;
    use-agent = true;
    throw-keyids = true;
  };

  programs.ssh.extraConfig = ''
    Match host * exec "gpg-connect-agent UPDATESTARTUPTTY /bye"
  '';

  services.gpg-agent.enable = true;
  services.gpg-agent.verbose = true;
  services.gpg-agent.enableExtraSocket = true;
  services.gpg-agent.enableSshSupport = true;
  services.gpg-agent.defaultCacheTtl = 3600;
  services.gpg-agent.pinentryFlavor = "curses";
  services.gpg-agent.maxCacheTtl = 7200;
  services.gpg-agent.sshKeys = [
    "1EF33AD194BF3CADBC115F751CC2EACF4E075BAD"
  ];

  # You know why this is here, yes, YOU.
  home.shellAliases = { vim = "nvim"; };

  home.activation = {
    getDoomEmacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD export GIT_SSH=${pkgs.openssh}/bin/ssh
      $DRY_RUN_CMD ${pkgs.git}/bin/git -C ~/.config/emacs pull || \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 \
        https://github.com/doomemacs/doomemacs \
        ~/.config/emacs
    '';
    getAstroNvim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD export GIT_SSH=${pkgs.openssh}/bin/ssh
      $DRY_RUN_CMD ${pkgs.git}/bin/git -C ~/.config/nvim pull || \
        $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 \
        https://github.com/AstroNvim/AstroNvim \
        ~/.config/nvim
    '';
  };
}
