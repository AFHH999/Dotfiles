# 🍘 Dotfiles

> **My personal configuration files for Arch Linux, Hyprland, Neovim, Tmux, and Zsh.**

![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-blue?style=for-the-badge&logo=archlinux)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-cyan?style=for-the-badge&logo=hyprland)
![Neovim](https://img.shields.io/badge/Editor-LazyVim-green?style=for-the-badge&logo=neovim)
![Tmux](https://img.shields.io/badge/Terminal_Mux-Tmux-88c0d0?style=for-the-badge&logo=tmux)

## ⚡ Installation

These dotfiles are deployed and managed automatically using Ansible.
👉 **Please refer to my [PC_setup](https://github.com/AFHH999/setup_pc) repository for the installation script.**

---

## 🛠️ Overview

### 💎 Hyprland

A highly customized Wayland compositor setup based on **JaKooLit's** configurations.

* **Aesthetics:** Dynamic wallpapers managed by `swww` and `wallust`.
* **Utilities:** Custom scripts for Game Mode, Wallpaper Effects, and System Updates.
* **Lock Screen:** Custom `hyprlock` configuration.
* **App Launcher:** Rofi (Wayland).

### 💤 Neovim (LazyVim)

A comprehensive IDE environment built on top of **LazyVim**.

* **Theme:** Carbonfox.
* **Development:** Full LSP support for Rust (Rustaceanvim) and Python, with `nvim-dap` for debugging.
* **Navigation:** Enhanced workflow with Harpoon, Snipe, FZF-Lua, and Yazi integration.

### 📟 Tmux

A clean, keyboard-centric terminal multiplexer.

* **Theme:** Nord.
* **Navigation:** Vim-style pane navigation (`h`, `j`, `k`, `l`) and `tmux-yank` for clipboard integration.
* **Prefix:** Remapped to `Ctrl + Space` for ergonomics.

### 🐚 Zsh

A robust shell environment.

* **Framework:** Oh My Zsh with the Lambda theme.
* **Tools:** Replaces standard commands with modern alternatives (`lsd`, `zoxide`, `bat`, `fzf`).

---

## 🧩 Credits

* **Hyprland Base:** [JaKooLit](https://github.com/JaKooLit)
* **Neovim Base:** [LazyVim](https://www.lazyvim.org/)
* **Tmux Theme:** [Arctic Ice Studio](https://github.com/arcticicestudio/nord-tmux)

---

## 📜 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
