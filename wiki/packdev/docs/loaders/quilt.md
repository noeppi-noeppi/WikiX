# Quilt modpacks

To use [Quilt Loader](https://quiltmc.org/) as mod-loader, set the `loader` field to `quilt`.

Quilt modpacks use the *quilt-loom* plugin, so it has to be present on the classpath.

## Quilt Example

`build.gradle:`

```gradle
buildscript {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven { url = 'https://maven.moddingx.org/' }
        maven { url = 'https://maven.minecraftforge.net' }
        maven { url = 'https://maven.fabricmc.net' }
        maven { url = 'https://maven.quiltmc.org/repository/release/' }
    }
    dependencies {
        classpath "org.moddingx:PackDev:${packdev_version}"
        classpath "org.quiltmc:loom:${loom_version}"
    }
}

apply plugin: 'org.moddingx.packdev'

version = '1'

modpack {
    loader '0.19.2'
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
  "loader": "quilt",
  "minecraft": "1.19.2",
  "installed": [],
  "dependencies": []
}
```
