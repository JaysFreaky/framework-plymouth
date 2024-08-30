# framework-plymouth
This is a boot logo for Plymouth that enables Framework's firmware image, while also including a spinning Framework gear logo near the bottom.

Follow the steps below to use in a flake-enabled environment:

## 01. Add flake input
Inside your flake.nix file, add the following to your inputs:

```nix
inputs.framework-laptop.url = "github:JaysFreaky/framework-laptop";
```

## 02. Add package variable
Inside whichever file declares your Plymouth config, add this to the top in the 'let' declarations:

```nix
let
  framework-plymouth = inputs.framework-plymouth.packages.${pkgs.system}.default;
in {
```

## 03. Declare plymouth theme
To use this package, set the theme and themePackages as so:

```nix
plymouth = {
  enable = true;
  theme = "framework";
  themePackages = [ framework-plymouth ];
};
```

You could skip the variable declaration and just include the inputs path, but a variable looks better:

```nix
  ...
  themePackages = [ inputs.framework-plymouth.packages.${pkgs.system}.default ];
  ...
```

---
# Credits
I came across this theme created by [James Kupke](https://git.sr.ht/~jameskupke/framework-plymouth-theme) and wanted to use it for NixOS, so I ended up making a few adjustments in the derivation and packaging it up via this flake.

