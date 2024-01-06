# NeoForge modpacks

To use [NeoForge](https://projects.neoforged.net/neoforged/neoforge) as mod-loader, set the `loader` field to `neoforge`.

NeoForge modpacks use the *NeoGradle* plugin, so it has to be present on the classpath.

## Forge Example

`build.gradle:`

```gradle
buildscript {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven { url = 'https://maven.moddingx.org/' }
        maven { url = 'https://maven.minecraftforge.net' }
        maven { url = 'https://maven.neoforged.net/releases' }
    }
    dependencies {
        classpath "org.moddingx:PackDev:${packdev_version}"
        classpath "net.neoforged.gradle:userdev:${neogradle_version}"
    }
}

apply plugin: 'org.moddingx.packdev'

version = '1'

modpack {
    loader '20.4.79-beta'
    targets {
        server()
    }
}
```

`modlist.json`

```json
{
  "api": 2,
  "platform": "modrinth",
  "loader": "neoforge",
  "minecraft": "1.20.4",
  "installed": [],
  "dependencies": []
}
```
