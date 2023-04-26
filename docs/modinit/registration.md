# ModInit Registration

ModInit has a system to register each `public static final` field from a class into a set registry.
If [registry tracking](../registration/tracking.md) is enabled, these fields will also be added as tracking targets for their contained elements.
To get started, apply `@RegisterClass` to your class.
The target registry is set by the `registry` field in `@RegisterClass`. This can be the empty string to register elements without a registry.
(Only really makes sense on `Registerable`s though)
To set a registry, set the field name of a field from either the `ForgeRegistries.Keys` class or the `Registry` class.
The field must be `public static final` and have a type of `ResourceKey<? extends Registry<T>>` where `T` is the type you want to register in that class.

If your registry key is stored in another class, you can use the `registryClass` field in `@RegisterClass`.
This allows to set another class where the registry key is stored.

An example could look like this:

```java
@RegisterClass(registry = "ITEM_REGISTRY")
public class ModItems {
    
    public static final ItemBase rawSteel = new ItemBase(MyMod.getInstance(), new Item.Properties()); // mymod:raw_steel
    public static final Item steel = new Item(new Item.Properties().tab(MyMod.getInstance().tab)); // mymod:steel
    public static final Item chickenFricassee = new Item(new Item.Properties().food(Foods.CHICKEN)); // mymod:chicken_fricassee
}
```

The comment after each line shows the id used to register the item.

### Customizing elements

To further customise, how elements are registered, use the annotations from `@Reg`:

  * `@Reg.Multi` treats the field as [MultiRegisterable](../registration/index.md#the-multiregisterable-interface).
  * `@Reg.Exclude` will exclude a field from registration.
  * `@Reg.Name` allows to set a custom name used for registration.
