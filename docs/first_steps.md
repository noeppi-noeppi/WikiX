# First Steps

Add LibX as a dependency as described [here](index.md).

### Declare dependency in mods.toml

Put this into your `mods.toml` file and replace `modid` with your mods id and `libx_version` with the minimum required LibX version..

```toml
[[dependencies.modid]]
    modId="libx"
    mandatory=true
    versionRange="[libx_version,)"
    ordering="NONE"
    side="BOTH"
```

### Extending ModX

Most stuff in LibX requires your mod class to extends `ModX`.

This will provide you with some abstract methods for setup events and a logger.
You can also pass a `CreativeModeTab` to the `super` constructor. This tab is then used as the mods tab by other LibX features.
If you plan to add multiple creative tabs, you should not use this feature.

You should now check out other parts in the wiki to see what features from LibX are useful for you.