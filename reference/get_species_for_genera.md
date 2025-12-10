# Get All Species for Matched Genera from Peru Mammals

Helper function to retrieve all species belonging to matched genera from
the peru_mammals database. Useful for suggesting possible species when
only genus is provided.

## Usage

``` r
get_species_for_genera(matched_genera, target_df = NULL)
```

## Arguments

- matched_genera:

  Character vector of matched genus names (uppercase)

- target_df:

  A data frame representing the peru_mammals database

## Value

A data frame with genus and species columns for all species in the
matched genera.

## Examples

``` r
if (FALSE) { # \dontrun{
# Get all species of Panthera
data(peru_mammals)
panthera_species <- get_species_for_genera("PANTHERA", peru_mammals)
} # }
```
