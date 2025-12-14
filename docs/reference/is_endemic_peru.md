# Check if species are endemic to Peru

Simplified wrapper specifically for checking endemism status of mammals
in Peru. Only evaluates species that are confirmed to occur in Peru.

## Usage

``` r
is_endemic_peru(splist, return_logical = FALSE, filter_exact = FALSE)
```

## Arguments

- splist:

  Character vector of species names

- return_logical:

  Logical. If TRUE, returns logical vector (TRUE/FALSE/NA). If FALSE,
  returns descriptive character vector (default: FALSE)

- filter_exact:

  Logical. If TRUE, only considers exact matches (default: FALSE)

## Value

If return_logical = FALSE: Character vector with endemism status If
return_logical = TRUE: Logical vector (TRUE = endemic, FALSE = not
endemic, NA = not found or endemism unknown)

## Examples

``` r
species <- c("Panthera onca",
             "Atelocynus microtis",
             "Felis catus",
             "Myotis bakeri")

is_endemic_peru(species)
#> [1] "Not endemic"     "Not endemic"     "Not found"       "Endemic to Peru"
# Descriptive output
tibble::tibble(splist = species) |>
  dplyr::mutate(endemic = is_endemic_peru(splist))
#> # A tibble: 4 × 2
#>   splist              endemic        
#>   <chr>               <chr>          
#> 1 Panthera onca       Not endemic    
#> 2 Atelocynus microtis Not endemic    
#> 3 Felis catus         Not found      
#> 4 Myotis bakeri       Endemic to Peru
```
