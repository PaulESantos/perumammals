# List taxonomic families in the Peruvian mammal backbone

Summarises the number of genera, species and endemic species per family.
Optionally filters the output to one or more taxonomic orders.

## Usage

``` r
pm_list_families(order = NULL)
```

## Arguments

- order:

  Optional character vector specifying one or more taxonomic orders to
  include. If `NULL` (default), all orders are included. Order names are
  case-sensitive (e.g., "Rodentia", "Chiroptera").

## Value

A tibble with one row per family, arranged by order and family name,
with the following columns:

- order:

  Taxonomic order

- family:

  Family name

- n_genera:

  Number of genera in the family

- n_species:

  Number of species in the family

- n_endemic:

  Number of endemic species to Peru in the family

## Examples

``` r
# All families
pm_list_families()
#> # A tibble: 51 × 5
#>    order        family          n_genera n_species n_endemic
#>    <chr>        <chr>              <int>     <int>     <int>
#>  1 Artiodactyla Balaenidae             1         1         0
#>  2 Artiodactyla Balaenopteridae        2         6         0
#>  3 Artiodactyla Camelidae              2         4         0
#>  4 Artiodactyla Cerevidae              5         8         0
#>  5 Artiodactyla Delphinidae           13        17         0
#>  6 Artiodactyla Iniidae                1         1         0
#>  7 Artiodactyla Phocoenidae            1         1         0
#>  8 Artiodactyla Physeteridae           2         3         0
#>  9 Artiodactyla Tayassuidae            2         2         0
#> 10 Artiodactyla Ziphiidae              2         3         0
#> # ℹ 41 more rows

# Only families within Rodentia
pm_list_families(order = "Rodentia")
#> # A tibble: 11 × 5
#>    order    family         n_genera n_species n_endemic
#>    <chr>    <chr>             <int>     <int>     <int>
#>  1 Rodentia Abrocomidae           2         3         2
#>  2 Rodentia Caviidae              4         6         0
#>  3 Rodentia Chinchillidae         3         3         1
#>  4 Rodentia Cricetidae           40       137        47
#>  5 Rodentia Ctenomyidae           1         3         1
#>  6 Rodentia Cuniculidae           1         2         0
#>  7 Rodentia Dasyproctidae         2         5         1
#>  8 Rodentia Dinomyidae            1         1         0
#>  9 Rodentia Echimyidae            8        20         3
#> 10 Rodentia Erethizontidae        1         4         0
#> 11 Rodentia Sciuridae             4        10         1

# Multiple orders
pm_list_families(order = c("Rodentia", "Chiroptera"))
#> # A tibble: 19 × 5
#>    order      family           n_genera n_species n_endemic
#>    <chr>      <chr>               <int>     <int>     <int>
#>  1 Chiroptera Emballonuridae          7        14         0
#>  2 Chiroptera Furipteridae            2         2         0
#>  3 Chiroptera Molossidae              9        30         3
#>  4 Chiroptera Mormoopidae             2         5         0
#>  5 Chiroptera Noctilionidae           1         2         0
#>  6 Chiroptera Phyllostomidae         38       107         3
#>  7 Chiroptera Thyropteridae           1         4         0
#>  8 Chiroptera Vespertilionidae        4        25         3
#>  9 Rodentia   Abrocomidae             2         3         2
#> 10 Rodentia   Caviidae                4         6         0
#> 11 Rodentia   Chinchillidae           3         3         1
#> 12 Rodentia   Cricetidae             40       137        47
#> 13 Rodentia   Ctenomyidae             1         3         1
#> 14 Rodentia   Cuniculidae             1         2         0
#> 15 Rodentia   Dasyproctidae           2         5         1
#> 16 Rodentia   Dinomyidae              1         1         0
#> 17 Rodentia   Echimyidae              8        20         3
#> 18 Rodentia   Erethizontidae          1         4         0
#> 19 Rodentia   Sciuridae               4        10         1
```
