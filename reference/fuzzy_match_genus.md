# Fuzzy Match Genus Name Against Peru Mammals Database

Performs fuzzy matching of genus names against the peru_mammals database
using string distance (Levenshtein) to account for slight spelling
variations. Maximum distance is set to 1 character difference.

This implementation uses a two-step approach to avoid warnings when no
matches are found:

1.  Perform stringdist_left_join to get all candidates

2.  Split into valid (finite distance) and invalid (NA distance)

3.  Process only valid matches to find best candidates

## Usage

``` r
fuzzy_match_genus(df, target_df = NULL)
```

## Arguments

- df:

  A data frame containing the genus names to be matched. Must include
  column: Orig.Genus

- target_df:

  A data frame representing peru_mammals database. Must include column:
  genus

## Value

A tibble with two additional columns:

- `fuzzy_match_genus`: Logical indicating if genus was matched

- `fuzzy_genus_dist`: Numeric distance for each match (lower = better)

- `Matched.Genus`: The matched genus name

## Details

If multiple genera match with the same string distance (ambiguous
matches), a warning is issued and the first match is automatically
selected. To examine ambiguous matches, use
`get_ambiguous_matches(result, type = "genus")`.

Ambiguous match information is stored as an attribute and includes:

- Original genus

- All matched genera with tied distances

- Family information from peru_mammals

- Number of species per genus

## Examples

``` r
if (FALSE) { # \dontrun{
# Process names
names <- c("Pumma", "Tremarctos", "Felis")  # Note: "Pumma" is typo
processed <- .transform_split_classify(.splist_classify(names))

# Fuzzy match
data(peru_mammals)
result <- fuzzy_match_genus(processed, peru_mammals)

# Check results
result |> filter(fuzzy_match_genus)

# Check ambiguous matches
get_ambiguous_matches(result, type = "genus")
} # }
```
