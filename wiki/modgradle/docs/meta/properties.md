# Mod properties

After the build has been configured by `mod.configure`, the `mod` extension provides access to some properties useful for further build configuration.

  - `modid` contains the mod is of the mod.
  - `name` is an alias for `project.name`. This is mainly useful for template expansion in the `processResources` step.
  - `group` is an alias for `project.group`. This is mainly useful for template expansion in the `processResources` step.
  - `version` is an alias for `project.version`. This is mainly useful for template expansion in the `processResources` step.
  - `minecraft` contains the Minecraft version used to build the mod.
  - `neoforge` contains the NeoForge version used to build the mod.
  - `java` contains the targeted java version for the build. If not manually set, this is inferred from the Minecraft version.
  - `resource` contains the resource pack version that is current in the Minecraft version used to build the mod.
  - `data` contains the datapack version that is current in the Minecraft version used to build the mod.
  - `license` contains the license of the mod.
  - `timestamp` contains the commit timestamp of the current `HEAD`. This is only available if the project is located inside a git repository.
  - `changelog` contains the generated changelog listing all commits since the last version.
  - `source_url` contains the URL to browsable source code of the mod. This is only available if set in the `git` block during `mod.configure`.
  - `issue_url` contains the URL pointing to the mod issue tracker. This is only available if set in the `git` block during `mod.configure`.

Properties can be accessed using `mod['property_name']` and in template expansion also as `mod.property_name`.
