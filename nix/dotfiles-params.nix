{ config, lib, pkgs, ... }:

with lib;
{
  options.dotfiles.params = {
    username = mkOption { type = types.str; };
    fullname = mkOption { type = types.str; };
    signature = mkOption { type = types.str; };
    email = mkOption { type = types.str; };
  };
  config = { };
}
