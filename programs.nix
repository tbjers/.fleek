{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  # add your personalized program configuration in ./user.nix   

  # Bling supplied programs

  # User specified programs 
    programs.atuin.enable = true; 
    programs.bat.enable = true; 
    programs.direnv.enable = true; 
    programs.emacs.enable = true; 
    programs.exa.enable = true; 
    programs.gpg.enable = true; 
    programs.navi.enable = true; 
    programs.starship.enable = true; 
    programs.zoxide.enable = true;

}
