LibX Wiki

LibX is a library mod for minecraft.

You can download it on [CurseForge](https://www.curseforge.com/minecraft/mc-mods/libx) (recommended) or [Modrinth](https://modrinth.com/mod/libx).

Use LibX in a development environemnt:

```groovy
repositories {
    maven {
        name = 'MelanX Maven'
        url = 'https://maven.melanx.de/'
    }
}

dependencies {
    compile fg.deobf("io.github.noeppi_noeppi.mods:LibX:${mc_version}-${libx-version}")
}
```

Javadoc can be found at https://git.io/libx