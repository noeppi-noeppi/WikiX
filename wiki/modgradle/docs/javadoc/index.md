# The javadoc plugin

The javadoc plugin (`org.moddingx.modgradle.javadoc`) requires `java-library` and enhances the javadoc generation in your project.

## JavaDocletMeta

Without any further configuration, the javadoc plugin will run [JavaDocletMeta](https://github.com/ModdingX/JavaDocletMeta) on your code and produce javadoc in a machine readable json format in th `meta` directory under you doc base.

## Configure the included packages

The `javadocConfigure` task allows you to configure, which packages to include in the javadoc. It can be configured via the following methods:

  * `from(Object)`: Add the given files to the javadoc sources.
  * `exclude(String)`: Exclude a package pattern from the javadoc.
  * `include(String)`: Include a package pattern from the javadoc.

The patterns for `exclude` and `include` should be package names where each component can also have one of these special values:

  * `*`: Matches exactly one wildcard component.
  * `**`: Matches at least one wildcard component.
  * `*?`: Matches any number of wildcard components.

The table below shows some examples on when a wildcard matches:

| | `some.pkg` | `some.pkg.*` | `some.pkg.**` | `some.pkg.*?` |
| --- | :---: | :---: | :---: | :---: |
| `some.pkg` | matches | does not match | does not match | matches |
| `some.pkg.a` | does not match | matches | matches | matches |
| `some.pkg.a.b` | does not match | does not match | matches | matches |

A package is excluded from the javadoc exactly when it is matched by the exclude rules **and** not matched by the include rules.

## Linking to remote javadoc

The `javadocLinks` task allows to load external javadoc sources, the generated javadoc should link to. It can be configured via the following methods:

  * `config(URI)`: Sets the URI from where to obtain the javadoc links config.
  * `namespace(String)`: Adds the given namespace to the list of included namespaces.

If no config is set, the javadoc plugin will check, whether the `meta`-plugin is applied as well.
If this is the case the javadoc links will be auto-configured based on the values set in the `meta`-plugin, loading links from [here](https://assets.moddingx.org/javadoc_links/).
If the `meta`-plugin is not applied and no config URI is set, no external linking will take place.

### Format of javadoc link config

The javadoc link config must be a json file in UTF-8 encoding.
It mus contain a json object at the root level.
Each key in this object defines a *namespace* of links to include.
The value of each namespace must be a list of *javadoc link resources*.

A javadoc link resource then has one of two forms:
* `{"url":"<uri>"}`: A simple linkage to a remote URI.
* `{"url":"<url>","res":"<uri>"}`: A linkage, where the javadoc is built on demand and therefore can't be used for linking at javadoc build time. `res` instead contains a URI pointing to a jar-file with the built javadoc of the artifact. ModGradle will use th contents of the `res` file to generate links pointing to `url`.

