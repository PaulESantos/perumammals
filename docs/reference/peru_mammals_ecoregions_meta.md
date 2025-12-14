# Metadata for Peruvian mammal ecoregions

Definitions of the ecoregion codes used in
[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md)
and
[`peru_mammals_ecoregions`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions.md).
The codes follow the abbreviations used by Pacheco et al. (2021), based
on Peruvian ecoregion schemes.

## Usage

``` r
data("peru_mammals_ecoregions_meta")
```

## Format

A tibble with one row per ecoregion code and 2 variables:

- ecoregion_code:

  Character. Ecoregion abbreviation. The codes used in the dataset are:

  - `"OCE"` – Oceánica

  - `"BPP"` – Bosque Pluvial del Pacífico

  - `"BSE"` – Bosque Seco Ecuatorial

  - `"COS"` – Costa

  - `"VOC"` – Vertiente Occidental

  - `"PAR"` – Páramo

  - `"PUN"` – Puna

  - `"YUN"` – Yungas

  - `"SB"` – Selva Baja

  - `"SP"` – Sabana de Palmera

- ecoregion_label:

  Character. Human-readable label/description of the ecoregion in
  Spanish.

## Source

Pacheco et al. (2021).

## See also

[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md),
[`peru_mammals_ecoregions`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions.md)
