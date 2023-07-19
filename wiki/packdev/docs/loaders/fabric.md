# Fabric modpacks

To use [Fabric Loader](https://fabricmc.net/) as mod-loader, set the `loader` field to `fabric`.

Fabric modpacks use the *fabric-loom* plugin, so it has to be present on the classpath.

## Fabric Example

`build.gradle:`

```gradle
buildscript {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven { url = 'https://maven.moddingx.org/' }
        maven { url = 'https://maven.minecraftforge.net' }
        maven { url = 'https://maven.fabricmc.net' }
    }
    dependencies {
        classpath "org.moddingx:PackDev:${packdev_version}"
        classpath "net.fabricmc:fabric-loom:${loom_version}"
    }
}

apply plugin: 'org.moddingx.packdev'

version = '1'

modpack {
    loader '0.14.21'
    targets {
        multimc()
    }
}
```

`modlist.json`

```json
{
  "api": 2,
  "platform": "modrinth",
  "loader": "fabric",
  "minecraft": "1.19.2",
  "installed": [],
  "dependencies": []
}
```
