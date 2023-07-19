# The Modrinth target

The Modrinth target builds a modpack archive for upload on [Modrinth](https://modrinth.com/modpacks).
Modrinth packs contain both client and server data and are upported by a variety of pack installers.

???+ info "Cross-platform building"
     It is possible to build a Modrinth pack even if the [modlist](../modpack/modlist.md) uses CurseForge as a platform.
     PackDev will match all mods to their Modrinth projects using *hashes*.
     If, however, there are mods in the modpack, that are not hosted on Modrinth the build will fail.

## Automatic publishing

You can publish the built Modrinth pack automatically using [Minotaur](https://github.com/modrinth/minotaur).
A basic upload task could look like this:

```groovy
modrinth {
    token = System.getenv("MODRINTH_TOKEN")
    projectId = "my-project"
    uploadFile = buildModrinthPack
}
```

For more inforation, see <https://github.com/modrinth/minotaur>.
