# ModInit

ModInit is the annotation processor added by LibX.
It will create a new class in the same package as your mod class with the name of your mod class and a `$` added.

Different annotations in source code will add content into that class.
If you have multiple mods in one project, you need to use `@ForMod` to tell ModInit which mod to use.

## Loading models

Add `@Model` to a field of type `BakedModel` to load a model into that field.

## Registering Configs

Using `@RegisterConfig` and `@RegisterMapper` you can register configs and mappers for the LibX config system.

## Advanced ModInit Features

  * [Codec Generation](codecs.md)
  

