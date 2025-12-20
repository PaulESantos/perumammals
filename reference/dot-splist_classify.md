# Classify species names into taxonomic components

Internal wrapper function to classify multiple species names into their
taxonomic components (genus, species, author). Peru mammals database
does not include infraspecific taxa, but this function handles "sp."
notations for undescribed species (e.g., "Akodon sp. Ancash").

**Automatic normalization**: Empty strings ("", " ", etc.) are
automatically converted to NA before processing, as they represent
missing values and cannot match any names in the database.

## Usage

``` r
.splist_classify(x)
```

## Arguments

- x:

  Character vector of species names

## Value

Matrix with classified name components
