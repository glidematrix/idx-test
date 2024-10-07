# No user-configurable parameters
{ pkgs, ... }: {

  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.python312Packages.quart
    pkgs.python312Packages.python-dotenv
  ];

  # Shell script that produces the final environment
  bootstrap = ''
    mkdir "$out"
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
    
    cp -rf ${./.} "$out"

    # Set some permissions
    chmod -R +w "$out"

    # Remove the template files themselves and any connection to the template's
    # Git repository
    rm -rf "$out/.git" "$out/idx-template".{nix,json}
  '';
}