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
if (FALSE) { # \dontrun{
pm_list_orders()
} # }
```
