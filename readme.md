# kanata installation
## win
c:\Program Files\kanata>kanata --cfg "C:\Users\SergeyYevtushik\Documents\Source\config\shared\kanata\apple-magic.kbd
remapping in wsl works well only if kanata runs on the same admin privelages level as wsl terminal. if wsl started "as admin" then kanata should be started "as admin" as well.

## macos\linux
sudo /usr/local/bin/kanata --cfg ~/.config/kanata/apple-magic.kbd
