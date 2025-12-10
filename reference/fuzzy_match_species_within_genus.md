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

## Examples

``` r
if (FALSE) { # \dontrun{
# Process names with typo
names <- c("Puma concolr", "Tremarctos ornatu")  # Note typos
processed <- .transform_split_classify(.splist_classify(names))

# First: direct match
dm_result <- direct_match(processed, peru_mammals)

# Then: genus match for unmatched
no_matched <- dm_result |> filter(!direct_match)
gm_result <- genus_match(no_matched, peru_mammals)

# Finally: fuzzy match species within matched genus
genus_matched <- gm_result |> filter(genus_match)
fm_result <- fuzzy_match_species_within_genus(genus_matched, peru_mammals)
} # }
```
