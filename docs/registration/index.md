# The LibX Registration System

The LibX registration system allows you to easily register stuff into forge registries.
To use it, you need your mod class to extend `ModXRegistration` instead of `ModX`.
Then you need to override the `initRegistration` method:

```java
@Override
protected void initRegistration(RegistrationBuilder builder) {
    builder.setVersion(0);
}
```

That method can be used to add custom registry transformers and conditions and enable builtin transformers. See [Advanced Registration](advanced.md)

You can then set registration handlers in your mods constructor like this:

```java
this.addRegistrationHandler(ModItems::register)
```

This will add the `register()` method in the `ModItems` class as a registration handler.

Instead of registration handlers, you can also use [ModInit](../modinit/registration.md)

When registration loads, the method is called. It should then register objects using `ModXRegistration#register(String, Object)`.
The first parameter is the name of the object to register.
This should not include the `modid:` part, this is added by `ModXRegistration` automatically.

Each object that is registered to the LibX registration system will be registered to a matching Forge Registry if one exists.

### Customising Registration

To register more complex things through the LibX registration system, make them implement the `Registerable` interface.
This allows objects that are registered to run code during `FMLCommonSetupEvent` and `FMLClientSetupEvent`.
It also allows registering additional objects to the one object.
This for example allows registering an item together with a block automatically.

```java
@Override
public Set<Object> getAdditionalRegisters(ResourceLocation id) {
    // Return a set of objects to register with this one
    // They'll use the same registry name.
}

@Override
public Map<String, Object> getNamedAdditionalRegisters(ResourceLocation id) {
    // Return a map of objects to register with this one
    // The registry name of these is created by the registry name
    // of this object + "_" + the key in the map.
}
```
