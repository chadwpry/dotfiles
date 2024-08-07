{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "observable";
  home.homeDirectory = "/home/observable";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.libiconv
    pkgs.pkg-config
    pkgs.openssl
    pkgs.openssl.dev
    pkgs.git
    pkgs.neovim
    pkgs.tmux
    pkgs.go
    pkgs.rustup
    pkgs.weechat
    pkgs.twitch-cli
    pkgs.tree
    pkgs.watch
    pkgs.watchman
    pkgs.zsh
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.go = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      PROMPT="%F{green}%*%f %F{cyan}%n@%m %F{blue}%~%f %F{red}%f$ ";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };
}
