# Check if species are Peru mammals

Main wrapper function that validates species names against the Peru
mammals database with various output options for match quality, endemism
status, and detailed information.

## Usage

``` r
is_peru_mammal(
  splist,
  return_details = FALSE,
  match_type = "status",
  filter_exact = FALSE
)
```

## Arguments

- splist:

  Character vector of species names to check

- return_details:

  Logical. If TRUE, returns full validation tibble. If FALSE, returns
  simplified status vector (default: FALSE)

- match_type:

  Character. Type of information to return when return_details = FALSE:

  - "status": Returns "Found" or "Not found" (default)

  - "match_quality": Returns match quality ("Exact", "Fuzzy", or "Not
    found")

  - "endemic": Returns endemism status ("Endemic", "Not endemic", or
    "Not found")

- filter_exact:

  Logical. If TRUE, only returns exact matches (genus_dist = 0 AND
  species_dist = 0). Fuzzy matches are treated as "Not found" (default:
  FALSE)

## Value

If return_details = FALSE: Character vector with requested information.
If return_details = TRUE: Tibble with complete validation information.

## Details

This function wraps
[`validate_peru_mammals()`](https://paulesantos.github.io/perumammals/reference/validate_peru_mammals.md)
to provide flexible output formats for different use cases:

- Basic presence/absence checking

- Match quality assessment (exact vs fuzzy)

- Endemism status queries

The function handles taxonomic matching with fuzzy string matching to
accommodate minor spelling variations while maintaining data quality.

When filter_exact = TRUE, only matches with zero edit distance in both
genus and species names are considered valid matches. All fields related
to fuzzy matches are set to NA or "—" to maintain consistency.

## Examples

``` r
species <- c(
  "Panthera onca",       # Exact match
  "Pantera onca",        # Fuzzy match (genus misspelled)
  "Tremarctos orrnatus", # Fuzzy match (species misspelled)
  "Felis domesticus",     # Not in Peru
  "Myotis bakeri"
)

# Check if species are found (includes fuzzy matches)
is_peru_mammal(species)
#> [1] "Found in Peru" "Found in Peru" "Found in Peru" "Not found"    
#> [5] "Found in Peru"

# Check with exact matches only
is_peru_mammal(species, filter_exact = TRUE)
#> [1] "Found in Peru" "Not found"     "Not found"     "Not found"    
#> [5] "Found in Peru"

# Check match quality
is_peru_mammal(species, match_type = "match_quality")
#> [1] "Exact"     "Fuzzy"     "Fuzzy"     "Not found" "Exact"    

# Check endemism
is_peru_mammal(species, match_type = "endemic")
#> [1] "Not endemic"     "Not endemic"     "Not endemic"     "Not found"      
#> [5] "Endemic to Peru"

# Get detailed information
is_peru_mammal(species, return_details = TRUE)
#>   sorter           Orig.Name       Matched.Name Match.Level matched Rank
#> 1      1       Panthera onca      Panthera onca  Exact rank    TRUE    2
#> 2      2        Pantera onca      Panthera onca  Exact rank    TRUE    2
#> 3      3 Tremarctos orrnatus Tremarctos ornatus  Exact rank    TRUE    2
#> 4      4    Felis domesticus                ---    No match   FALSE    2
#> 5      5       Myotis bakeri      Myotis bakeri  Exact rank    TRUE    2
#>   Matched.Rank Comp.Rank valid_rank Orig.Genus Orig.Species Author
#> 1            2      TRUE       TRUE   PANTHERA         ONCA       
#> 2            2      TRUE       TRUE    PANTERA         ONCA       
#> 3            2      TRUE       TRUE TREMARCTOS     ORRNATUS       
#> 4           NA        NA         NA      FELIS   DOMESTICUS       
#> 5            2      TRUE       TRUE     MYOTIS       BAKERI       
#>   Matched.Genus Matched.Species genus_dist species_dist    scientific_name
#> 1      PANTHERA            ONCA          0            0      Panthera onca
#> 2      PANTHERA            ONCA          1            0      Panthera onca
#> 3    TREMARCTOS         ORNATUS          0            1 Tremarctos ornatus
#> 4          <NA>            <NA>         NA           NA               <NA>
#> 5        MYOTIS          BAKERI          0            0      Myotis bakeri
#>                       common_name           family      order endemic
#> 1      Jaguar, otorongo, uturuncu          Felidae  Carnivora   FALSE
#> 2      Jaguar, otorongo, uturuncu          Felidae  Carnivora   FALSE
#> 3 Oso de anteojos, ucumari, ucucu          Ursidae  Carnivora   FALSE
#> 4                            <NA>             <NA>       <NA>      NA
#> 5          Murcielaguito de Baker Vespertilionidae Chiroptera    TRUE
#>   Match.Quality Presence.Status Endemism.Status
#> 1         Exact   Found in Peru     Not endemic
#> 2         Fuzzy   Found in Peru     Not endemic
#> 3         Fuzzy   Found in Peru     Not endemic
#> 4     Not found       Not found       Not found
#> 5         Exact   Found in Peru Endemic to Peru
#>                                                                                                                     Summary
#> 1                                                    Panthera onca (Jaguar, otorongo, uturuncu): Found in Peru, not endemic
#> 2                  Panthera onca (Jaguar, otorongo, uturuncu): Found in Peru, not endemic [fuzzy match from 'Pantera onca']
#> 3 Tremarctos ornatus (Oso de anteojos, ucumari, ucucu): Found in Peru, not endemic [fuzzy match from 'Tremarctos orrnatus']
#> 4                                                                      Felis domesticus: Not found in Peru mammals database
#> 5                                                                   Myotis bakeri (Murcielaguito de Baker): Endemic to Peru

# Get detailed information with exact matches only
is_peru_mammal(species, return_details = TRUE, filter_exact = TRUE)
#>   sorter           Orig.Name  Matched.Name Match.Level matched Rank
#> 1      1       Panthera onca Panthera onca  Exact rank    TRUE    2
#> 2      2        Pantera onca           ---    No match   FALSE    2
#> 3      3 Tremarctos orrnatus           ---    No match   FALSE    2
#> 4      4    Felis domesticus           ---    No match   FALSE    2
#> 5      5       Myotis bakeri Myotis bakeri  Exact rank    TRUE    2
#>   Matched.Rank Comp.Rank valid_rank Orig.Genus Orig.Species Author
#> 1            2      TRUE       TRUE   PANTHERA         ONCA       
#> 2            2      TRUE       TRUE    PANTERA         ONCA       
#> 3            2      TRUE       TRUE TREMARCTOS     ORRNATUS       
#> 4           NA        NA         NA      FELIS   DOMESTICUS       
#> 5            2      TRUE       TRUE     MYOTIS       BAKERI       
#>   Matched.Genus Matched.Species genus_dist species_dist scientific_name
#> 1      PANTHERA            ONCA          0            0   Panthera onca
#> 2          <NA>            <NA>          1            0            <NA>
#> 3          <NA>            <NA>          0            1            <NA>
#> 4          <NA>            <NA>         NA           NA            <NA>
#> 5        MYOTIS          BAKERI          0            0   Myotis bakeri
#>                  common_name           family      order endemic Match.Quality
#> 1 Jaguar, otorongo, uturuncu          Felidae  Carnivora   FALSE         Exact
#> 2                       <NA>             <NA>       <NA>      NA     Not found
#> 3                       <NA>             <NA>       <NA>      NA     Not found
#> 4                       <NA>             <NA>       <NA>      NA     Not found
#> 5     Murcielaguito de Baker Vespertilionidae Chiroptera    TRUE         Exact
#>   Presence.Status Endemism.Status
#> 1   Found in Peru     Not endemic
#> 2       Not found       Not found
#> 3       Not found       Not found
#> 4       Not found       Not found
#> 5   Found in Peru Endemic to Peru
#>                                                                      Summary
#> 1     Panthera onca (Jaguar, otorongo, uturuncu): Found in Peru, not endemic
#> 2        Pantera onca: Not found in Peru mammals database (exact match only)
#> 3 Tremarctos orrnatus: Not found in Peru mammals database (exact match only)
#> 4    Felis domesticus: Not found in Peru mammals database (exact match only)
#> 5                    Myotis bakeri (Murcielaguito de Baker): Endemic to Peru

```
