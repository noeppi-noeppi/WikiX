# ModInit Codecs

ModInit can be used to generate simple codecs for classes.

To generate a codec for a class, add `@PrimaryConstructor` to one of its constructors.
The constructor parameters will form the codec parameters.
By adding different annotations to the constructor parameters, you can customise what kind a parameter is and configure it more precisely.
See the javadocs of `@PrimaryConstructor` for more information.

For each parameter, there must either be a public field with the same name, a getter with the same name or a getter in beans style.
These are used to get the values when writing in a codec.

To get the generated codec, use `Codecs.get(Class<?>,Class<?>)` with your mods class and the class, the codec was generated for.

Parameters can be of any type that fulfills one of the following criteria by default:
  * DataFixerUpper provides a builtin Codec for that type
  * The class of the parameter has a `public` `static` `final` field named `CODEC` or `DIRECT_CODEC` for that type.

Other types can be supported by other annotations.
