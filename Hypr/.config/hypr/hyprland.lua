-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- always refer to Hyprland wiki
-- https://wiki.hyprland.org/

-- Initial boot script enable to apply initial wallpapers, theming, new settings etc.
-- suggest not to change this or delete this including deleting referrence file in ~/.config/hypr/.initial_startup_done
-- as long as the referrence file is present, this initial-boot.sh will not execute
-- Load keybinds
-- Load keybinds using dofile with absolute path
local Home = os.getenv("HOME") or os.getenv("USERPROFILE") or "/tmp"
hl.exec_cmd(Home .. "/.config/hypr/initial-boot.sh")

-- Sourcing external config files
local configs = Home .. "/.config/hypr/configs" -- Default Configs directory path

dofile(configs .. "/Keybinds.lua") -- Pre-configured keybinds

-- ## This is where you want to start tinkering
local UserConfigs = Home .. "/.config/hypr/UserConfigs" -- User Configs directory path

dofile(UserConfigs .. "/Startup_Apps.lua") -- put your start-up packages on this file

dofile(UserConfigs .. "/ENVariables.lua") -- Environment variables to load

--dofile(UserConfigs .. "/Monitors.lua") -- Its all about your monitor config (old dots) will remove on push to main
--dofile(UserConfigs .. "/WorkspaceRules.lua") -- Hyprland workspaces (old dots) will remove on push to main

dofile(UserConfigs .. "/Laptops.lua") -- For laptop related

dofile(UserConfigs .. "/LaptopDisplay.lua") -- Laptop display related. You need to read the comment on this file

dofile(UserConfigs .. "/WindowRules.lua") -- all about Hyprland Window Rules and Layer Rules

dofile(UserConfigs .. "/UserDecorations.lua") -- Decorations config file

dofile(UserConfigs .. "/UserAnimations.lua") -- Animation config file

dofile(UserConfigs .. "/UserKeybinds.lua") -- Put your own keybinds here

dofile(UserConfigs .. "/UserSettings.lua") -- Main Hyprland Settings.

dofile(UserConfigs .. "/01-UserDefaults.lua") -- settings for User defaults apps

-- nwg-displays
dofile(Home .. "/.config/hypr/monitors.lua")
dofile(Home .. "/.config/hypr/workspaces.lua")
