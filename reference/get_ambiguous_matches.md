# Retrieve Ambiguous Match Information for Peru Mammals

Extracts information about ambiguous matches (multiple candidates with
tied distances) from matching results. Useful for quality control and
manual curation. Adapted for peru_mammals (genus and species only).

## Usage

``` r
get_ambiguous_matches(
  match_result,
  type = c("genus", "species", "all"),
  save_to_file = FALSE,
  output_dir = tempdir()
)
```

## Arguments

- match_result:

  A tibble returned by matching functions.

- type:

  Character. Type of ambiguous matches to retrieve:

  - `"genus"` (default): Ambiguous genus-level matches

  - `"species"`: Ambiguous species-level matches

  - `"all"`: Both types

- save_to_file:

  Logical. If TRUE, saves results to CSV. Default is FALSE (CRAN
  compliant).

- output_dir:

  Character. Directory to save file if save_to_file = TRUE. Defaults to
  [`tempdir()`](https://rdrr.io/r/base/tempfile.html).

## Value

A tibble with ambiguous match details, or NULL if none exist. Includes
original names, matched names, distances, and database metadata.

## Details

During fuzzy matching, multiple candidates may have identical string
distances. The matching algorithm automatically selects the first
candidate, but this function allows you to review all alternatives for
quality control.
