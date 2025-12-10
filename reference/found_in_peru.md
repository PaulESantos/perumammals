# Quick check: Is species found in Peru?

Simplified boolean check for species presence in Peru mammals database.
Useful for filtering and logical operations.

## Usage

``` r
found_in_peru(splist, exact_only = FALSE)
```

## Arguments

- splist:

  Character vector of species names

- exact_only:

  Logical. If TRUE, only exact matches return TRUE (default: FALSE)

## Value

Logical vector (TRUE = found, FALSE = not found)

## Examples

``` r
species <- c("Panthera onca", "Tremarctos orrnatus",
             "Tremarctos orrnatos", "Felis catus")

# Check presence (includes fuzzy matches)
found_in_peru(species)
#> [1]  TRUE  TRUE  TRUE FALSE

tibble::tibble(splist = species) |>
 dplyr::mutate(endemic = found_in_peru(splist))
#> # A tibble: 4 × 2
#>   splist              endemic
#>   <chr>               <lgl>  
#> 1 Panthera onca       TRUE   
#> 2 Tremarctos orrnatus TRUE   
#> 3 Tremarctos orrnatos TRUE   
#> 4 Felis catus         FALSE  

```
