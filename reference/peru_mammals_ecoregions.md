# Mammal species by Peruvian ecoregion

A long-format table linking each mammal species to the Peruvian
ecoregions where it occurs, based on Pacheco et al. (2021).

## Usage

``` r
data("peru_mammals_ecoregions")
```

## Format

A tibble with one row per species–ecoregion combination and 3 variables:

- pm_id:

  Character. Internal species identifier, matching
  [`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md).

- scientific_name:

  Character. Binomial scientific name (*Genus species*).

- ecoregion_code:

  Character. Abbreviation of the ecoregion where the species occurs
  (e.g. `"YUN"`, `"SB"`, `"COS"`). See
  [`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
  for code definitions.

## Source

Pacheco et al. (2021).

## Details

Each row corresponds to a single combination of species and ecoregion.
This dataset is derived from the `ecoregions` field of
[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md).

## See also

[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md),
[`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
