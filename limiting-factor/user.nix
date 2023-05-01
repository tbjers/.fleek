{ pkgs, misc, lib, config, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek.
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors

  systemd.user.tmpfiles.rules = [
    "L ${config.home.homeDirectory}/Desktop - - - - ${config.home.homeDirectory}/sync/Desktop"
    "L ${config.home.homeDirectory}/Documents - - - - ${config.home.homeDirectory}/sync/Documents"
    "L ${config.home.homeDirectory}/Music - - - - ${config.home.homeDirectory}/sync/Music"
    "L ${config.home.homeDirectory}/Pictures - - - - ${config.home.homeDirectory}/sync/Pictures"
    "L ${config.home.homeDirectory}/Templates - - - - ${config.home.homeDirectory}/sync/Templates"
    "L ${config.home.homeDirectory}/Videos - - - - ${config.home.homeDirectory}/sync/Videos"
  ];
}
