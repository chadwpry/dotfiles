{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shadow";
  home.homeDirectory = "/Users/shadow";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.awscli
    pkgs.azure-cli
    pkgs.boost
    pkgs.cmake
    pkgs.cocoapods
    pkgs.docker-compose
    pkgs.ffmpeg
    pkgs.fortune
    pkgs.git
    pkgs.glib
    pkgs.gnupg
    pkgs.go
    pkgs.gpgme
    pkgs.htop
    pkgs.jq
    pkgs.libiconv
    pkgs.neovim
    pkgs.openssl
    pkgs.openssl.dev
    pkgs.pkg-config
    pkgs.pulumi
    pkgs.readline
    pkgs.redis
    pkgs.ripgrep
    pkgs.rustup
    pkgs.tmux
    pkgs.tree
    pkgs.twitch-cli
    pkgs.watch
    pkgs.watchman
    pkgs.websocat
    pkgs.weechat
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
