# Check for binomial names in species list

Internal function to verify that species names are at the binomial level
(genus + species) and identify any names at genus level or NA values.
Peru mammals database only contains binomial names (including "sp."
cases).

## Usage

``` r
.check_binomial(splist_class, splist)
```

## Arguments

- splist_class:

  Classified species matrix from .splist_classify

- splist:

  Original species list (character vector)

## Value

Integer vector with positions of problematic names
