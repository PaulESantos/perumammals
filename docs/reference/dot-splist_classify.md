# Classify species names into taxonomic components

Internal wrapper function to classify multiple species names into their
taxonomic components (genus, species, author). Peru mammals database
does not include infraspecific taxa, but this function handles "sp."
notations for undescribed species (e.g., "Akodon sp. Ancash").

## Usage

``` r
.splist_classify(x)
```

## Arguments

- x:

  Character vector of species names

## Value

Matrix with classified name components
