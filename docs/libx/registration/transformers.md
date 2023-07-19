# Registry Conditions and Transformers

Registry conditions and transformers can filter and modify elements before they are passed to the LibX registration system.

## Registry Conditions

Registry Conditions implement the `RegistryCondition` interface.
They have a method called `shouldRegister` that is called with each object that is about to be registered.
Only if all conditions return `true` for an object, it can be registered.
To add a registry condition, use `RegistrationBuilder#condition` in your `initRegistration` method.

The following condition would exclude all `Item`s from registration:

```java
public class ExcludeItems implements RegistryCondition {
    
    public boolean shouldRegister(RegistrationContext ctx, Object value) {
        return ctx.registry().isEmpty() || Registries.ITEM != ctx.registry().get();
    }
}
```

## Registry Transformers

Registry Transformers implement the `RegistryTransformer` interface.
They have a method called `transform` that is called with each object that is about to be registered and passed the registry conditions.
That method gets an `EntryCollector` as argument, which allows to register additional objects together with the original one.
To add a registry transformer, use `RegistrationBuilder#transformer` in your `initRegistration` method.

The following transformer would register a `BlockItem` with every registered block:

```java
public class BlockItems implements RegistryTransformer {
    
    public void transform(RegistrationContext ctx, Object value, Registerable.EntryCollector builder) {
        if (value instanceof Block block) {
            builder.register(Registries.ITEM, new BlockItem(block, new Item.Properties()));
        }
    }
}
```
