# List of builtin config key types

This list may change from time to time.
For a complete list, see the javadocs of the ConfigManager class.

This is a list of all types that can be used as a type for a config field:

  * `boolean` / `Boolean`
  * `byte` / `Byte`
  * `short` / `Short`
  * `int` / `Integer`
  * `long` / `Long`
  * `float` / `Float`
  * `double` / `Double`
  * `String`
  * `Optional<T>` if `T` is supported. Empty optionals will get `null` in the json.
  * `List<T>` if `T` is supported.
  * `Map<String, T>` if `T` is supported.
  * `Pair<A, B>` if `A` and `B` are supported.
  * `Triple<A, B, C>` if `A`, `B`  and `C` are supported.
  * Every `enum`
  * Every `record` if the types of all record components are supported.
  * `UUID`
  * `ResourceLocation`
  * `ResourceList`
  * `Ingredient`
  * `IngredientStack`
  * `Component`
