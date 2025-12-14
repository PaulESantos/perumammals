# List endemic mammal species by taxonomic order

Summarises the diversity of endemic mammal species in Peru, grouped by
taxonomic order. Provides counts of families, genera, and species that
are endemic to Peru within each order. Optionally includes endemism
rates relative to total species richness.

## Usage

``` r
pm_list_endemic(include_rate = FALSE)
```

## Arguments

- include_rate:

  Logical. If `TRUE`, includes additional columns showing total species
  richness and endemism rate for each order. Default is `FALSE`.

## Value

A tibble with one row per order containing endemic species, arranged in
descending order by number of endemic species, with the following
columns:

- order:

  Taxonomic order

- n_families:

  Number of families with endemic species in the order

- n_genera:

  Number of genera with endemic species in the order

- n_endemic:

  Number of endemic species in the order

- n_species:

  (Only if `include_rate = TRUE`) Total number of species in the order

- endemic_rate:

  (Only if `include_rate = TRUE`) Proportion of endemic species (0-1)

- endemic_pct:

  (Only if `include_rate = TRUE`) Percentage of endemic species (0-100)

## Details

This function focuses exclusively on species that are endemic to Peru
(i.e., species found nowhere else in the world). Orders without any
endemic species are not included in the output.

When `include_rate = FALSE` (default), results are sorted by the number
of endemic species in descending order, highlighting which orders have
the highest endemic diversity.

When `include_rate = TRUE`, results are sorted by total species richness
in descending order, and include endemism rates to show what proportion
of each order's diversity is endemic to Peru. A summary row labeled
"Total" is appended to show overall statistics.

## Examples

``` r
# Summary of endemic species by order
pm_list_endemic()
#> # A tibble: 6 × 4
#>   order           n_families n_genera n_endemic
#>   <chr>                <int>    <int>     <int>
#> 1 Rodentia                 7       22        56
#> 2 Didelphimorphia          1        5        10
#> 3 Chiroptera               3        9         9
#> 4 Primates                 3        5         9
#> 5 Eulipotyphla             1        1         2
#> 6 Cingulata                1        1         1

# Include endemism rates
pm_list_endemic(include_rate = TRUE)
#> # A tibble: 14 × 7
#>    order        n_families n_genera n_endemic n_species endemic_rate endemic_pct
#>    <chr>             <int>    <int>     <int>     <int>        <dbl>       <dbl>
#>  1 Rodentia             11       67        56       194       0.289         28.9
#>  2 Chiroptera            8       64         9       189       0.0476         4.8
#>  3 Didelphimor…          1       15        10        47       0.213         21.3
#>  4 Artiodactyla         10       31         0        46       0              0  
#>  5 Primates              3       12         9        42       0.214         21.4
#>  6 Carnivora             7       20         0        33       0              0  
#>  7 Pilosa                4        5         0         7       0              0  
#>  8 Cingulata             2        3         1         5       0.2           20  
#>  9 Eulipotyphla          1        1         2         3       0.667         66.7
#> 10 Lagomorpha            1        1         0         2       0              0  
#> 11 Paucituberc…          1        2         0         2       0              0  
#> 12 Perissodact…          1        1         0         2       0              0  
#> 13 Sirenia               1        1         0         1       0              0  
#> 14 Total                16       43        87       573       0.152         15.2

```
