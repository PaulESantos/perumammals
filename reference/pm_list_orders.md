# List taxonomic orders in the Peruvian mammal backbone

Summarises the number of families, genera, species and endemic species
per order in `peru_mammals`.

## Usage

``` r
pm_list_orders()
```

## Value

A tibble with one row per order and the following columns:

- `order` – taxonomic order.

- `n_families` – number of families in the order.

- `n_genera` – number of genera in the order.

- `n_species` – number of species in the order.

- `n_endemic` – number of endemic species in the order.

## Examples

``` r
pm_list_orders()
#> # A tibble: 13 × 5
#>    order            n_families n_genera n_species n_endemic
#>    <chr>                 <int>    <int>     <int>     <int>
#>  1 Artiodactyla             10       31        46         0
#>  2 Carnivora                 7       20        33         0
#>  3 Chiroptera                8       64       189         9
#>  4 Cingulata                 2        3         5         1
#>  5 Didelphimorphia           1       15        47        10
#>  6 Eulipotyphla              1        1         3         2
#>  7 Lagomorpha                1        1         2         0
#>  8 Paucituberculata          1        2         2         0
#>  9 Perissodactyla            1        1         2         0
#> 10 Pilosa                    4        5         7         0
#> 11 Primates                  3       12        42         9
#> 12 Rodentia                 11       67       194        56
#> 13 Sirenia                   1        1         1         0

```
