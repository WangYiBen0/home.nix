{
  lib,
  fetchurl,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation rec {
  pname = "lxgw-neozhisong";
  version = "1.064";

  src = fetchurl {
    url = "https://github.com/lxgw/LxgwNeoZhiSong/releases/download/v${version}/LXGWNeoZhiSong.ttf";
    hash = "sha256-SpWuDcPcw8gEPYO23zNCIuzP28psDuiogGrNEWctnCU=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 $src $out/share/fonts/truetype/LXGWNeoZhiSong.ttf

    runHook postInstall
  '';

  meta = {
    description = "A Chinese serif font derived from IPAmj Mincho";
    homepage = "https://github.com/lxgw/LxgwNeoZhiSong";
    license = lib.licenses.ipa;
    platforms = lib.platforms.all;
  };
}
