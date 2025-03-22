{
  description = "DevShell for Wayland + Vulkan + Rust-prosjekt";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # "aarch64-linux" for ARM
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          pkg-config
          meson
          ninja
        ];

        buildInputs = with pkgs; [
          rustc
          cargo
          wayland
          wayland-protocols
          wayland-utils
          libxkbcommon
          vulkan-tools
          vulkan-headers
          vulkan-loader
          vulkan-validation-layers
          mesa
          mesa-demos
          glfw
          wlroots
          xorg.libxcb
          xwayland
          seatd
          weston
        ];

        shellHook = ''
          export XDG_RUNTIME_DIR=/tmp/runtime-vkcomp
          mkdir -p "$XDG_RUNTIME_DIR"
          chmod 700 "$XDG_RUNTIME_DIR"
          export WAYLAND_DISPLAY=vkcomp-0

          echo "Bytt til en TTY (Ctrl+Alt+F3), kjør 'nix develop', deretter 'cargo run'"
        '';
      };
    };
}

