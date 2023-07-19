# Modlist

The mod list is loaded from a file named `modlist.json`.
Despite the mod list, this file also contains the following information:

  * The modding platform that acts as source to obtain the mods. (Either CurseForge or Modrinth).
  * The minecraft version of the modpack.
  * The mod loader used in the modpack.

Also it stores which mods have been manually installed and which mods were installed only as dependency.
This information does not matter for PackDev but does for editors when computing the dependencies.

???+ tip
     It is strongly advised to use the [Moonstone](https://github.com/ModdingX/Moonstone) IntelliJ plugin to edit the modlist.
     This way, dependencies will be automatically computed and mods can be updated with one click.
     Instruction on how to install Moonstone can be found at <https://moddingx.org/jetbrains>.

## JSON format

The contents of the `modlist.json` file should be a json object with the following format:

  * `platform`: A string that indicates the modding platform. Currently, supported values are `curseforge` and `modrinth`.
  * `loader`: A string describing the mod loader for the modpack.
  * `minecraft`: The minecraft version that the modpack uses.
  * `installed`: A list of *mod files* that are explicitly installed.
  * `dependencies`: A list of *mod files* that are installed only as dependencies for other files.

A *mod file* describes a json object with the following format:

  * `project`: The project id
  * `file`: The file id
  * `side`: Where that mod is required. Either `common`, `client` or `server`
  * `locked`: Whether this dependency is locked, so it can't be updated.
