_: {
  imports = [
    ./user.nix
  ];

  home.stateVersion = import ./state-version.nix;
}
