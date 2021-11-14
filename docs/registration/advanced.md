# Advanced LibX Registration features

In the method `initRegistration` that you override in your mod class, you can add registry conditions and registry transformers.

### Registry Conditions

Registry conditions can filter out objects from the LibX registration system when they are registered.
All registry conditions must return `true` for an object to be registered.
Registry conditions are also applied again to the additional elements registered from `Registerable`.

### Registry Transformers

Registry transformers can add additional `Registerables` for registered objects.
This allows to register anything through LibX even if you can't make it implement `Registerable`.

There also is a special kind of registry transformers which are registry replacers. These can replace the original object that is registered and are applied before other transformers. However, only LibX builtin transformers can be replacers.

### The registration version

The registration version you set in `initRegistration` defines what builtin registry transformers and conditions should be applied. See the javadocs on what this currently includes.
Setting the version to `0` won't apply any builtin transformers or conditions.
