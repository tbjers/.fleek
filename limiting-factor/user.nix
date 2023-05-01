{ pkgs, misc, lib, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek.
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors

  systemd.user.tmpfiles.rules = [
    "L /home/tbjers/Desktop - - - - /home/tbjers/sync/Desktop"
    "L /home/tbjers/Documents - - - - /home/tbjers/sync/Documents"
    "L /home/tbjers/Music - - - - /home/tbjers/sync/Music"
    "L /home/tbjers/Pictures - - - - /home/tbjers/sync/Pictures"
    "L /home/tbjers/Templates - - - - /home/tbjers/sync/Templates"
    "L /home/tbjers/Videos - - - - /home/tbjers/sync/Videos"
  ];
}
