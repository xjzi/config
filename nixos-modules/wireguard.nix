{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.teletypeOne.fonts;
in {
  options.teletypeOne.wireguard = {
    enable = mkEnableOption "Install and enable the wireguard link";
  };

  config = (mkMerge [
    (mkIf cfg.enable {
      environment.systemPackages = with pkgs; [ wireguard ];
    })
  ]);
}
