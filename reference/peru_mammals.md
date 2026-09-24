# Mammal species of Peru based on Pacheco et al. (2021)

A backbone of the terrestrial and marine mammal species known for Peru,
compiled from Pacheco et al. (2021) "Lista actualizada de la diversidad
de los mamíferos del Perú y una propuesta para su actualización".

## Usage

``` r
data("peru_mammals")
```

## Format

A tibble with 573 rows and 12 variables:

- pm_id:

  Character. Internal stable identifier for the species, combining the
  original numeric id and an abbreviation of the genus. Intended for
  internal linking between tables.

- order:

  Character. Taxonomic order (e.g. *Didelphimorphia*, *Rodentia*,
  *Chiroptera*).

- family:

  Character. Taxonomic family.

- genus:

  Character. Genus name.

- species:

  Character. Specific epithet.

- scientific_name:

  Character. Binomial scientific name (*Genus species*), without
  authorship. This is the main field used for name validation.

- scientific_name_full:

  Character. Full scientific name including authorship and year, as
  provided in the original annex.

- author:

  Character. Authorship and year of the species name.

- common_name:

  Character. Common name in Spanish, when available.

- endemic:

  Logical. `TRUE` if the species is considered endemic to Peru in
  Pacheco et al. (2021), `FALSE` otherwise.

- ecoregions:

  Character. Comma-separated codes of Peruvian ecoregions where the
  species occurs, using the abbreviations defined by Pacheco et
  al. (2021) (e.g. `"YUN, SB, SP"`). See
  [`peru_mammals_ecoregions_meta`](https://paulesantos.github.io/perumammals/reference/peru_mammals_ecoregions_meta.md)
  for code definitions.

- reference:

  Character. Bibliographic notes or specific references supporting the
  presence or taxonomy of the species.

## Source

Pacheco, V., Cadenillas, R., Zeballos, H., Hurtado, C. M., Ruelas, D., &
Pari, A. (2021). Lista actualizada de la diversidad de los mamíferos del
Perú y una propuesta para su actualización.

## Details

Each row corresponds to a single species as listed in the original annex
of the paper. This dataset is the main taxonomic backbone used by the
perumammals package.
