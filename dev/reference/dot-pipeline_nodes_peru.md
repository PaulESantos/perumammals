# Matching Pipeline - Hierarchical Strategy

Implements hierarchical matching for peru_mammals: Node 1: Direct exact
match (genus + species) Node 2: Genus exact match Node 3: Genus fuzzy
match Node 4: Species fuzzy match within matched genus

## Usage

``` r
.pipeline_nodes_peru(df, target_df, quiet)
```
