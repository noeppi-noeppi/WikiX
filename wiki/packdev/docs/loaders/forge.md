# Forge modpacks

To use [MinecraftForge](https://files.minecraftforge.net/) as mod-loader, set the `loader` field to `forge`.

Forge modpacks use the *ForgeGradle* plugin, so it has to be present on the classpath.

## Forge Example

`build.gradle:`

```gradle
buildscript {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven { url = 'https://maven.moddingx.org/' }
        maven { url = 'https://maven.minecraftforge.net' }
    }
    dependencies {
        classpath "org.moddingx:PackDev:${packdev_version}"
        classpath "net.minecraftforge.gradle:ForgeGradle:${forgegradle_version}"
    }
}

apply plugin: 'org.moddingx.packdev'

version = '1'

modpack {
    loader '45.1.16'
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
  "loader": "forge",
  "minecraft": "1.19.2",
  "installed": [],
  "dependencies": []
}
```
