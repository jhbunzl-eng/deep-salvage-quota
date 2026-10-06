# Deep Salvage Quota

A solo Subnautica mod that adapts a quota-and-extraction loop to salvage diving. Return valuable materials to the lifepod locker and work toward a 100-credit quota.

## Version 0.1.0

- Salvage in the lifepod locker counts toward quota progress.
- Supported materials: metal salvage, quartz, copper, lithium, and diamond.
- Progress reflects what is currently stored; removing items lowers it.
- No deadline, multiplayer, or monsters in this version. Monsters are planned for a later update.
- Subnautica is the only game required. Lethal Company is gameplay inspiration; no Lethal Company files or assets are included.

## Install

Install the mod through Melty, or install BepInEx 5 for Subnautica and place `SubnauticaQuota.dll` from the package in `Subnautica/BepInEx/plugins`. The quota panel appears after the lifepod loads. Store the marked salvage in the lifepod locker to raise progress.

The release package is in [`release/`](release/). This build passed source build and package checks but has not yet been tested in-game. Please test before treating it as a verified release.

## Build from source

Requires Windows, .NET SDK 10, and an installed copy of Subnautica. Run `./build.ps1`; the script validates the design data and builds against the local game and BepInEx files.

## Credits and licensing

Subnautica is the host game. Lethal Company inspired the quota/extraction mechanic. BepInEx is the plugin loader. This repository does not include game assets. A license has not yet been selected; all rights remain with the author unless a license is added.
