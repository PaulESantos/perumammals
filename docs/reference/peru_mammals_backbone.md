# Summary information on the perumammals taxonomic backbone

A one-row tibble with metadata about the taxonomic backbone used in
perumammals, including its bibliographic source, year, number of species
and the date when the internal data objects were created.

## Usage

``` r
data("peru_mammals_backbone")
```

## Format

A tibble with 1 row and 4 variables:

- source:

  Character. Short bibliographic reference to the backbone source
  (Pacheco et al. 2021).

- source_year:

  Integer. Publication year of the backbone source (2021).

- n_species:

  Integer. Number of species included in the backbone (as rows in
  [`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md)).

- created_at:

  Date. Date when the backbone data objects were generated (in the
  package build process).

## Details

This object is intended for internal bookkeeping and for functions that
report the origin and version of the backbone.

## See also

[`peru_mammals`](https://paulesantos.github.io/perumammals/reference/peru_mammals.md)
