# No user-configurable parameters
{ pkgs, ... }: {

  packages = [
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.python311Packages.quart
    pkgs.python311Packages.python-dotenv
  ];

  # Shell script that produces the final environment
  bootstrap = ''

    cp -rf ${./.} "$out"

    chmod -R +w "$out"

    rm -rf "$out/.git" "$out/idx-template".{nix,json}
  '';
}