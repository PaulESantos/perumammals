# Get taxonomic and common name information for Peru mammals

Returns taxonomic classification and common names for species validated
against the Peru mammals database.

## Usage

``` r
get_common_names_peru(splist, return_details = FALSE)
```

## Arguments

- splist:

  Character vector of species names

- return_details:

  Logical. If TRUE, includes full taxonomic information (default: FALSE)

## Value

If return_details = FALSE: Character vector with common names If
return_details = TRUE: Tibble with taxonomic and common name information

## Examples

``` r
species <- c("Panthera onca", "Tremarctos ornatus",
             "Puma concolor", "Myotis bakeri")

# Get common names
# Vector
get_common_names_peru(species)
#> [1] "Jaguar, otorongo, uturuncu"      "Oso de anteojos, ucumari, ucucu"
#> [3] "Puma, león, lluichu-puma"        "Murcielaguito de Baker"         
# tibble
tibble::tibble(splist = species) |>
 dplyr::mutate(endemic = get_common_names_peru(splist))
#> # A tibble: 4 × 2
#>   splist             endemic                        
#>   <chr>              <chr>                          
#> 1 Panthera onca      Jaguar, otorongo, uturuncu     
#> 2 Tremarctos ornatus Oso de anteojos, ucumari, ucucu
#> 3 Puma concolor      Puma, león, lluichu-puma       
#> 4 Myotis bakeri      Murcielaguito de Baker         

# Get full taxonomic information
taxonomy <- get_common_names_peru(species, return_details = TRUE)
taxonomy
#>            Orig.Name       Matched.Name                     common_name
#> 1      Panthera onca      Panthera onca      Jaguar, otorongo, uturuncu
#> 2 Tremarctos ornatus Tremarctos ornatus Oso de anteojos, ucumari, ucucu
#> 3      Puma concolor      Puma concolor        Puma, león, lluichu-puma
#> 4      Myotis bakeri      Myotis bakeri          Murcielaguito de Baker
#>             family      order endemic Match.Quality
#> 1          Felidae  Carnivora   FALSE         Exact
#> 2          Ursidae  Carnivora   FALSE         Exact
#> 3          Felidae  Carnivora   FALSE         Exact
#> 4 Vespertilionidae Chiroptera    TRUE         Exact

```
