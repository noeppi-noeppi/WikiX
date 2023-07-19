# The LibX config system.

LibX provides a custom config system based on json files.
This will outline the basics of the config system, for more information see the javadoc.

## Creating a config

A config is a java class with some annotations.
Adding config values are meant to be as adding a field to a class.
An example for a config class is shown here:

```java
public class MyConfig {
    
    @Config("A command for a config key")
    public static String someValue = "Hello";
    
    @Config({
            "Multiline comments",
            "work aas well"
    })
    @IntRange(min = 0, max = 20)
    public static int value = 3;
    
    public static class ConfigSubGroup {
        
        @Config
        public static List<List<Integer>> listOfIntLists = List.of(List.of(1));
    }
}
```

Each field annotated ith `@Config` will become a config value and the value set in the config will be put into the field.
The initial value of the field will become the default value.
The fields must be `static` and may not be `final`.
Null values are not allowed in the fields, but in the config json.
For a lis tof supported field types, see [Config Key Types](key_types.md).

To register that config, use one of the `ConfigManager.registerConfig` methods:

  * `ConfigManager.registerConfig(String, Class<?>, boolean)`:
     Register the primary config for your mod.
     The first argument is the modid.
     The last argument is the config type.
     See below.
     The config is stored in `.minecraft/config/modid.json5`.
  * `ConfigManager.registerConfig(ResourceLocation, Class<?>, boolean)`:
     Register a config for your mod.
     The first argument is the id for the config.
     The last argument is the config type.
     See below.
     The config is stored in `.minecraft/config/namespace/path.json5`.

## Config Types

There are two types fo config:

Common configs and client configs.
Common configs are present on both client and server.
They are synced from the server to the client, so you can expect the values set on the server, a client is currently playing on.

Client configs on the other side are only present on the client and won't be synced.

## Reloading configs

Using the command `/libx reload`, configs can be reloaded.

## Extending the config system

You can add custom config mappers to make your config support more types.
You can also add custom validators that can be added to field through an annotation to further validate values.
This however is not described here.
