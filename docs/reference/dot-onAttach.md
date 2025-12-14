# .onAttach hook

Hook function that runs when the package is attached via
[`library()`](https://rdrr.io/r/base/library.html). It displays the
package version and information about the taxonomic backbone.

## Usage

``` r
.onAttach(libname, pkgname)
```

## Arguments

- libname:

  A character string indicating the path to the library.

- pkgname:

  A character string with the name of the package.
