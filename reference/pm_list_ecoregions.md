# Display ecoregion metadata for Peruvian mammals

Displays summary information about the ecoregions used in the Peruvian
mammal backbone. Ecoregions follow the classification system used in
Peruvian biogeography to describe the distribution of mammal species
across different ecological regions.

## Usage

``` r
pm_list_ecoregions()
```

## Value

Invisibly returns a tibble with the ecoregion metadata table. The same
structure as
[`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md).
Called primarily for its side effect of printing the ecoregion
information.

## See also

[`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
for the complete ecoregion metadata,
[`pm_by_ecoregion()`](https://paulesantos.github.io/perumammals/reference/pm_by_ecoregion.md)
to filter species by ecoregion,
[`pm_ecoregion_summary()`](https://paulesantos.github.io/perumammals/reference/pm_ecoregion_summary.md)
for species richness summaries by ecoregion.

## Examples

``` r
# Display ecoregion information
pm_list_ecoregions()
#> ── Peruvian Mammal Ecoregions ──────────────────────────────────────────────────
#> ℹ Number of ecoregions: 10
#> 
#> Available ecoregion codes:
#> 
#> BPP - Bosque Pluvial del Pacífico
#> BSE - Bosque Seco Ecuatorial
#> COS - Costa
#> OCE - Oceánica
#> PAR - Páramo
#> PUN - Puna
#> SB - Selva Baja
#> SP - Sabana de Palmera
#> VOC - Vertiente Occidental
#> YUN - Yungas
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> ────────────────────────────────────────────────────────────────────────────────

# Access the data invisibly returned
ecoregion_data <- pm_list_ecoregions()
#> ── Peruvian Mammal Ecoregions ──────────────────────────────────────────────────
#> ℹ Number of ecoregions: 10
#> 
#> Available ecoregion codes:
#> 
#> BPP - Bosque Pluvial del Pacífico
#> BSE - Bosque Seco Ecuatorial
#> COS - Costa
#> OCE - Oceánica
#> PAR - Páramo
#> PUN - Puna
#> SB - Selva Baja
#> SP - Sabana de Palmera
#> VOC - Vertiente Occidental
#> YUN - Yungas
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> ────────────────────────────────────────────────────────────────────────────────
nrow(ecoregion_data)
#> [1] 10

# Get just the codes
ecoregion_data$ecoregion_code
#>  [1] "BPP" "BSE" "COS" "OCE" "PAR" "PUN" "SB"  "SP"  "VOC" "YUN"
```
