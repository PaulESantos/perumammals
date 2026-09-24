# Map with optional progress bar

Internal wrapper for purrr::map_dfr with optional progress tracking.
Progress bars are only shown in interactive sessions.

## Usage

``` r
.map_dfr_progress(.x, .f, ..., .id = NULL, .progress = interactive())
```

## Arguments

- .x:

  A list or vector to iterate over

- .f:

  A function to apply

- ...:

  Additional arguments passed to .f

- .id:

  Column name for row identification

- .progress:

  Logical. Show progress bar? Default is interactive()

## Value

Data frame with combined results
