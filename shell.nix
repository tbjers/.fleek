{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
    programs.exa.enableAliases = true;
    
    programs.exa.extraOptions = [
   "--group-directories-first"
   "--header"
];
    
    programs.bat.config = {
  theme = "TwoDark";
};
    # bash
  programs.bash.profileExtra = "[ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh";
  programs.bash.initExtra = "source <(fleek completion bash)";
  programs.bash.enableCompletion = true;
  programs.bash.enableVteIntegration = true;
  programs.bash.enable = true;
}
