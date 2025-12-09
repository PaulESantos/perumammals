# Filter mammal species from the Peruvian backbone

Convenience wrapper around `peru_mammals` to subset species by taxonomic
group, endemism and/or ecoregion.

## Usage

``` r
pm_species(
  order = NULL,
  family = NULL,
  genus = NULL,
  endemic = NULL,
  ecoregion = NULL
)
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

- endemic:

  Optional logical. If `TRUE`, only endemic species are returned; if
  `FALSE`, only non-endemic species are returned; if `NULL` (default),
  no filter is applied by endemism.

- ecoregion:

  Optional character vector with one or more ecoregion codes (e.g.
  `"YUN"`, `"SB"`, `"COS"`). If supplied, only species occurring in at
  least one of the given ecoregions are returned.

## Value

A tibble with a subset of rows from `peru_mammals`.

## Examples

``` r
if (FALSE) { # \dontrun{
# All species
pm_species()

# Only Rodentia
pm_species(order = "Rodentia")

# Endemic bats (Chiroptera)
pm_species(order = "Chiroptera", endemic = TRUE)

# Species present in Yungas (YUN) and Selva Baja (SB)
pm_species(ecoregion = c("YUN", "SB"))
} # }
```
