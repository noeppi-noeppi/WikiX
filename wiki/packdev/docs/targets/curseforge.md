# The CurseForge target

The CurseForge target builds a modpack zip for upload on [CurseForge](https://www.curseforge.com/minecraft/modpacks).
CurseForge modpacks need to contain a CurseForge project id, which is set during [build configuration](../modpack/configuration.md).

???+ info "Cross-platform building"
     It is possible to build a CurseForge pack even if the [modlist](../modpack/modlist.md) uses Modrinth as a platform.
     PackDev will match all mods to their CurseForge projects using *fingerprints*.
     If, however, there are mods in the modpack, that are not hosted on CurseForge the build will fail.

## Automatic publishing

You can publish the built CurseForge modpack automatically using [CurseForgeGradle](https://github.com/Darkhax/CurseForgeGradle).
A basic upload task could look like this:

```groovy
task publishCurseForge(type: net.darkhax.curseforgegradle.TaskPublishCurseForge) {
    apiToken = findProperty('curseforge_token')
    projectId = 12345
    def mainFile = upload(projectId, buildCursePack)
}
```

For more inforation, see <https://github.com/Darkhax/CurseForgeGradle>.
