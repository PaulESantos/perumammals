# Match Species Names Against Peru Mammals Database

Matches given species names against the official list of mammal species
of Peru (Pacheco et al. 2021). Uses a hierarchical matching strategy
that includes direct matching, genus-level matching, and fuzzy matching
to maximize successful matches while maintaining accuracy.

**Peru Mammals Database:**

- 575 mammal species

- Binomial nomenclature only (no infraspecific taxa)

- Includes 6 undescribed species ("sp." cases)

- Fields: genus, species, scientific_name, common_name, family, order,
  endemic

## Usage

``` r
validate_peru_mammals(splist, quiet = TRUE)
```

## Arguments

- splist:

  A character vector containing the species names to be matched. Names
  can be in any format (uppercase, lowercase, with underscores, etc.).
  Duplicate names are preserved in the output.

- quiet:

  Logical, default TRUE. If FALSE, prints informative messages about the
  matching progress.

## Value

A tibble with the following columns:

- sorter:

  Integer. Original position in input vector

- Orig.Name:

  Character. Original input name (standardized)

- Matched.Name:

  Character. Matched name from database or "—"

- Match.Level:

  Character. Quality of match ("Exact rank", "No match", etc.)

- matched:

  Logical. Whether a match was found

- Rank:

  Integer. Input taxonomic rank (1 or 2)

- Matched.Rank:

  Integer. Matched taxonomic rank (1 or 2)

- Comp.Rank:

  Logical. Whether ranks match exactly

- valid_rank:

  Logical. Whether match is valid at correct rank

- Orig.Genus:

  Character. Input genus (uppercase)

- Orig.Species:

  Character. Input species (uppercase)

- Author:

  Character. Taxonomic authority if provided

- Matched.Genus:

  Character. Matched genus (uppercase)

- Matched.Species:

  Character. Matched species (uppercase)

- genus_dist:

  Integer. Edit distance for genus (0=exact, \>0=fuzzy, NA=no match)

- species_dist:

  Integer. Edit distance for species (0=exact, \>0=fuzzy, NA=no match or
  genus-only)

- scientific_name:

  Character. Scientific name from peru_mammals

- common_name:

  Character. Common name in Spanish

- family:

  Character. Family

- order:

  Character. Order

- endemic:

  Logical. Endemic to Peru?

**Attributes:** The output includes metadata accessible via
[`attr()`](https://rdrr.io/r/base/attr.html):

- `target_database`: "peru_mammals"

- `matching_date`: Date of matching

- `n_input`: Number of input names

- `n_matched`: Number of successful matches

- `match_rate`: Percentage of successful matches

- `n_fuzzy_genus`: Number of fuzzy genus matches

- `n_fuzzy_species`: Number of fuzzy species matches

- `ambiguous_genera`: Ambiguous genus matches (if any)

- `ambiguous_species`: Ambiguous species matches (if any)

## Details

**Matching Strategy:** The function implements a hierarchical matching
pipeline:

1.  **Node 1 - Direct Match:** Exact matching of binomial names (genus +
    species)

2.  **Node 2 - Genus Match:** Exact matching at genus level

3.  **Node 3 - Fuzzy Genus:** Fuzzy matching for genus with typos (max
    distance = 1)

4.  **Node 4 - Fuzzy Species:** Fuzzy matching for species within
    matched genus

**Special Cases:**

- Handles "sp." cases: "Akodon sp. Ancash", "Oligoryzomys sp. B", etc.

- Case-insensitive matching

- Removes common qualifiers (CF., AFF.)

- Standardizes spacing and formatting

**Rank System:**

- **Rank 1:** Genus level only (e.g., "Panthera")

- **Rank 2:** Binomial (genus + species, e.g., "Panthera onca")

**Ambiguous Matches:** When multiple candidates have identical fuzzy
match scores, a warning is issued and the first match is selected. Use
[`get_ambiguous_matches()`](https://paulesantos.github.io/perumammals/reference/get_ambiguous_matches.md)
to examine these cases.

**Input Requirements:**

Species names must be provided as binomials (Genus species) WITHOUT:

- Author information: Panthera onca Linnaeus"

- Infraspecific taxa: "Panthera onca onca"

- Parenthetical authors: "Panthera onca (Linnaeus, 1758)"

Valid formats:

- Standard binomial: "Panthera onca"

- Undescribed species: "Akodon sp. Ancash"

- Case-insensitive: "PANTHERA ONCA" or "panthera onca"

Names with 3+ elements will be automatically rejected with a warning.

## See also

[`get_ambiguous_matches`](https://paulesantos.github.io/perumammals/reference/get_ambiguous_matches.md)
to retrieve ambiguous match details

## Examples

``` r
# Basic usage
species_list <- c("Panthera onca", "Tremarctos ornatus", "Puma concolor")
results <- validate_peru_mammals(species_list)

# Check results
table(results$matched)
#> 
#> TRUE 
#>    3 
table(results$Match.Level)
#> 
#> Exact rank 
#>          3 

# View matched species
results |>
  dplyr::filter(matched) |>
  dplyr::select(Orig.Name, Matched.Name, common_name, endemic)
#>            Orig.Name       Matched.Name                     common_name endemic
#> 1      Panthera onca      Panthera onca      Jaguar, otorongo, uturuncu   FALSE
#> 2 Tremarctos ornatus Tremarctos ornatus Oso de anteojos, ucumari, ucucu   FALSE
#> 3      Puma concolor      Puma concolor        Puma, león, lluichu-puma   FALSE

# With typos (fuzzy matching)
typos <- c("Pumma concolor", "Tremarctos ornatu")  # Spelling errors
results_fuzzy <- validate_peru_mammals(typos, quiet = FALSE)
#> Loaded peru_mammals database: 573 species
#> Classified 2 input names
#>   Rank 1 (genus): 0
#>   Rank 2 (binomial): 2
#> 
#> Starting hierarchical matching pipeline...
#> Node 2 (Genus match): 1 matches
#> Node 3 (Fuzzy genus): 1 matches
#> Node 4 (Fuzzy species): 2 matches
#> 
#> ── Validating name format ──
#> 
#> ── MATCHING SUMMARY ────────────────────────────────────────────────────────────

# Check for ambiguous matches
get_ambiguous_matches(results_fuzzy, type = "genus")
#> No ambiguous genus matches found.

# Access metadata
attr(results, "match_rate")
#> [1] 100
attr(results, "n_fuzzy_genus")
#> [1] 0

# With special "sp." cases
sp_cases <- c("Akodon sp. Ancash", "Oligoryzomys sp. B")
results_sp <- validate_peru_mammals(sp_cases)
# Should match exactly
```
