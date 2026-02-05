inputs: final: prev: {
  apple-fonts = inputs.apple-fonts.packages.${prev.stdenv.hostPlatform.system};
}
