{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  home.activation.downloadsSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ln -sfn "/mnt/c/Users/Seolman/Downloads" "$HOME/Downloads"
  '';

  home.packages = with pkgs; [
    gcc
    nodejs_latest
    temurin-bin
    gradle

    gemini-cli
    github-cli
    lazygit

    jq
  ];

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    configPath = "${config.xdg.configHome}/starship/starship.toml";
    settings = {
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };
      git_commit = {
        tag_symbol = " tag ";
      };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
      aws.symbol = "aws ";
      azure.symbol = "az ";
      buf.symbol = "buf ";
      bun.symbol = "bun ";
      c.symbol = "C ";
      cpp.symbol = "C++ ";
      cobol.symbol = "cobol ";
      conda.symbol = "conda ";
      container.symbol = "container ";
      crystal.symbol = "cr ";
      cmake.symbol = "cmake ";
      daml.symbol = "daml ";
      dart.symbol = "dart ";
      deno.symbol = "deno ";
      dotnet.symbol = ".NET ";
      directory.read_only = " ro";
      docker_context.symbol = "docker ";
      elixir.symbol = "exs ";
      elm.symbol = "elm ";
      fennel.symbol = "fnl ";
      fossil_branch.symbol = "fossil ";
      gcloud.symbol = "gcp ";
      git_branch.symbol = "git ";
      gleam.symbol = "gleam ";
      golang.symbol = "go ";
      gradle.symbol = "gradle ";
      guix_shell.symbol = "guix ";
      haskell.symbol = "haskell ";
      helm.symbol = "helm ";
      hg_branch.symbol = "hg ";
      java.symbol = "java ";
      julia.symbol = "jl ";
      kotlin.symbol = "kt ";
      lua.symbol = "lua ";
      nodejs.symbol = "nodejs ";
      memory_usage.symbol = "memory ";
      meson.symbol = "meson ";
      nats.symbol = "nats ";
      nim.symbol = "nim ";
      nix_shell.symbol = "nix ";
      ocaml.symbol = "ml ";
      opa.symbol = "opa ";
      os.symbols = {
        AIX = "aix ";
        Alpaquita = "alq ";
        AlmaLinux = "alma ";
        Alpine = "alp ";
        Amazon = "amz ";
        Android = "andr ";
        Arch = "rch ";
        Artix = "atx ";
        Bluefin = "blfn ";
        CachyOS = "cach ";
        CentOS = "cent ";
        Debian = "deb ";
        DragonFly = "dfbsd ";
        Emscripten = "emsc ";
        EndeavourOS = "ndev ";
        Fedora = "fed ";
        FreeBSD = "fbsd ";
        Garuda = "garu ";
        Gentoo = "gent ";
        HardenedBSD = "hbsd ";
        Illumos = "lum ";
        Kali = "kali ";
        Linux = "lnx ";
        Mabox = "mbox ";
        Macos = "mac ";
        Manjaro = "mjo ";
        Mariner = "mrn ";
        MidnightBSD = "mid ";
        Mint = "mint ";
        NetBSD = "nbsd ";
        NixOS = "nix ";
        Nobara = "nbra ";
        OpenBSD = "obsd ";
        OpenCloudOS = "ocos ";
        openEuler = "oeul ";
        openSUSE = "osuse ";
        OracleLinux = "orac ";
        Pop = "pop ";
        Raspbian = "rasp ";
        Redhat = "rhl ";
        RedHatEnterprise = "rhel ";
        RockyLinux = "rky ";
        Redox = "redox ";
        Solus = "sol ";
        SUSE = "suse ";
        Ubuntu = "ubnt ";
        Ultramarine = "ultm ";
        Unknown = "unk ";
        Uos = "uos ";
        Void = "void ";
        Windows = "win ";
      };
      package.symbol = "pkg ";
      perl.symbol = "pl ";
      php.symbol = "php ";
      pijul_channel.symbol = "pijul ";
      pixi.symbol = "pixi ";
      pulumi.symbol = "pulumi ";
      purescript.symbol = "purs ";
      python.symbol = "py ";
      quarto.symbol = "quarto ";
      raku.symbol = "raku ";
      rlang.symbol = "r ";
      ruby.symbol = "rb ";
      rust.symbol = "rs ";
      scala.symbol = "scala ";
      spack.symbol = "spack ";
      solidity.symbol = "solidity ";
      status.symbol = "[x](bold red) ";
      sudo.symbol = "sudo ";
      swift.symbol = "swift ";
      typst.symbol = "typst ";
      terraform.symbol = "terraform ";
      zig.symbol = "zig ";
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "seolman";
      user.email = "tjfehdgns@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # programs.gh = {
  #   enable = true;
  #   extensions = [ ];
  #   settings = { };
  # };

  # programs.lazygit = {
  #   enable = true;
  #   settings = { };
  # };

  editors.helix.enable = true;

  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      serialize_pane_viewport = true;
      theme = lib.mkForce "ayu-dark";
      default_layout = "dev";
      scroll_buffer_size = 100000;
      # copy_command = "";
      styled_underlines = false;
      show_startup_tips = false;
    };
    layouts = {
      dev = {
        layout = {
          _children = [
            {
              default_tab_template = {
                _children = [
                  {
                    pane = {
                      size = 1;
                      borderless = true;
                      plugin = {
                        location = "zellij:tab-bar";
                      };
                    };
                  }
                  { "children" = { }; }
                  # {
                  #   pane = {
                  #     size = 2;
                  #     borderless = true;
                  #     plugin = {
                  #       location = "zellij:status-bar";
                  #     };
                  #   };
                  # }
                ];
              };
            }
            {
              tab = {
                _props = {
                  name = "Editor";
                  focus = true;
                };
                _children = [
                  {
                    pane = {
                      command = "hx";
                    };
                  }
                ];
              };
            }
            {
              tab = {
                _props = {
                  name = "Copilot";
                };
                _children = [
                  {
                    pane = {
                      command = "gemini";
                    };
                  }
                ];
              };
            }
            {
              tab = {
                _props = {
                  name = "Shell";
                };
                _children = [
                  {
                    pane = {
                      command = "bash";
                    };
                  }
                ];
              };
            }
          ];
        };
      };
    };
    extraConfig = ''
      keybinds clear-defaults=true {
        normal {}
        locked {}
        resize {
          bind "h" { Resize "Increase Left"; }
          bind "j" { Resize "Increase Down"; }
          bind "k" { Resize "Increase Up"; }
          bind "l" { Resize "Increase Right"; }
          bind "H" { Resize "Decrease Left"; }
          bind "J" { Resize "Decrease Down"; }
          bind "K" { Resize "Decrease Up"; }
          bind "L" { Resize "Decrease Right"; }
          bind "+" { Resize "Increase"; }
          bind "-" { Resize "Decrease"; }
        }
        pane {}
        move {}
        tab {}
        scroll {
          bind "j" { ScrollDown; }
          bind "k" { ScrollUp; }
          bind "d" { HalfPageScrollDown; }
          bind "u" { HalfPageScrollUp; }
          bind "e" { EditScrollback; SwitchToMode "Normal"; }
          bind "/" { SwitchToMode "EnterSearch"; SearchInput 0; }
          bind "y" { Copy; }
        }
        search {
          bind "j" { ScrollDown; }
          bind "k" { ScrollUp; }
          bind "d" { HalfPageScrollDown; }
          bind "u" { HalfPageScrollUp; }
          bind "n" { Search "down"; }
          bind "N" { Search "up"; }
        }
        entersearch {
          bind "Ctrl c" "Esc" { SwitchToMode "Scroll"; }
          bind "Enter" { SwitchToMode "Search"; }
        }
        renametab {
            bind "Ctrl c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenameTab; SwitchToMode "Normal"; }
        }
        renamepane {
            bind "Ctrl c" { SwitchToMode "Normal"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "Normal"; }
        }
        session {}
        tmux {
          bind "[" { SwitchToMode "Scroll"; }
          bind "Ctrl g" { Write 2; SwitchToMode "Normal"; }
          bind "\"" { NewPane "Down"; SwitchToMode "Normal"; }
          bind "%" { NewPane "Right"; SwitchToMode "Normal"; }
          bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
          bind "c" { NewTab; SwitchToMode "Normal"; }
          bind "," { SwitchToMode "RenameTab"; }
          bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
          bind "n" { GoToNextTab; SwitchToMode "Normal"; }
          bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
          bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
          bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
          bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
          bind "H" { MovePane "Left"; SwitchToMode "Normal"; }
          bind "J" { MovePane "Down"; SwitchToMode "Normal"; }
          bind "K" { MovePane "Up"; SwitchToMode "Normal"; }
          bind "L" { MovePane "Right"; SwitchToMode "Normal"; }
          bind "1" { GoToTab 1; SwitchToMode "Normal"; }
          bind "2" { GoToTab 2; SwitchToMode "Normal"; }
          bind "3" { GoToTab 3; SwitchToMode "Normal"; }
          bind "4" { GoToTab 4; SwitchToMode "Normal"; }
          bind "5" { GoToTab 5; SwitchToMode "Normal"; }
          bind "6" { GoToTab 6; SwitchToMode "Normal"; }
          bind "7" { GoToTab 7; SwitchToMode "Normal"; }
          bind "8" { GoToTab 8; SwitchToMode "Normal"; }
          bind "9" { GoToTab 9; SwitchToMode "Normal"; }
          bind "Tab" { ToggleTab; }
          bind "o" { FocusNextPane; }
          bind "d" { Detach; }
          bind "Space" { NextSwapLayout; SwitchToMode "Normal"; }
          bind "x" { CloseFocus; SwitchToMode "Normal"; }
          bind "f" { ToggleFloatingPanes; SwitchToMode "Normal"; }
          bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
          bind "d" { Detach; }
          bind "r" { SwitchToMode "Resize"; }
          bind "w" {
            LaunchOrFocusPlugin "session-manager" {
                floating true
                move_to_focused_tab true
            };
            SwitchToMode "Normal"
          }
        }
        shared_except "normal" "locked" {
          bind "Esc" "Enter" { SwitchToMode "Normal"; }
        }
        shared_except "tmux" "locked" {
          bind "Ctrl g" { SwitchToMode "Tmux"; }
        }
      }

      plugins {
        tab-bar location="zellij:tab-bar"
        status-bar location="zellij:status-bar"
        strider location="zellij:strider"
        compact-bar location="zellij:compact-bar"
        session-manager location="zellij:session-manager"
        welcome-screen location="zellij:session-manager" {
            welcome_screen true
        }
        filepicker location="zellij:strider" {
            cwd "/"
        }
        configuration location="zellij:configuration"
        plugin-manager location="zellij:plugin-manager"
        about location="zellij:about"
      }
    '';
  };

  programs.yazi = {
    enable = true;
    extraPackages = with pkgs; [
      ffmpeg
      p7zip
      jq
      poppler
      fd
      ripgrep
      fzf
      zoxide
      resvg
      imagemagick
      xclip
      wl-clipboard
      xsel
    ];
    settings = {
      mgr = {
        ratio = [
          1
          4
          4
        ];
        sort_by = "natural";
        show_hidden = true;
      };
    };
  };

  home.stateVersion = "25.11";
}
