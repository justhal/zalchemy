# zalchemy

[![release](https://img.shields.io/github/v/release/justhal/zalchemy)](https://github.com/justhal/zalchemy/releases/latest) ![Game Version](https://img.shields.io/badge/PZ%20Version-41.76-red) [![License](https://img.shields.io/github/license/yooksi/pz-zmod)](https://mit-license.org/)

Mod for Project Zomboid to apply custom changes to items (and possibly other game objects in the future, such as traits, recipes, etc.) as desired in a highly-configurable and dynamic way.

## Motivation

There exist many good and interesting mods for Project Zomboid, but often the balance seems off and can't be altered
within the mod itself.  For instance, there are mods that seem purely cosmetic that can actually drastically effect
game balance, with no recourse for those desiring a more challenging, vanilla-like experience except removing or
disabling the offending mod entirely.

This mod attempts to rectify this issue in a generic way.  With zalchemy, you can customize the attributes and effects
of every item in the game.  So, for example, you could bring the effects and bonuses of items added by a mod back
in-line with vanilla items, or remove the bonuses entirely.

## Screenshots

Show everyone how great your mod is.

## Features

You can:
- Nerf overpowered items, groups of items, or types of items.
- Buff underpowered items and weapons, if you so choose.
- Alter the stats of modded and base game items in any way you wish.
- Change the spawn rates of specific items to make them more or less common.
- Make some or all items lighter or heavier, or make a batch of related items all have the same mass.
- Modify containers to be more or less effective.
- Adjust the nutritional content of whatever foods or ingredients you feel like.

## Installation

- Download the [latest release](https://github.com/justhal/zalchemy/releases/latest) from the repository releases
section.
- Unpack the release with your preferred decompression utility[<sup>?</sup>](# "rar, zip, 7zip, etc.") to the game mod
directory.
- Start the game and enable the mod in the mods screen.

For more information read [How To Install / Uninstall Mods](https://theindiestone.com/forums/index.php?/topic/1395-how-to-install-uninstall-mods/) forum thread.

## How to use

Explain different ways in which your mod can be used in-game.

## Potential future additional features

- Include the ability to randomly modify the attributes of item types using a pseudo-random number generator.
- Add a way to modify traits and occupations.
- Improve documentation.
- Make the user interface friendlier and more usable.
- More built-in pre-written examples as a baseline and for inspiration to help people get started modifying item types quickly.

## Credits

I would be remiss if I did not express my admiration and gratitude for the following:

- [The Indie Stone](https://theindiestone.com/) for creating Project Zomboid and making it so compelling and moddable.
- The [Capsid](https://github.com/pzstorm/capsid) Project Zomboid mod development environment which made it relatively
easy to get started with the project template and setup of this mod.
- The [PZ-Libraries](https://github.com/Konijima/PZ-Libraries) tutorial helped with setting up Capsid and
IntelliJ for modding Project Zomboid and bringing in all of the programming documentation and easily-accessible source
code for mod development.
- The [Project Zomboid Modding Guide](https://github.com/FWolfe/Zomboid-Modding-Guide) was invaluable in helping to get
up to speed with the syntax and structure of Project Zomboid mods.
- JetBrains [IntelliJ IDEA](https://www.jetbrains.com/idea/) integrated development environment brought all the
disparate tools used in modern development together and streamlined the process of programming and testing.
- The [EmmyLua](https://plugins.jetbrains.com/plugin/9768-emmylua) plugin for Lua support in IntelliJ provided all
the niceties expected by programmers today to writing code in Lua, such as syntax highlighting, in-line documentation,
and on-the-fly error checking and underline indicators to quickly spot mistakes. 

## License

MIT © [Harold Norwood](https://github.com/justhal)
