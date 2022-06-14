# The LibX Registration System

LibX provides a system to register objects into forge and vanilla registries, that is meant to circumvent some of the flaws, the `RegistryObject` system has.
The LibX system has several advantages over the one provided by forge, such as:

  * Less code that is more concise.
  * Grouping of objects that belong together but go in different registries.
  * No need for a `.get()` to access a registered object while there is still the possibility to allow registry replacements on your registered objects.

To get started, implement `ModXRegistration` with your mod class.
You'll now need to override the `initRegistration` method, where you can tweak some of the more advanced features of the system.
For more information, see [registry transformers](transformers.md) and [registry tracking](tracking.md).

Next, you need to call `ModXRegistration#addRegistrationHandler` in your mod constructor with a reference to a method that registers items to your mod. Alternatively, you can use [modinit](../modinit/registration.md) for that.

Inside a registration handler, you can register objects using `ModXRegistration#register`.
There is also `ModXRegistration#registerMulti` which can register multiple objects to the same registry at once.
See [here](#the-multiregisterable-interface) for more information.
Also there is `ModXRegistration#createHolder` which will not only register your item but also create a holder for it that is updated with the registry.

### The Registerable interface

To really make use of the LibX registration system, you can implement the `Registerable` interface on every object that is registered to the system to further customise, how it's registered.
`Registerable` provides the following methods:

  * `registerCommon`: Called during `FMLCommonSetupEvent`.
    Gets a context with the id and target registry for the object and a way to enqueue tasks.
  * `registerClient`: Like `registerCommon` but for `FMLClientSetupEvent`.
  * `registerAdditional`: This gets an `EntryCollector` which can be used to register additional objects together with this one.
    This can for example be used to register an `Item` together with a `Block` or a `BlockEntityType` together with a `MenuType`.
    For an example, see `BlockBase`.
  * `initTracking`: Initialises nested [registry tracking](tracking.md).

Using these methods, a single object can register a bunch of other things with it.
This works for anything, so a single `Block` could register slabs, stairs, doors, trapdoors, ... by just passing one object to the system.

### The MultiRegisterable interface

Sometimes it might be desirable to register a whole lot of items to the same registry, where the registry is not known before.
Consider a block that should be available in all 16 dye colours.
Having a single object that can be registered that then creates 16 `Block` instances from a factory method would reduce the code quite much.
LibX actually has a builtin class for this: `EnumObjects`.

`MultiRegisterable` exists to solve this problem.
It is structured very similar to noraml [registerable](#the-registerable-interface), however its `registerAdditional` method can register objects without explicitly giving a registry.
Instead they will inherit the registry from the `MultiRegisterable` object.
A `MultiRegisterable` object is registered with `ModXRegistration#registerMulti` instead of `ModXRegistration#register`.
