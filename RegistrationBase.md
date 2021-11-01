# Registration base classes

This briefly lists base classes for the [LibX registration system](./Registration).

### EnumObjects

`EnumObjects` registers multiple objects based on an enum. This uses the `getNamedAdditionalRegisters` method in `Registerable` where the map key is the enum values name in lowercase.

### ItemBase

`ItemBase` sets the creative tab of an item to the mods tab if available.

### BlockBase

`BlockBase` will register an item together with the block.

### FluidBase

`FluidBase` will register a still and a flowing fluid, a fluid block and a bucket item.

### BlockBE

`BlockBE` will register a block, an item and a block entity type. It also registers a tile entity ticker and a game event listener if the tile entity class implements some interfaces. For more information see the javadoc.

### BlockMenu

`BlockMenu` will register everything `BlockBE` does and also a menu type. It also provides the logic to open the menu when the block is right-clicked.

### DecoratedBlock

`DecoratedBlock` will register some decoration blocks together with a block. This system can be extended and LibX provides a few builtin types already. For more information see the javadoc.