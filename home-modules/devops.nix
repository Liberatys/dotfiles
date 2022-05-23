{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.devops.enabled = mkEnableOption "devops";
  };

  # All applications needed for devops operatoins / observation and work
  config = mkIf config.dotfiles.devops.enabled {
    home.packages = with pkgs; [
      act
      # dagger
      terraform
      doctl
      fluxcd
      minikube
      kubectl
      kube3d
      kubeseal
      # docker-machine-hyperkit
      podman
      lens
      ngrok
    ];
  };
}
