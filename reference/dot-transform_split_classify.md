# Transform and structure classified names

Internal function to transform the classification matrix into a
structured data frame. Simplified for peru_mammals which only has
binomial names (and some "sp." cases) without infraspecific categories.

**Important**: This function distinguishes between:

- Original NAs from the input (expected missing values)

- Malformed names that failed rank assignment (problematic inputs)

Only the latter trigger warnings to avoid false positives.

## Usage

``` r
.transform_split_classify(df)
```

## Arguments

- df:

  Data frame or matrix from .splist_classify

## Value

Data frame with transformed names and rank
