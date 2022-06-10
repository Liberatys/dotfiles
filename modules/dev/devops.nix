{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        devops = {
          enabled = mkEnableOption "devops";
        };
      };
    };
  };

  # All applications needed for devops operatoins / observation and work
  config = mkIf config.modules.dev.devops.enabled {
    home.packages = with pkgs; [
      act
      # dagger
      terraform
      doctl
      fluxcd
      minikube
      kubeval
      kubernetes-helm
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
