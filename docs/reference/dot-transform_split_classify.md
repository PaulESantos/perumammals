# Transform and structure classified names

Internal function to transform the classification matrix into a
structured data frame. Simplified for peru_mammals which only has
binomial names (and some "sp." cases) without infraspecific categories.

## Usage

``` r
.transform_split_classify(df)
```

## Arguments

- df:

  Data frame or matrix from .splist_classify

## Value

Data frame with transformed names and rank
