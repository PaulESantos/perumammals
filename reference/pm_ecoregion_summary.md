# Summary of species richness by ecoregion

Computes a summary of species richness and endemism for each ecoregion
in the Peruvian mammal backbone.

## Usage

``` r
pm_ecoregion_summary(sort_by = c("code", "species", "endemic", "label"))
```

## Arguments

- sort_by:

  Character string indicating how to sort the results. Options are:

  - `"code"` (default) – sort alphabetically by ecoregion code.

  - `"species"` – sort by number of species (descending).

  - `"endemic"` – sort by number of endemic species (descending).

  - `"label"` – sort alphabetically by ecoregion label.

## Value

A tibble with one row per ecoregion and the following columns:

- `ecoregion_code` – ecoregion abbreviation.

- `ecoregion_label` – ecoregion description in Spanish.

- `n_species` – total number of species recorded in the ecoregion.

- `n_endemic` – number of endemic species recorded in the ecoregion.

- `pct_endemic` – percentage of endemic species in the ecoregion.

## Details

The summary is based on the long-format table
[`peru_mammals_ecoregions`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions.md)
and joins metadata from
[`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
and endemism information from
[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md).

## See also

[`pm_list_ecoregions()`](https://paulesantos.github.io/perumammals/reference/pm_list_ecoregions.md)
for ecoregion metadata,
[`pm_by_ecoregion()`](https://paulesantos.github.io/perumammals/reference/pm_by_ecoregion.md)
to list species by ecoregion.

## Examples

``` r
# Get summary for all ecoregions (sorted by code)
pm_ecoregion_summary()
#> # A tibble: 10 × 5
#>    ecoregion_code ecoregion_label             n_species n_endemic pct_endemic
#>    <chr>          <chr>                           <int>     <int>       <dbl>
#>  1 BPP            Bosque Pluvial del Pacífico        69         0         0  
#>  2 BSE            Bosque Seco Ecuatorial             81         4         4.9
#>  3 COS            Costa                              66        16        24.2
#>  4 OCE            Oceánica                           30         0         0  
#>  5 PAR            Páramo                             26         4        15.4
#>  6 PUN            Puna                               71        14        19.7
#>  7 SB             Selva Baja                        320        18         5.6
#>  8 SP             Sabana de Palmera                  83         0         0  
#>  9 VOC            Vertiente Occidental               72        15        20.8
#> 10 YUN            Yungas                            256        48        18.8

# Sort by species richness
pm_ecoregion_summary(sort_by = "species")
#> # A tibble: 10 × 5
#>    ecoregion_code ecoregion_label             n_species n_endemic pct_endemic
#>    <chr>          <chr>                           <int>     <int>       <dbl>
#>  1 SB             Selva Baja                        320        18         5.6
#>  2 YUN            Yungas                            256        48        18.8
#>  3 SP             Sabana de Palmera                  83         0         0  
#>  4 BSE            Bosque Seco Ecuatorial             81         4         4.9
#>  5 VOC            Vertiente Occidental               72        15        20.8
#>  6 PUN            Puna                               71        14        19.7
#>  7 BPP            Bosque Pluvial del Pacífico        69         0         0  
#>  8 COS            Costa                              66        16        24.2
#>  9 OCE            Oceánica                           30         0         0  
#> 10 PAR            Páramo                             26         4        15.4

# Sort by number of endemic species
pm_ecoregion_summary(sort_by = "endemic")
#> # A tibble: 10 × 5
#>    ecoregion_code ecoregion_label             n_species n_endemic pct_endemic
#>    <chr>          <chr>                           <int>     <int>       <dbl>
#>  1 YUN            Yungas                            256        48        18.8
#>  2 SB             Selva Baja                        320        18         5.6
#>  3 COS            Costa                              66        16        24.2
#>  4 VOC            Vertiente Occidental               72        15        20.8
#>  5 PUN            Puna                               71        14        19.7
#>  6 BSE            Bosque Seco Ecuatorial             81         4         4.9
#>  7 PAR            Páramo                             26         4        15.4
#>  8 BPP            Bosque Pluvial del Pacífico        69         0         0  
#>  9 OCE            Oceánica                           30         0         0  
#> 10 SP             Sabana de Palmera                  83         0         0  

# Find ecoregion with highest species richness
eco_summary <- pm_ecoregion_summary(sort_by = "species")
eco_summary[1, ]
#> # A tibble: 1 × 5
#>   ecoregion_code ecoregion_label n_species n_endemic pct_endemic
#>   <chr>          <chr>               <int>     <int>       <dbl>
#> 1 SB             Selva Baja            320        18         5.6

# Ecoregions with more than 100 species
eco_summary <- pm_ecoregion_summary()
subset(eco_summary, n_species > 100)
#> # A tibble: 2 × 5
#>   ecoregion_code ecoregion_label n_species n_endemic pct_endemic
#>   <chr>          <chr>               <int>     <int>       <dbl>
#> 1 SB             Selva Baja            320        18         5.6
#> 2 YUN            Yungas                256        48        18.8

# Compare richness between lowland and highland ecoregions
eco_summary <- pm_ecoregion_summary(sort_by = "species")
lowland <- eco_summary[eco_summary$ecoregion_code %in% c("SB", "SP"), ]
highland <- eco_summary[eco_summary$ecoregion_code %in% c("PUN", "PAR"), ]
```
