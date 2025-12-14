# Match Genus Names Against Peru Mammals Database

Performs direct matching of genus names against the unique genera listed
in the peru_mammals database. Useful for Rank 1 (genus-only) names.

## Usage

``` r
genus_match(df, target_df = NULL)
```

## Arguments

- df:

  A data frame or tibble containing the genus names to be matched. Must
  include column: Orig.Genus

- target_df:

  A data frame representing the peru_mammals database. Must include
  column: genus

## Value

A tibble with an additional logical column `genus_match` indicating
whether the genus was successfully matched (`TRUE`) or not (`FALSE`),
plus column `Matched.Genus` for matched records.

## Details

This function is typically used for names submitted at the genus level
(Rank 1). When a genus is matched, all species of that genus in
peru_mammals can be retrieved for further processing (e.g., suggesting
possible species to the user).
