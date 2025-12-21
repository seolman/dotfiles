{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  wsl.enable = true;
  wsl.defaultUser = "seolman";
  # wsl.interop.includePath = false;

  networking.hostName = "nixos-wsl";

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
  };

  services.postgresql = {
    enable = true;
  };

  services.redis.servers."manga-db" = {
    enable = true;
    port = 6379;
  };

  virtualisation.docker = {
    enable = true;
  };
  users.users."seolman".extraGroups = [ "docker" ];

  environment.systemPackages = [ ];

  programs.nix-index = {
    enable = true;
  };

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.seolman = {
    imports = [
      ./home.nix
      inputs.self.outputs.homeManagerModules.default
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.xserver = {
    enable = true;
  };

  environment.sessionVariables = {
    DISPLAY = ":0";
  };

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
