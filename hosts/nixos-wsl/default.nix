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

  system.stateVersion = "25.05";
}
