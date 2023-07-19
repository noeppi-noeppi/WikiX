# Build Configuration

Besides the [modlist](./modlist.md), the `modpack` block in the buildscript is the main location for modpack configuration.
Here you'll find all options, you can set in the `modpack` block.

## Loader

The loader option configures the used mod-loader.
This option is mandatory.
The loader version can be set like this:

```groovy
modpack {
    loader '42.1.0'
}
```

By default PackDev runs on the intermediate mapping format used by the mod-loader ([SRG](https://github.com/MinecraftForge/MCPConfig) on forge and [intermediary](https://github.com/FabricMC/intermediary) on fabric and quilt).
If you want to debug an issue in your modpack and use a debugger, these cryptic names can be a problem.
To make debugging easier, you can advise PackDev to remap to the official mojang mappings like this:

```groovy
modpack {
    loader '42.1.0', {
        useOfficialMappings()
    }
}
```

???+ danger "Problem with official mappings"
     Using the official mappings can cause a variety of problems, so be sure to try without them before reporting issues.
     Especially on Forge before version `1.17` you can expect build failures with official mappings.

## Author

You can set an optional modpack author that is used by some targets if available:

```gradle
modpack {
    author 'Rubber Duck'
}
```

## Targets

The targets block allows to configure build targets for your modpack:

```groovy
modpack {
    targets {
        curse(12345)
        modrinth()
        server()
        multimc()
        target('id')
    }
}
```

### CurseForge

The [CurseForge](../targets/curseforge.md) target is added via `curse(projectId)` and builds a curse modpack that can be published on [CurseForge](https://www.curseforge.com/minecraft/modpacks).
It contains only *client* data.

### Modrnith

The [Modrinth](../targets/modrinth.md) target is added via `modrinth()` and builds a modrinth pack that can be published on [Modrinth](https://modrinth.com/modpacks).
It contains both *client* and *server* data.

### Server

The [Server](../targets/server.md) target is added via `server()` and builds a server pack.
It contains only *server* data as well as a python install script and a `Dockerfile` to run the server as a container.

### MultiMC

The [MultiMC](../targets/multimc.md) target is added via `multimc()` and builds a MultiMC instance that can be imported using [MultiMC](https://multimc.org/).
It contains only *client* data and shades all mods.

### 3rd party targets

Addons to PackDev can add their own targets.
These can be added using `target('id')` where `id` is the id of the target to add.
