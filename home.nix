{ config, pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      
    };
  };

  
  # managed by fleek, modify ~/.fleek.yml to change installed packages
  
  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  home.packages = [
    # user selected packages
    pkgs.cascadia-code
    pkgs.chezmoi
    pkgs.fd
    pkgs.go_1_20
    pkgs.golangci-lint
    pkgs.gopls
    pkgs.gotests
    pkgs.helix
    pkgs.mc
    pkgs.nixfmt
    pkgs.nodejs-18_x
    pkgs.opensc
    pkgs.podman
    pkgs.pre-commit
    pkgs.python3Full
    pkgs.ranger
    pkgs.ruby_3_1
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.terraform
    pkgs.terraform-docs
    pkgs.terraform-providers.ansible
    pkgs.terraform-providers.cloudflare
    pkgs.terraform-providers.consul
    pkgs.terraform-providers.digitalocean
    pkgs.terraform-providers.helm
    pkgs.terraform-providers.kubernetes
    pkgs.terraform-providers.minio
    pkgs.terraform-providers.random
    pkgs.tfsec
    pkgs.tflint
    # Fleek Bling
    pkgs.git
    pkgs.htop
    pkgs.github-cli
    pkgs.glab
    pkgs.fzf
    pkgs.ripgrep
    pkgs.vscode
    pkgs.lazygit
    pkgs.jq
    pkgs.yq
    pkgs.neovim
    pkgs.neofetch
    pkgs.btop
    pkgs.cheat
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  fonts.fontconfig.enable = true; 
  home.stateVersion =
    "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
