# First Steps

Add LibX as a dependency as described [here](index.md).

## Declare dependency in mods.toml

Put this into your `mods.toml` file and replace `modid` with your mods id and `libx_version` with the minimum required LibX version..

```toml
[[dependencies.modid]]
    modId="libx"
    mandatory=true
    versionRange="[libx_version,)"
    ordering="NONE"
    side="BOTH"
```

## Extending ModX

Most stuff in LibX requires your mod class to extends `ModX`.

This will provide you with some abstract methods for setup events, the possibility to use [ModInit](modinit/index.md) and config guis.

Check out other parts of the wiki to see what other features are useful to you.
