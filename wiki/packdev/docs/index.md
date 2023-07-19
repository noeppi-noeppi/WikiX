# PackDev wiki

PackDev is a gradle plugin for creating and building modpacks.
It supports both [CurseForge](https://www.curseforge.com/minecraft) and [Modrinth](https://modrinth.com/) and can build modpacks fo [Forge](https://files.minecraftforge.net), [Fabric](https://fabricmc.net/) and [Quilt](https://quiltmc.org/).

Modpacks are often developed using a third party launcher that then exports the modpack in some format for publishing.
However, tis comes with a lot of disadvantages:

  * Contributing to the modpack via pull requests is hard, especially if the pull request wants to alter the modlist.
  * Often only one modpack format is supported for export.
  * In most cases the export contains unnecessary overrides like configs that have not been changed.
  * Adding differences between a client and a server version is hard.

PackDev tries to solve these issues by using gradle as a build system.
This also has the advantage that you can make use of pre-existing gradle plugins for automatic publishing of modpacks through [CurseForgeGradle](https://github.com/Darkhax/CurseForgeGradle) or [Minotaur](https://github.com/modrinth/minotaur).

## Apply PackDev to your build

```groovy
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
    }
}
```

Depending on which loader your modpack uses, you might need to add additional artifacts to the classpath.
More information can be found on the loader-specific pages.
