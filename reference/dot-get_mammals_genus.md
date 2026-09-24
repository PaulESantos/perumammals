# Get mammals species by genus from peru_mammals

Internal function to filter species by genus from peru_mammals data
frame. This function is memoised for performance.

## Usage

``` r
.get_mammals_genus(genus_sub, target_df = NULL)
```

## Arguments

- genus_sub:

  Character vector of genus names (case-insensitive)

- target_df:

  Data frame (peru_mammals) with genus and species columns

## Value

Data frame filtered by genus
