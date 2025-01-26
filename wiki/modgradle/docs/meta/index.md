# The meta plugin

The meta plugin is meant to easily set up a mod development environment with minimal clutter in the gradle buildscripts.
The plugin adds a `mod`-extension to the project which allows you to configure almost the complete build setup with a single call to `mod.configure`.
Note that the meta plugin is not meant to cover every use case and possibility in which you want a development environment to be set up but is meant to cover the needs for most simple mods only.

After running `mod.configure`, the `mod` extension holds some useful [properties](./properties.md) that should be useful in customizing the build even further.

## Configuring the build

`mod.configure` accepts a closure with a lot of options and methods to be called on.
These are documented under [build setup](./setup.md).
A simple example could look like this:
```groovy
mod.configure {
    modid 'examplemod'
    neoforge '21.1.65'
    license 'MIT'
    github 'ExampleModGuy/ExampleMod'
    publishing {
        maven { url 'https://maven.examplemodguy.org/'  }
    }
    artifacts {
        sources {
            publishToRepositories()
        }
    }
}
```

The [mod configuration page](./setup.md) lists all available options in the `mod.configure` block.
