# Standardize species names for matching with Peru mammals database

Internal function to standardize species names before matching against
the peru_mammals database. Handles common formatting issues and removes
hybrid indicators. Note: peru_mammals does not include infraspecific
taxa.

## Usage

``` r
.names_standardize(splist)
```

## Arguments

- splist:

  Character vector of species names to standardize

## Value

Character vector of standardized names
