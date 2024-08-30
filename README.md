# framework-plymouth
This is a boot logo for Plymouth that enables Framework's firmware image, while also including a spinning Framework gear logo near the bottom.

Follow the steps below to use in a flake-enabled environment:

## 01. Add flake input
Inside your flake.nix file, add theh following to your inputs:
`inputs.framework-laptop.url = "github:JaysFreaky/framework-laptop";`

## 02. Add package variable
Inside whichever file declares your Plymouth config, add this to the top in the 'let' declarations:
`let
  framework-plymouth = inputs.framework-plymouth.packages.${pkgs.system}.default;
in {`

## 03. Declare plymouth theme
You could skip the previous declaration and just include the inputs path, but this method looks better:
`plymouth = {
  enable = true;
  theme = "framework";
  themePackages = [ framework-plymouth ];
};`
