# Direct Match Species Names Against Peru Mammals Database

Performs direct matching of species names against the peru_mammals
database. Matches binomial names (genus + species) and handles special
"sp." cases (e.g., "Akodon sp. Ancash"). Peru mammals database does not
include infraspecific taxa.

## Usage

``` r
direct_match(df, target_df = NULL)
```

## Arguments

- df:

  A data frame or tibble containing the species data to be matched. Must
  include columns: Orig.Genus, Orig.Species, Rank

- target_df:

  A data frame representing the peru_mammals database. Must include
  columns: genus, species

## Value

A tibble with an additional logical column `direct_match` indicating
whether the name was successfully matched (`TRUE`) or not (`FALSE`),
plus columns `Matched.Genus` and `Matched.Species` for matched records.

## Details

This function only matches Rank 2 (binomial) names since peru_mammals
does not include infraspecific taxa. It handles:

- Regular binomials: "Panthera onca"

- Special "sp." cases: "Akodon sp. Ancash", "Oligoryzomys sp. B"

Names at Rank 1 (genus only) are not matched by this function; use
[`genus_match()`](https://paulesantos.github.io/perumammals/reference/genus_match.md)
instead.
