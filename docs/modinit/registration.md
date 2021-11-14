# ModInit registration

You can use ModInit to register stuff to the [LibX registration system](../registration/index.md).
For this, add `@RegisterClass` to a class.
All `public` `static` `final` fields from that class will be registered to the LibX registration system.
To exclude a field, annotate it with `@NoReg`.

The registry name for a field is retrieved by taking the field name and replacing every uppercase character with an underscore (`_`) and the letter in lowercase. To customise the registry name, annotate a field with `@RegName`.

You can also set priorities and prefixes in `@RegisterClass` to tweak their order and add a prefix to each registry name from a class.