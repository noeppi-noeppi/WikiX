# ModInit

ModInit is the annotation processor added by LibX.
It will create a new class in the same package as your mod class with the name of your mod class and a `$` added.

Different annotations in source code will add content into that class.
If you have multiple mods in one project, you need to use `@ForMod` to tell ModInit which mod to use.

### Loading models

Add `@Model` to a field of type `BakedModel` to load a model into that field.

### Adding data providers

Add `@Datagen` to the class of a data provider to register it for datagen.
The class must declare exactly one constructor that takes any arguments with the following types:
  * `ModX`
  * `DataGenerator`
  * `ExistingFileHelper`

### Registering Configs

Using `@RegisterConfig` and `@RegisterMapper` you can register configs and mappers for the LibX config system.

### Advanced ModInit Features

  * [Registration](registration.md)
  * [Codec Generation](codecs.md)
  

