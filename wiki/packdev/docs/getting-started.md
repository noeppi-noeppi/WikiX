# Getting started

After applying the gradle plugin to your build, you'll need to configure your build.
This document briefly lists the main aspects of getting a working build.
For more information, see the other pages in this wiki.

## The modlist

The packs modlist is stored in a file named `modlist.json` in the project root directory.
Mods are pulled from a supported *modding platform*.
The `modlist.json` file can be edited through [Moonstone](https://github.com/ModdingX/Moonstone) with a graphical UI where you can search for mods and install them with one click.
The `modlist.json` also contains information on which *side* (client, server or both) a mod should be installed as well as the minecraft version to use and the mod loader.

## The modpack block

The rest of the modpack configuration is done in the `modpack` block in your `build.gradle`:

```groovy
modpack {
    loader('0.19.2')
    targets {
        curse(12345)
        modrinth()
    }
}
```

This instructs PackDev to use loader version `0.19.2` (the meaning of this depends on the loader used) and build a curseforge and a modrinth pack.
Built targets can be found in `build/target` after executing `gradle build`.

PackDev will then apply and configure a matching gradle plugin for your loader (ForgeGradle or loom).

## Overrides

Overrides can be put in `data/common` for overrides on both client and server and `data/client` and `data/server` fo side-specific overrides.

## Run the game

You can run the game via `gradle runClient` or `gradle runServer`.
This will run a client or server respectively.
The `.minecraft` directory of these runs is `runClient` or `runServer` inside your project root.
This is also where mods wil lcreate their configs. If you want to change them, you need to copy them into the matchov override folder first.
