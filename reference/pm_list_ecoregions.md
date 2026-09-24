# Display ecoregion metadata for Peruvian mammals

Displays summary information about the ecoregions used in the Peruvian
mammal backbone. Ecoregions follow the Brack-Egg (1986) classification
system used in Peruvian biogeography to describe the distribution of
mammal species across different ecological regions.

## Usage

``` r
pm_list_ecoregions(include_endemic = FALSE)
```

## Arguments

- include_endemic:

  Logical. If `TRUE`, includes columns showing the number and percentage
  of endemic species per ecoregion. Default is `FALSE`.

## Value

A tibble with one row per ecoregion, arranged in descending order by
species richness, with the following columns:

- ecoregion_code:

  Abbreviated ecoregion code (e.g., "SB", "YUN")

- ecoregion_label:

  Full ecoregion name in Spanish

- n_species:

  Total number of mammal species recorded in the ecoregion

- pct_species:

  Percentage of Peru's total mammal diversity (0-100)

- n_endemic:

  (Only if `include_endemic = TRUE`) Number of endemic species in the
  ecoregion

- pct_endemic:

  (Only if `include_endemic = TRUE`) Percentage of endemic species
  relative to total species in the ecoregion (0-100)

## Details

The ecoregion classification follows Brack-Egg (1986), a widely-used
biogeographic framework for Peru that recognizes 10 distinct ecological
regions based on climate, vegetation, and elevation. This classification
is used in Pacheco et al. (2021) to document the distribution patterns
of Peruvian mammals.

The function prints a formatted summary to the console and invisibly
returns the complete data for further analysis.

## References

Brack-Egg, A. (1986). Ecología de un país complejo. In J. Mejía Baca
(Ed.), Gran Geografía del Perú: Naturaleza y Hombre (Vol. 2, pp.
175-319). Barcelona: Manfer-Mejía Baca.

## See also

[`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
for the complete ecoregion metadata,
[`peru_mammals_ecoregions`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions.md)
for species-ecoregion associations,
[`pm_by_ecoregion()`](https://paulesantos.github.io/perumammals/reference/pm_by_ecoregion.md)
to filter species by ecoregion,
[`pm_ecoregion_summary()`](https://paulesantos.github.io/perumammals/reference/pm_ecoregion_summary.md)
for species richness summaries by ecoregion.

## Examples

``` r
# Display ecoregion information
pm_list_ecoregions()
#> ── Peruvian Mammal Ecoregions (Brack-Egg, 1986) ────────────────────────────────
#> ℹ Number of ecoregions: 10
#> ℹ Total mammal species in Peru: 573
#> 
#> Ecoregions by species richness:
#> 
#> SB - Selva Baja: 320 species (55.8%)
#> YUN - Yungas: 256 species (44.7%)
#> SP - Sabana de Palmera: 83 species (14.5%)
#> BSE - Bosque Seco Ecuatorial: 81 species (14.1%)
#> VOC - Vertiente Occidental: 72 species (12.6%)
#> PUN - Puna: 71 species (12.4%)
#> BPP - Bosque Pluvial del Pacífico: 69 species (12%)
#> COS - Costa: 66 species (11.5%)
#> OCE - Oceánica: 30 species (5.2%)
#> PAR - Páramo: 26 species (4.5%)
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> Use include_endemic = TRUE to see endemic species counts
#> ────────────────────────────────────────────────────────────────────────────────

# Include endemic species information
 pm_list_ecoregions(include_endemic = TRUE)
#> ── Peruvian Mammal Ecoregions (Brack-Egg, 1986) ────────────────────────────────
#> ℹ Number of ecoregions: 10
#> ℹ Total mammal species in Peru: 573
#> 
#> Ecoregions by species richness:
#> 
#> SB - Selva Baja: 320 species (55.8%), 18 endemic (5.6%)
#> YUN - Yungas: 256 species (44.7%), 48 endemic (18.8%)
#> SP - Sabana de Palmera: 83 species (14.5%), 0 endemic (0%)
#> BSE - Bosque Seco Ecuatorial: 81 species (14.1%), 4 endemic (4.9%)
#> VOC - Vertiente Occidental: 72 species (12.6%), 15 endemic (20.8%)
#> PUN - Puna: 71 species (12.4%), 14 endemic (19.7%)
#> BPP - Bosque Pluvial del Pacífico: 69 species (12%), 0 endemic (0%)
#> COS - Costa: 66 species (11.5%), 16 endemic (24.2%)
#> OCE - Oceánica: 30 species (5.2%), 0 endemic (0%)
#> PAR - Páramo: 26 species (4.5%), 4 endemic (15.4%)
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> ────────────────────────────────────────────────────────────────────────────────

# Access the data for further analysis
ecoregion_data <- pm_list_ecoregions()
#> ── Peruvian Mammal Ecoregions (Brack-Egg, 1986) ────────────────────────────────
#> ℹ Number of ecoregions: 10
#> ℹ Total mammal species in Peru: 573
#> 
#> Ecoregions by species richness:
#> 
#> SB - Selva Baja: 320 species (55.8%)
#> YUN - Yungas: 256 species (44.7%)
#> SP - Sabana de Palmera: 83 species (14.5%)
#> BSE - Bosque Seco Ecuatorial: 81 species (14.1%)
#> VOC - Vertiente Occidental: 72 species (12.6%)
#> PUN - Puna: 71 species (12.4%)
#> BPP - Bosque Pluvial del Pacífico: 69 species (12%)
#> COS - Costa: 66 species (11.5%)
#> OCE - Oceánica: 30 species (5.2%)
#> PAR - Páramo: 26 species (4.5%)
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> Use include_endemic = TRUE to see endemic species counts
#> ────────────────────────────────────────────────────────────────────────────────

# Ecoregions with highest species richness
ecoregion_data
#> # A tibble: 10 × 4
#>    ecoregion_code ecoregion_label             n_species pct_species
#>    <chr>          <chr>                           <int>       <dbl>
#>  1 SB             Selva Baja                        320        55.8
#>  2 YUN            Yungas                            256        44.7
#>  3 SP             Sabana de Palmera                  83        14.5
#>  4 BSE            Bosque Seco Ecuatorial             81        14.1
#>  5 VOC            Vertiente Occidental               72        12.6
#>  6 PUN            Puna                               71        12.4
#>  7 BPP            Bosque Pluvial del Pacífico        69        12  
#>  8 COS            Costa                              66        11.5
#>  9 OCE            Oceánica                           30         5.2
#> 10 PAR            Páramo                             26         4.5
```
