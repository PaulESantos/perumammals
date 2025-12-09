# List genera in the Peruvian mammal backbone

Summarises the number of species and endemic species per genus.
Optionally restricts the output to one or more orders and/or families.
Genera with missing values are excluded from the results.

## Usage

``` r
pm_list_genera(order = NULL, family = NULL)
```

## Arguments

- order:

  Optional character vector with one or more taxonomic orders to keep.
  If `NULL` (default), no filter is applied by order. Invalid order
  names will generate a warning.

- family:

  Optional character vector with one or more families to keep. If `NULL`
  (default), no filter is applied by family. Invalid family names will
  generate a warning.

## Value

A tibble with one row per genus and the following columns:

- `order` – taxonomic order.

- `family` – family name.

- `genus` – genus name.

- `n_species` – number of species in the genus.

- `n_endemic` – number of endemic species in the genus.

Returns an empty tibble with the same structure if no records match the
specified filters.

## Details

The function validates input parameters and warns if invalid order or
family names are provided. It also warns if the filters result in an
empty dataset.

## Examples

``` r
# All genera
pm_list_genera()
#> # A tibble: 223 × 5
#>    order        family          genus        n_species n_endemic
#>    <chr>        <chr>           <chr>            <int>     <int>
#>  1 Artiodactyla Balaenidae      Eubalaena            1         0
#>  2 Artiodactyla Balaenopteridae Balaenoptera         5         0
#>  3 Artiodactyla Balaenopteridae Megaptera            1         0
#>  4 Artiodactyla Camelidae       Lama                 2         0
#>  5 Artiodactyla Camelidae       Vicugna              2         0
#>  6 Artiodactyla Cerevidae       Blastocerus          1         0
#>  7 Artiodactyla Cerevidae       Hippocamelus         1         0
#>  8 Artiodactyla Cerevidae       Mazama               4         0
#>  9 Artiodactyla Cerevidae       Odocoileus           1         0
#> 10 Artiodactyla Cerevidae       Pudu                 1         0
#> # ℹ 213 more rows

# Genera within Chiroptera (bats)
pm_list_genera(order = "Chiroptera")
#> # A tibble: 64 × 5
#>    order      family         genus           n_species n_endemic
#>    <chr>      <chr>          <chr>               <int>     <int>
#>  1 Chiroptera Emballonuridae Centronycteris          2         0
#>  2 Chiroptera Emballonuridae Cormura                 1         0
#>  3 Chiroptera Emballonuridae Cyttarops               1         0
#>  4 Chiroptera Emballonuridae Diclidurus              2         0
#>  5 Chiroptera Emballonuridae Peropteryx              4         0
#>  6 Chiroptera Emballonuridae Rhynchonycteris         1         0
#>  7 Chiroptera Emballonuridae Saccopteryx             3         0
#>  8 Chiroptera Furipteridae   Amorphochilus           1         0
#>  9 Chiroptera Furipteridae   Furipterus              1         0
#> 10 Chiroptera Molossidae     Cynomops                4         0
#> # ℹ 54 more rows

# Multiple orders
pm_list_genera(order = c("Didelphimorphia", "Chiroptera"))
#> # A tibble: 79 × 5
#>    order      family         genus           n_species n_endemic
#>    <chr>      <chr>          <chr>               <int>     <int>
#>  1 Chiroptera Emballonuridae Centronycteris          2         0
#>  2 Chiroptera Emballonuridae Cormura                 1         0
#>  3 Chiroptera Emballonuridae Cyttarops               1         0
#>  4 Chiroptera Emballonuridae Diclidurus              2         0
#>  5 Chiroptera Emballonuridae Peropteryx              4         0
#>  6 Chiroptera Emballonuridae Rhynchonycteris         1         0
#>  7 Chiroptera Emballonuridae Saccopteryx             3         0
#>  8 Chiroptera Furipteridae   Amorphochilus           1         0
#>  9 Chiroptera Furipteridae   Furipterus              1         0
#> 10 Chiroptera Molossidae     Cynomops                4         0
#> # ℹ 69 more rows

# Genera within a specific family
bat_genera <- pm_list_genera(family = "Phyllostomidae")

# Count total endemic species in a family
sum(bat_genera$n_endemic)
#> [1] 3

# Combination of filters
pm_list_genera(order = "Chiroptera", family = "Phyllostomidae")
#> # A tibble: 38 × 5
#>    order      family         genus        n_species n_endemic
#>    <chr>      <chr>          <chr>            <int>     <int>
#>  1 Chiroptera Phyllostomidae Anoura               8         1
#>  2 Chiroptera Phyllostomidae Artibeus            12         0
#>  3 Chiroptera Phyllostomidae Carollia             5         0
#>  4 Chiroptera Phyllostomidae Chiroderma           3         0
#>  5 Chiroptera Phyllostomidae Choeroniscus         1         0
#>  6 Chiroptera Phyllostomidae Chrotopterus         1         0
#>  7 Chiroptera Phyllostomidae Desmodus             1         0
#>  8 Chiroptera Phyllostomidae Diaemus              1         0
#>  9 Chiroptera Phyllostomidae Diphylla             1         0
#> 10 Chiroptera Phyllostomidae Enchisthenes         1         0
#> # ℹ 28 more rows

# Invalid input generates warning
if (FALSE) { # \dontrun{
pm_list_genera(order = "InvalidOrder")
} # }
```
