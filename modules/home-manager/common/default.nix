{
  outputs,
  userConfig,
  pkgs,
  ...
}: {
  imports = [
    ../misc/qt
    ../programs/aerospace
    ../programs/alacritty
    ../programs/atuin
    ../programs/bat
    ../programs/brave
    ../programs/btop
    ../programs/fastfetch
    ../programs/fzf
    ../programs/git
    ../programs/go
    ../programs/gpg
    ../programs/k9s
    ../programs/krew
    ../programs/lazygit
    ../programs/neovim
    ../programs/starship
    ../programs/tmux
    ../programs/zsh
    ../scripts
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Home-Manager configuration for the user's home environment
  home = {
    username = "${userConfig.name}";
    homeDirectory = "/Users/${userConfig.name}";
  };

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      anki-bin
      dig
      du-dust
      eza
      fd
      jq
      kubectl
      lazydocker
      nh
      openconnect
      pipenv
      python3
      ripgrep
      terraform
      colima
      docker
      hidden-bar
      raycast
    ];

  # Catpuccin flavor and accent
  catppuccin = {
    flavor = "macchiato";
    accent = "lavender";
  };
}
