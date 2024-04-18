# Mac Apps Archive
An archive of apps I often use if they ever were to get deleted

- All the credits go to the app creators
## Installation
### Imperatively
```bash
git clone https://github.com/NewDawn0/mac-apps-archive
nix profile install .
```
### Declaratively
1. Add it as an input to your system flake as follows
    ```nix
    {
      inputs = {
        # Your other inputs ...
        mac-apps-archive = {
          url = "github:NewDawn0/mac-apps-archive";
          inputs.nixpkgs.follows = "nixpkgs";
          # Optional: If you use nix-systems or rust-overlay
          inputs.nix-systems.follows = "nix-systems";
          inputs.rust-overlay.follows = "rust-overlay";
        };
      };
    }
    ```
2. Add this to your overlays to expose mac-apps-archive to your pkgs
    ```nix
    (final: prev: {
      mac-apps-archive = inputs.mac-apps-archive.packages.${prev.system}.default;
    })
    ```
3. Then you can either install it in your `environment.systemPackages` using 
    ```nix
    environment.systemPackages = with pkgs; [ mac-apps-archive ];
    ```
    or install it to your `home.packages`
    ```nix
    home.packages = with pkgs; [ mac-apps-archive ];
    ```

## List of apps
### Later:
- executable: `./apps/Later.app`
- repo: `https://github.com/alyssaxuu/later`
- download-url: `https://github.com/alyssaxuu/later/raw/master/Later.dmg`
- homepage: `https://getlater.app`

### Autoclicker:
- executable: `./apps/Autoclick.app`
- repo: `https://github.com/inket/Autoclick`
- download-url: `https://tars.mahdi.jp/apps/autoclick.zip`
