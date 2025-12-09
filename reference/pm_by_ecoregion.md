# List species by ecoregion

Convenience wrapper to list species occurring in one or more Peruvian
ecoregions. This function uses
[`pm_species()`](https://paulesantos.github.io/perumammals/reference/pm_species.md)
internally and therefore supports the same taxonomic and endemism
filters.

## Usage

``` r
pm_by_ecoregion(
  ecoregion,
  order = NULL,
  family = NULL,
  genus = NULL,
  endemic = NULL
)
```

## Arguments

- ecoregion:

  Character vector with one or more ecoregion codes (e.g. `"YUN"`,
  `"SB"`, `"COS"`). At least one code must be provided. Invalid codes
  will generate a warning.

- order:

  Optional character vector with one or more taxonomic orders to keep.
  If `NULL` (default), no filter is applied by order.

- family:

  Optional character vector with one or more families to keep. If `NULL`
  (default), no filter is applied by family.

- genus:

  Optional character vector with one or more genera to keep. If `NULL`
  (default), no filter is applied by genus.

- endemic:

  Optional logical. If `TRUE`, only endemic species are returned; if
  `FALSE`, only non-endemic species are returned; if `NULL` (default),
  no filter is applied by endemism.

## Value

A tibble with a subset of rows from `peru_mammals` corresponding to
species present in at least one of the requested ecoregions. Returns an
empty tibble if no species match the criteria.

## See also

[`pm_list_ecoregions()`](https://paulesantos.github.io/perumammals/reference/pm_list_ecoregions.md)
to see available ecoregion codes,
[`pm_species()`](https://paulesantos.github.io/perumammals/reference/pm_species.md)
for the underlying function.

## Examples

``` r
# All species in Yungas
pm_by_ecoregion("YUN")
#> # A tibble: 256 × 5
#>    order        family      genus      species        scientific_name      
#>    <chr>        <chr>       <chr>      <chr>          <chr>                
#>  1 Artiodactyla Cerevidae   Mazama     americana      Mazama americana     
#>  2 Artiodactyla Cerevidae   Mazama     chunyi         Mazama chunyi        
#>  3 Artiodactyla Cerevidae   Mazama     rufina         Mazama rufina        
#>  4 Artiodactyla Cerevidae   Odocoileus peruvianus     Odocoileus peruvianus
#>  5 Artiodactyla Cerevidae   Pudu       mephistophiles Pudu mephistophiles  
#>  6 Artiodactyla Tayassuidae Dicotyles  tajacu         Dicotyles tajacu     
#>  7 Artiodactyla Tayassuidae Tayassu    pecari         Tayassu pecari       
#>  8 Carnivora    Canidae     Atelocynus microtis       Atelocynus microtis  
#>  9 Carnivora    Canidae     Lycalopex  culpaeus       Lycalopex culpaeus   
#> 10 Carnivora    Canidae     Speothos   venaticus      Speothos venaticus   
#> # ℹ 246 more rows

# Endemic species in Selva Baja (SB)
pm_by_ecoregion("SB", endemic = TRUE)
#> # A tibble: 18 × 5
#>    order           family         genus         species       scientific_name   
#>    <chr>           <chr>          <chr>         <chr>         <chr>             
#>  1 Chiroptera      Phyllostomidae Hsunycteris   dashe         Hsunycteris dashe 
#>  2 Chiroptera      Phyllostomidae Micronycteris matses        Micronycteris mat…
#>  3 Didelphimorphia Didelphidae    Marmosa       andersoni     Marmosa andersoni 
#>  4 Didelphimorphia Didelphidae    Marmosops     soinii        Marmosops soinii  
#>  5 Didelphimorphia Didelphidae    Monodelphis   handleyi      Monodelphis handl…
#>  6 Didelphimorphia Didelphidae    Monodelphis   ronaldi       Monodelphis ronal…
#>  7 Primates        Cebidae        Aotus         miconax       Aotus miconax     
#>  8 Primates        Cebidae        Saguinus      illigeri      Saguinus illigeri 
#>  9 Primates        Cebidae        Saguinus      leucogenys    Saguinus leucogen…
#> 10 Primates        Cebidae        Saguinus      nigrifrons    Saguinus nigrifro…
#> 11 Primates        Pitheciidae    Callicebus    oenanthe      Callicebus oenant…
#> 12 Primates        Pitheciidae    Callicebus    urubambensis  Callicebus urubam…
#> 13 Primates        Pitheciidae    Pithecia      aequatorialis Pithecia aequator…
#> 14 Primates        Pitheciidae    Pithecia      isabela       Pithecia isabela  
#> 15 Rodentia        Cricetidae     Neusticomys   peruviensis   Neusticomys peruv…
#> 16 Rodentia        Cricetidae     Rhipidomys    modicus       Rhipidomys modicus
#> 17 Rodentia        Echimyidae     Toromys       albiventris   Toromys albiventr…
#> 18 Rodentia        Sciuridae      Hadrosciurus  sp. 3         Hadrosciurus sp. 3

# Rodents in Costa and Vertiente Occidental
pm_by_ecoregion(c("COS", "VOC"), order = "Rodentia")
#> # A tibble: 35 × 5
#>    order    family        genus      species     scientific_name       
#>    <chr>    <chr>         <chr>      <chr>       <chr>                 
#>  1 Rodentia Caviidae      Cavia      porcellus   Cavia porcellus       
#>  2 Rodentia Caviidae      Cavia      tschudii    Cavia tschudii        
#>  3 Rodentia Chinchillidae Lagidium   viscacia    Lagidium viscacia     
#>  4 Rodentia Cricetidae    Abrothrix  andina      Abrothrix andina      
#>  5 Rodentia Cricetidae    Aegialomys baroni      Aegialomys baroni     
#>  6 Rodentia Cricetidae    Aegialomys ica         Aegialomys ica        
#>  7 Rodentia Cricetidae    Aegialomys xanthaeolus Aegialomys xanthaeolus
#>  8 Rodentia Cricetidae    Akodon     juninensis  Akodon juninensis     
#>  9 Rodentia Cricetidae    Akodon     mollis      Akodon mollis         
#> 10 Rodentia Cricetidae    Akodon     sp. Villa   Akodon sp. Villa      
#> # ℹ 25 more rows

# Bats in multiple ecoregions
pm_by_ecoregion(c("YUN", "SB"), order = "Chiroptera")
#> # A tibble: 161 × 5
#>    order      family         genus          species      scientific_name        
#>    <chr>      <chr>          <chr>          <chr>        <chr>                  
#>  1 Chiroptera Emballonuridae Centronycteris centralis    Centronycteris central…
#>  2 Chiroptera Emballonuridae Centronycteris maximiliani  Centronycteris maximil…
#>  3 Chiroptera Emballonuridae Cormura        brevirostris Cormura brevirostris   
#>  4 Chiroptera Emballonuridae Cyttarops      alecto       Cyttarops alecto       
#>  5 Chiroptera Emballonuridae Diclidurus     albus        Diclidurus albus       
#>  6 Chiroptera Emballonuridae Diclidurus     isabella     Diclidurus isabella    
#>  7 Chiroptera Emballonuridae Peropteryx     kappleri     Peropteryx kappleri    
#>  8 Chiroptera Emballonuridae Peropteryx     leucoptera   Peropteryx leucoptera  
#>  9 Chiroptera Emballonuridae Peropteryx     macrotis     Peropteryx macrotis    
#> 10 Chiroptera Emballonuridae Peropteryx     pallidoptera Peropteryx pallidoptera
#> # ℹ 151 more rows
pm_by_ecoregion(c("YUN", "SB"), order = "Chiroptera",
endemic =  TRUE)
#> # A tibble: 4 × 5
#>   order      family         genus         species scientific_name     
#>   <chr>      <chr>          <chr>         <chr>   <chr>               
#> 1 Chiroptera Molossidae     Mormopterus   phrudus Mormopterus phrudus 
#> 2 Chiroptera Phyllostomidae Anoura        javieri Anoura javieri      
#> 3 Chiroptera Phyllostomidae Hsunycteris   dashe   Hsunycteris dashe   
#> 4 Chiroptera Phyllostomidae Micronycteris matses  Micronycteris matses
```
