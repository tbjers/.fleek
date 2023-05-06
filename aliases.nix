{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
   home.shellAliases = {
    cat = "bat";
    
    catp = "bat -P";
    
    cz = "chezmoi";
    
    czg = "chezmoi git";
    
    db = "distrobox";
    
    fleeks = "cd ~/.local/share/fleek";
    
    g = "git";
    
    nah = "git reset --hard; git clean -df;";
    
    tf = "terraform";
    };
}
