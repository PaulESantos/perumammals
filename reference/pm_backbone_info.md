# Display taxonomic backbone metadata for Peruvian mammals

Displays summary information about the taxonomic backbone used in
perumammals. The backbone is based on the taxonomic checklist published
by Pacheco et al. (2021), which was digitised from the original PDF
publication into a structured tibble format.

## Usage

``` r
pm_backbone_info()
```

## Value

Invisibly returns a tibble with one row containing the backbone
metadata. The same structure as
[`peru_mammals_backbone`](https://paulesantos.github.io/perumammals/reference/peru_mammals_backbone.md).
Called primarily for its side effect of printing the summary
information.

## References

Pacheco Torres, V. R., Diaz, S., Graham Angeles, L. A., Flores-Quispe,
M., Calizaya-Mamani, G., Ruelas, D., & Sánchez-Vendizú, P. (2021). Lista
actualizada de la diversidad de los mamíferos del Perú y una propuesta
para su actualización. *Revista Peruana De Biología*, **28**(4), e21019.
[doi:10.15381/rpb.v28i4.21019](https://doi.org/10.15381/rpb.v28i4.21019)

## See also

[`peru_mammals_backbone`](https://paulesantos.github.io/perumammals/reference/peru_mammals_backbone.md)
for the complete backbone data.

## Examples

``` r
# Display backbone information
pm_backbone_info()
#> ── Perumammals Backbone Summary ────────────────────────────────────────────────
#> ℹ Source: Pacheco et al. (2021) Lista actualizada de la diversidad de los mamíferos del Perú y una propuesta para su actualización
#> ℹ Year: 2021
#> ℹ Number of species: 573
#> 
#> Full citation:
#> Pacheco Torres, V. R., Diaz, S., Graham Angeles, L. A., Flores-Quispe, M.,
#> Calizaya-Mamani, G., Ruelas, D., & Sánchez-Vendizú, P. (2021). Lista
#> actualizada de la diversidad de los mamíferos del Perú y una propuesta
#> para su actualización. Revista Peruana De Biología, 28(4), e21019.
#> https://doi.org/10.15381/rpb.v28i4.21019
#> ────────────────────────────────────────────────────────────────────────────────

# Access the data invisibly returned
backbone_data <- pm_backbone_info()
#> ── Perumammals Backbone Summary ────────────────────────────────────────────────
#> ℹ Source: Pacheco et al. (2021) Lista actualizada de la diversidad de los mamíferos del Perú y una propuesta para su actualización
#> ℹ Year: 2021
#> ℹ Number of species: 573
#> 
#> Full citation:
#> Pacheco Torres, V. R., Diaz, S., Graham Angeles, L. A., Flores-Quispe, M.,
#> Calizaya-Mamani, G., Ruelas, D., & Sánchez-Vendizú, P. (2021). Lista
#> actualizada de la diversidad de los mamíferos del Perú y una propuesta
#> para su actualización. Revista Peruana De Biología, 28(4), e21019.
#> https://doi.org/10.15381/rpb.v28i4.21019
#> ────────────────────────────────────────────────────────────────────────────────
backbone_data$n_species
#> [1] 573
```
