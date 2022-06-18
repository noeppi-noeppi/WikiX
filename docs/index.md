# LibX Wiki

LibX is a library mod for minecraft.

You can download it on [CurseForge](https://www.curseforge.com/minecraft/mc-mods/libx) or [Modrinth](https://modrinth.com/mod/libx).

Use LibX in a development environment:

```groovy
repositories {
    maven {
        name = 'ModdingX Maven'
        url = 'https://maven.moddingx.org/'
    }
}

dependencies {
    annotationProcessor fg.deobf("org.moddingx:LibX:${mc_version}-${libx-version}")
    implementation fg.deobf("org.moddingx:LibX:${mc_version}-${libx-version}")
}
```

Javadoc can be found at [https://moddingx.org/libx](https://moddingx.org/libx).
