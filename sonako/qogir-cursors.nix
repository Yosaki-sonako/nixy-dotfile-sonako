# ~/nixy-sonako/qogir-cursors.nix
{ runCommand, qogir-icon-theme }:

runCommand "qogir-cursors" { } ''

  mkdir -p $out/share/icons/Qogir
  cp -r ${qogir-icon-theme}/share/icons/Qogir/cursors $out/share/icons/Qogir/
  cp ${qogir-icon-theme}/share/icons/Qogir/index.theme $out/share/icons/Qogir/

  mkdir -p $out/share/icons/Qogir-Dark
  cp -r ${qogir-icon-theme}/share/icons/Qogir-Dark/cursors $out/share/icons/Qogir-Dark/
  cp ${qogir-icon-theme}/share/icons/Qogir-Dark/index.theme $out/share/icons/Qogir-Dark/
''
