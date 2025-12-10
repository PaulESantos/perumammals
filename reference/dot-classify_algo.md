# Classification algorithm for a single name

Internal algorithm to parse a single species name into its components.
Handles regular binomials and special cases like "Genus sp. identifier"
(e.g., "Akodon sp. Ancash").

## Usage

``` r
.classify_algo(x_split_i)
```

## Arguments

- x_split_i:

  Character vector with split name parts

## Value

Character vector with classified components (genus, species, author)
