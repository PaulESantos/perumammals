# Fuzzy Match Species within Genus in Peru Mammals Database

Performs fuzzy matching of species names within a matched genus using
string distance to account for spelling variations. Peru mammals
database does not include infraspecific taxa.

## Usage

``` r
fuzzy_match_species_within_genus(df, target_df = NULL)
```

## Arguments

- df:

  A data frame containing species data to be matched. Must include
  columns: Orig.Species, Matched.Genus

- target_df:

  A data frame representing peru_mammals database. Must include columns:
  genus, species

## Value

A tibble with additional columns:

- `fuzzy_match_species_within_genus`: Logical indicating match success

- `fuzzy_species_dist`: Numeric distance for each match

- `Matched.Species`: The matched species name

## Details

This function processes each matched genus separately for efficiency. If
multiple species match with the same distance, a warning is issued and
the first match is selected. Use
`get_ambiguous_matches(result, type = "species")` to examine ambiguous
cases.

Special handling for "sp." cases:

- "Akodon sp. Ancash" is treated as a complete specific epithet

- Fuzzy matching will work on the entire "SP. ANCASH" string
