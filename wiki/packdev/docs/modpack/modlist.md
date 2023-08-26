# Modlist

The mod list is loaded from a file named `modlist.json`.
Despite the mod list, this file also contains the following information:

  * The modding platform that acts as source to obtain the mods. (Either CurseForge or Modrinth).
  * The minecraft version of the modpack.
  * The mod loader used in the modpack.

Also it stores which mods have been manually installed and which mods were installed only as dependency.

## Running Moonstone

[Moonstone](https://github.com/ModdingX/Moonstone) is a graphical editor for the `modlist.json` file.
There are two ways to use Moonstone:

  * You can use Moonstone as an IntelliJ plugin to edit the modlist directly from your IDE.
    See <https://moddingx.org/jetbrains> for more information on how to add Moonstone to your IDE.
  * You can also launch Moonstone with the `moonstone` gradle task.
    This will open your modlist as a standalone application.

???+ tip
     If you're running Moonstone through the `moonstone` gradle task and prefer a light theme, add `moonstone.theme=light` to your `gradle.properties` file.

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
