# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{pkgs}: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.nodePackages.pnpm
    pkgs.bun
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
  "aaron-bond.better-comments"
      "bradlc.vscode-tailwindcss"
      "christian-kohler.npm-intellisense"
      "christian-kohler.path-intellisense"
      "dbaeumer.vscode-eslint"
      "donjayamanne.githistory"
      "dracula-theme.theme-dracula"
      "eamodio.gitlens"
      "esbenp.prettier-vscode"
      "formulahendry.auto-close-tag"
      "formulahendry.auto-rename-tag"
      "GitHub.vscode-github-actions"
      "GitHub.vscode-pull-request-github"
      "mhutchie.git-graph"
      "naumovs.color-highlight"
      "streetsidesoftware.code-spell-checker"
      "usernamehw.errorlens"
      "wix.vscode-import-cost"
      "yzhang.markdown-all-in-one"
      "PKief.material-icon-theme"
      "bbenoist.Nix"
      "jnoortheen.nix-ide"
     ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [
          # Cover all the variations of language, src-dir, router (app/pages)
          "pages/index.tsx" "pages/index.jsx"
          "src/pages/index.tsx" "src/pages/index.jsx"
          "app/page.tsx" "app/page.jsx"
          "src/app/page.tsx" "src/app/page.jsx"
        ];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--hostname" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}