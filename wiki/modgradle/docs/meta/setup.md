# Mod configuration

Here follows an overview over all available options inside `mod.configure` that can be used to configure the build.

## modid

This sets the mod id of the mod.
It is a required property.
Example:
```groovy
modid 'examplemod'
```

## neoforge

Sets the version of NeoForge used to compile the mod.
It is a required property.
Example:
```groovy
minecraft '21.1.66'
```

## minecraft

Sets the minecraft version used to build the mod.
ModGradle will try to automatically detect the minecraft version from the NeoForge version.
This function exists mainly as a fallback to be used when ModGradle fails with that.
Example:
```groovy
minecraft '1.21.1'
```

## java

Sets the java version, the build targets.
ModGradle can automatically detect the java version from the minecraft version.
This function exists for the case that a mod needs to target a different java version than the minecraft version it is made for for some reason.
```groovy
java 21
```

## license

Sets the name of the project license.
It is a required property.
Example:
```groovy
license 'MIT'
```

## group

The `group` property just sets the project group.
If not explicitly set, the previous value of the project group will be used.
Example:
```groovy
group 'example.somegroup'
```

## version

Using `version` is an alias for [constant versioning](#constant).
It sets the project version to the provided value.
Example:
```groovy
version '1.0.0'
```

## versioning

ModGradle can infer the project version using different strategies.
The used strategy can be configured in the versioning block.
Example:
```groovy
versioning {
    base '0-DEVELOPMENT'
    gitTag()
}
```
The options available in the `versioning` block are documented below:

### constant

Sets the project version to a constant version.
Example:
```groovy
versioning {
    constant '1.0.0'
}
```

### base

This property sets the *base version*.
Depending on the used strategy, its meaning can be different.
See below.

### maven

Allows to infer the next free version number from a maven repository.
For example
```groovy
versioning {
    base '1.2'
    maven 'https://maven.examplemodguy.org/'
}
```
In this example, ModGradle looks at all versions of the mod published in the provided maven repository, find the largest number `x` such that `1.2.x` is a published version and sets the project version to `1.2.y` where `y` is `x` + 1.

### gitTag

Allows to set the project version from a git tag.
Calling `gitTag()` will look at the git tag pointing to the current `HEAD`.
If there is one, it will be picked as the version number.
Otherwise, the base version is used as a fallback.

## modSources

## git

The `git` block allows to set some information on where the mods source code and issue tracker can be found.
Example:
```groovy
git {
    github 'ExampleModGuy/ExampleMod'
}
```
The options available in the `git` block are documented below:

### url, clone, issues

These properties set the browsable URL, the URI to clone the repository and the URL pointing to the issue tracker respectively.
Example:
```groovy
git {
    url 'https://github.com/ExampleModGuy/ExampleMod'
    clone 'https://github.com/ExampleModGuy/ExampleMod.git'
    issues 'https://github.com/ExampleModGuy/ExampleMod/issues'
}
```

### commitFormat

This sets a format string used in `git log` to format a target link for git commits in generated changelogs.
It can use regular `git log` format substitutions.
Example:
```groovy
git {
    commitFormat 'https://github.com/ExampleModGuy/ExampleMod/commit/%H'
}
```

### github, gitlab

Shorthand commands to fill the git properties with values suited for a specific service.
In both cases, the format is `username/repository`.
Example:
```groovy
git {
    github 'ExampleModGuy/ExampleMod'
    gitlab 'ExampleModGuy/ExampleMod'
}
```
These functions also exist as top-level function and don't need to be embedded in a `git` block.

## mappings

The `mappings` block allows to configure the mappings used in the build.
By default, the build will use the latest parchment version that is available.
Example:
```groovy
mappings {
    official()
}
```
The options available in the `git` block are documented below:

### official

Tells ModGradle to use the official mappings provided by Mojang without any parchment.

### parchment

Another block that can be used to configure the parchment version.
Example:
```groovy
mappings {
    parchment {
        minecraft '1.21'
        version '2024.07.28'
    }
}
```

## changelog

Can be used to change the code used to generate the changelog on mod publish.
By default, ModGradle uses `git log` to generate its changelog and tries to detect the commit range from the current environment.
This behaviour can be overridden by supplying a `Closure` that yields a string with the changelog.
Example:
```groovy
changelog { "This is some dummy changelog text that" }
```

## artifacts

The `artifacts` block allows to configure additional artifacts.
There are currently two additional artifacts that can be built: `sources` and `javadoc`.
Each artifact can also be configured to be published to maven and/or uploaded to mod hosting websites.
Example:
```groovy
artifacts {
    sources {
        publishToRepositories()
        uploadToModHostingSites()
    }
    javadoc {}
}
```
In this example, both sources and javadoc jar-files will be created during the build process.
However, only the sources will get published to maven and uploaded to mod hosting websites.

## resources

The `resources` block allows to specify in which files parameter expansion should take place.
By default, parameters are expanded in `META-INF/neoforge.mods.toml`.
Additional patterns can be added using `expandIn` and existing patterns can be removed using `noExpand`.
Example:
```groovy
resources {
    noExpand()
    expandIn 'pack.mcmeta'
}
```
Expansion always adds the `mod` extension itself as a parameter, so all [mod properties](./properties.md) can be accessed.

## runs

This allows configuration of the runs.
By default ModGradle uses a suitable default configuration for runs.
If this is not desired, it can be turned off using `noAutoConfig()`.
To configure the runs, there are methods `all`, `client`, `server`, `data` and `gameTestServer` where the first one configures all runs and the others just configure their respective run.
The closures passed to these functions are directly passed to NeoGradle.

## publishing

The `publishing` block configures repositories to publish to in the `publish` task.
The provided closure is used to configure a gradle repository handler, so the usual repository handler methods can be used.

## upload

The `upload` block configures upload to mod hosting sites.
Currently, ModGradle supports upload to CurseForge using [CurseForgeGradle](https://github.com/Darkhax/CurseForgeGradle) and Modrinth using [Minotaur](https://github.com/modrinth/minotaur).
Each mod hosting site is configured in its own sub-block.
It is also possible to use an `all` block to configure all uploads at once.
Example:
```groovy
upload {
    all {
        type 'release'
        require 'a-cool-dependency'
    }
    curseforge {
        projectId 12345
        dontInferDefaultVersions()
        version '1.20.1'
    }
    modrinth {
        projectId 'abcde'
    }
}
```
ModGradle provides an `upload` task to perform the uploads.
The following options are available:

### projectId

Sets the project id on the mod hosting website. 

### type

Sets the release type of the upload.
One of `alpha`, `beta` or `release`.
Defaults to `alpha`.

### dontInferDefaultVersions

Stop ModGradle from inferring default supported minecraft or java versions.

### version, require, optional

Adds a supported minecraft version, an optional or required dependency.

### secretEnv

Sets the name of the environment variable that contains the token used for the upload.
This defaults to `CURSEFORGE_UPLOAD_TOKEN` or `MODRINTH_UPLOAD_TOKEN`.

### cfgradle, minotaur

These options allow to pass code directly to CurseForgeGradle or Minotaur.
