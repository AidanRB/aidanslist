with (import <nixpkgs> { });

let
  dotnet-full =
    with dotnetCorePackages;
    combinePackages [
      sdk_10_0
      runtime_10_0
      aspnetcore_10_0
    ];
in
pkgs.mkShellNoCC {
  packages = [ dotnet-full ];

  DOTNET_ROOT = "${dotnet-full}/share/dotnet/";
}
