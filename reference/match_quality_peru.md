# Get match quality for Peru mammal names

Returns the quality of taxonomic name matching (exact vs fuzzy) for
species validated against the Peru mammals database.

## Usage

``` r
match_quality_peru(splist, return_details = FALSE)
```

## Arguments

- splist:

  Character vector of species names

- return_details:

  Logical. If TRUE, includes distance metrics and matching information
  (default: FALSE)

## Value

If return_details = FALSE: Character vector with match quality If
return_details = TRUE: Tibble with detailed matching information

## Details

Match quality categories:

- "Exact": Perfect match with no spelling differences (genus_dist = 0,
  species_dist = 0)

- "Fuzzy": Match found with minor spelling variations (genus_dist \> 0
  or species_dist \> 0)

- "Not found": No match in database

The function uses string distance metrics to quantify matching quality:

- genus_dist: Edit distance for genus name

- species_dist: Edit distance for species epithet

## Examples

``` r
species <- c(
  "Panthera onca",      # Exact
  "Tremarctos orrnatus", # Fuzzy (spelling error)
  "Felis domesticus",   # Not found
  "Myotis bakeri"
)

# Simple quality check
match_quality_peru(species)
#> [1] "Exact"     "Fuzzy"     "Not found" "Exact"    

# Detailed information with edit distances
details <- match_quality_peru(species, return_details = TRUE)
details
#>             Orig.Name       Matched.Name Match.Quality Match.Level genus_dist
#> 1       Panthera onca      Panthera onca         Exact  Exact rank          0
#> 2 Tremarctos orrnatus Tremarctos ornatus         Fuzzy  Exact rank          0
#> 3    Felis domesticus                ---     Not found    No match         NA
#> 4       Myotis bakeri      Myotis bakeri         Exact  Exact rank          0
#>   species_dist matched                     common_name           family
#> 1            0    TRUE      Jaguar, otorongo, uturuncu          Felidae
#> 2            1    TRUE Oso de anteojos, ucumari, ucucu          Ursidae
#> 3           NA   FALSE                            <NA>             <NA>
#> 4            0    TRUE          Murcielaguito de Baker Vespertilionidae
#>        order
#> 1  Carnivora
#> 2  Carnivora
#> 3       <NA>
#> 4 Chiroptera


```
