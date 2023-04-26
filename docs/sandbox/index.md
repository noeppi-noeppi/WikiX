# SandBox

ModInit is the LibX world generation library.
SandBox add some new datapack content for world generation and most notably a lot of data providers to generate worldgen data using the [LibX datagen system](../datagen/index.md).

### The surface rule set and biome surface registries

A `SurfaceRuleSet` describes, how to dynamically create `SurfaceRules` based on the biomes that generate in a chunk generator.
For each biome, it's possible to register a `BiomeSurface` with the same name and separate the biome specific surface rules from the generator settings.

This makes it considerably easier for other mods to add new biomes to a custom dimension and take the advantage of surface rules.

### The biome layer registry

A `BiomeLayer` specifies a set of biomes and matching climate data that can generate in a `MultiNoise` based biome source.
`BiomeLayers` are designed to make it possible to easily extend a dimension with new biomes without adjusting all the climate target values.

### The template pool extension registry

A `PoolExtension` specifies new elements that should be added to a template pool without replacing the whole pool in a datapack.
This makes it easy to extend structures like villages with custom buildings.

### Layered biome source

A `LayeredBiomeSource` behaves like a `MultiNoiseBiomeSource`, however, it an work with multiple `BiomeLayer`s and sample each layer in its own noise range, so they don't interfere.

### Extended noise chunk generator

A version of a `NoiseBasedChunkGnenerator` that is capable of applying a `SurfaceRuleSet` and matching `BiomeSurface`.
