# List endemic mammal species of Peru

Returns endemic species from the Peruvian mammal backbone, with optional
filters by order, family and/or ecoregion.

## Usage

``` r
pm_endemics(order = NULL, family = NULL, genus = NULL, ecoregion = NULL)
```

## Arguments

- order:

  Optional character vector with one or more taxonomic orders to keep.
  If `NULL` (default), no filter is applied by order.

- family:

  Optional character vector with one or more families to keep. If `NULL`
  (default), no filter is applied by family.

- genus:

  Optional character vector with one or more genera to keep. If `NULL`
  (default), no filter is applied by genus.

- ecoregion:

  Optional character vector with one or more ecoregion codes (e.g.
  `"YUN"`, `"SB"`, `"COS"`). If supplied, only species occurring in at
  least one of the given ecoregions are returned.

## Value

A tibble with endemic species (subset of `peru_mammals`).

## Details

This is a convenience wrapper around
[`pm_species()`](https://paulesantos.github.io/perumammals/reference/pm_species.md)
with `endemic = TRUE`.

## Examples

``` r
if (FALSE) { # \dontrun{
# All endemic species
pm_endemics()

# Endemic rodents
pm_endemics(order = "Rodentia")

# Endemic species in Yungas (YUN)
pm_endemics(ecoregion = "YUN")
} # }
```
