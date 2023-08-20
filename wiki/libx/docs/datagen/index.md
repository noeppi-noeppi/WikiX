# The LibX Datagen System

LibX provides a system for datagen that can load datapack registries during datagen and allows easy generation of datapack registry content as well as tags for datapack registry content.

The LibX datagen system works in three stages:

  * **registry setup**: In this stage, the datapack registries can be populated with values. Output should not be generated during this stage. At the end of this stage, almost all datapack registries are frozen.
  * **extension setup**: This stage is similar to the *registry setup* stage. However most datapack registries are frozen. This stage is used to populate *extension registries* (see below).
  * **datagen**: At the beginning of this stage, all elements that were newly added to the registries in earlier steps are generated. After that regular data providers run and generate their output.

## Extension registries

Some registries reference elements in other registries by the id used to register them. (For example the biome surface registry from [SandBox](../sandbox/index.md)).
In order to populate these registries, the other datapack registries must be already frozen, hence the existence of the *extension setup* stage.

To mark a registry as an extension registry, use
```java
DatagenSystem.registerExtensionRegistry(REGISTRY_KEY);
```
Note that this is global, so you should only ever use it for registries, you add yourself.

### Pack targets

In some cases it might be desired to generate data not only for a single datapack but for multiple.
For example, one might want to put some data into a [dynamic datapack](https://moddingx.org/libx/org/moddingx/libx/datapack/DynamicPacks.html) and switch it on depending on a config option.

To support this, LibX knows the concept of a `PackTarget`.
A `PackTarget` stores the target location for generated output files and owns a registry set with all elements that are known for this output.
Each output can have multiple parents. If an element is added to the registry set of one of the parents, the child pack target will inherit that element and assume its existence without generating it again.

It is possible to create a vanilla `PackOutput` from a `PackTarget` to use it with non-LibX providers. 

## Using the system

In order to use the system, add the following to your mods constructor:

```java
DatagenSystem.create(this, system -> {
    ...
});
```
Inside the lambda, you can then configure the system, create auxiliary pack targets and add providers to the different stages.
Providers run in the order, they were added and can query providers that have run before when they are created.
