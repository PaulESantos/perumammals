# Helper: Fuzzy Match Species within Genus

Helper function that performs fuzzy matching for a single genus.

This implementation uses a two-step approach to avoid issues with empty
groups when filtering NAs:

1.  Perform stringdist_left_join to get all candidates

2.  Split into matched (finite distance) and unmatched (NA distance)

3.  Process matched candidates to find best matches

4.  Recombine for final output

## Usage

``` r
fuzzy_match_species_within_genus_helper(df, target_df)
```

## Arguments

- df:

  Data frame for a single matched genus

- target_df:

  Peru mammals database

## Value

Data frame with fuzzy match results
