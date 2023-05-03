# SandBox datagen

SandBox provides a range of data providers for world generation related objects.
These make use of the [LibX datagen system](../datagen/index.md) to extend the datagen registry set.

All SandBox providers extend the base class `RegistryProviderBase`.
The subclasses of these providers provide ways to create `Holder`s of the elements you want to generate.
These holders are intrusive and must be properly registered afterwards.
`RegistryProviderBase` makes sure, each `public`, non-`static` field in the provider class that has a type of `Holder` and contains an intrusive holder when the provider runs, is added to the registry.

The id of the object is obtained from the field name, however, it's possible to change that id using the `@Id` annotation.

### Example

```java
public class FeatureProvider extends FeatureProviderBase {

    public final Holder<PlacedFeature> bonusChests = this.placement(this.holder(MiscOverworldFeatures.BONUS_CHEST))
            .count(2)
            .rarity(3)
            .heightmap(Heightmap.Types.MOTION_BLOCKING_NO_LEAVES)
            .build();
    
    @Id(namespace = "minecraft", value = "my_cool_feature")
    public final Holder<ConfiguredFeature<?, ?>> fillLayer = this.feature(Feature.FILL_LAYER, new LayerConfiguration(
            3, Blocks.COBWEB.defaultBlockState()
    ));
    
    public FeatureProvider(DatagenContext ctx) {
        super(ctx);
    }
}
```
