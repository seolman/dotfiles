{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    editors.helix.enable = lib.mkEnableOption "enables helix";
  };

  config = lib.mkIf config.editors.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = lib.mkForce "ayu_dark";
        editor = {
          line-number = "relative";
          continue-comments = false;
          completion-trigger-len = 1;
          true-color = true;
          color-modes = true;
          popup-border = "popup";
          statusline = {
            left = [
              "mode"
              "spacer"
              "version-control"
              "workspace-diagnostics"
            ];
            center = [
              "spinner"
              "file-name"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            right = [
              "primary-selection-length"
              "position"
              "position-percentage"
              "spacer"
            ];
            mode.normal = "NORMAL";
            mode.insert = "INSERT";
            mode.select = "SELECT";
          };
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "block";
          };
          smart-tab = {
            enable = true;
            supersede-menu = true;
          };
          inline-diagnostics.cursor-line = "hint";
          lsp = {
            display-inlay-hints = true;
            inlay-hints-length-limit = 20;
          };
        };
        keys.normal = {
          " " = {
            "i" = ":toggle lsp.display-inlay-hints";
          };
        };
      };
      languages = {
        language = [
          {
            name = "tsx";
            auto-format = true;
            language-servers = [ "typescript-language-server" ];
          }
          {
            name = "nix";
            auto-format = true;
          }
        ];
      };
      extraConfig = "";
      extraPackages = with pkgs; [
        nixd
        nixfmt-tree
        clang-tools
        typescript-language-server
        vscode-langservers-extracted
        emmet-language-server
        tailwindcss-language-server
        gopls
        lua-language-server
        rust-analyzer
        marksman
        markdown-oxide
        tinymist
        yaml-language-server
        tombi
        bash-language-server
        texlab
        docker-language-server
        glsl_analyzer
        jdt-language-server
        kotlin-language-server
        ruff

        prettier

        delve
        lldb
      ];
    };
  };
}
