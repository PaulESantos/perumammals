# Check if taxonomic backbone needs updating

Checks whether a newer version of the Pacheco et al. mammal checklist
might be available based on the publication year.

## Usage

``` r
check_backbone_update(backbone_year)
```

## Arguments

- backbone_year:

  Numeric or character year of the current backbone.

## Value

A list with components:

- `update_available` – logical indicating if update may be available.

- `message` – character string with information message.
