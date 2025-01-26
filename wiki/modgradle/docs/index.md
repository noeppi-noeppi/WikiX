# ModGradle wiki

ModGradle is a collection of gradle plugins for NeoForge mod development.

## Use ModGradle

`settings.gradle`:
```groovy
pluginManagement {
    repositories {
        gradlePluginPortal()
        maven { url = 'https://maven.neoforged.net/releases' }
        maven { url = 'https://maven.moddingx.org/release' }
    }
}
```

`build.gradle`:
```groovy
plugins {
    id 'org.moddingx.modgradle.meta' version '<version>'
}
```

## Plugins

ModGradle contains multiple separate plugins which provide its functionality:

  * [`org.moddingx.modgradle.meta`](meta/index.md): This plugin helps to easily configure a NeoForge userdev environment.
  * [`org.moddingx.modgradle.javadoc`](javadoc/index.md): This plugin gives some more configuration options to javadoc generation.
