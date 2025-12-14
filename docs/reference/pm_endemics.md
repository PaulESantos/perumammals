# List endemic mammal species of Peru

Returns endemic species from the Peruvian mammal backbone, with optional
filters by order, family and/or ecoregion.

## Usage

``` r
pm_endemics(order = NULL, family = NULL, genus = NULL, ecoregion = NULL)
```

## Arguments

- order:

  Optional character vector with one or more taxonomic orders to keep.
  If `NULL` (default), no filter is applied by order.

- family:

  Optional character vector with one or more families to keep. If `NULL`
  (default), no filter is applied by family.

- genus:

  Optional character vector with one or more genera to keep. If `NULL`
  (default), no filter is applied by genus.

- ecoregion:

  Optional character vector with one or more ecoregion codes (e.g.
  `"YUN"`, `"SB"`, `"COS"`). If supplied, only species occurring in at
  least one of the given ecoregions are returned.

## Value

A tibble with endemic species (subset of `peru_mammals`).

## Details

This is a convenience wrapper around
[`pm_species()`](https://paulesantos.github.io/perumammals/reference/pm_species.md)
with `endemic = TRUE`.

## Examples

``` r
# All endemic species
pm_endemics()
#> # A tibble: 87 × 5
#>    order      family           genus         species   scientific_name     
#>    <chr>      <chr>            <chr>         <chr>     <chr>               
#>  1 Chiroptera Molossidae       Eumops        chiribaya Eumops chiribaya    
#>  2 Chiroptera Molossidae       Mormopterus   phrudus   Mormopterus phrudus 
#>  3 Chiroptera Molossidae       Tomopeas      ravus     Tomopeas ravus      
#>  4 Chiroptera Phyllostomidae   Anoura        javieri   Anoura javieri      
#>  5 Chiroptera Phyllostomidae   Hsunycteris   dashe     Hsunycteris dashe   
#>  6 Chiroptera Phyllostomidae   Micronycteris matses    Micronycteris matses
#>  7 Chiroptera Vespertilionidae Eptesicus     mochica   Eptesicus mochica   
#>  8 Chiroptera Vespertilionidae Lasiurus      arequipae Lasiurus arequipae  
#>  9 Chiroptera Vespertilionidae Myotis        bakeri    Myotis bakeri       
#> 10 Cingulata  Dasypodidae      Dasypus       pilosus   Dasypus pilosus     
#> # ℹ 77 more rows

# Endemic rodents
pm_endemics(order = "Rodentia")
#> # A tibble: 56 × 5
#>    order    family        genus      species           scientific_name         
#>    <chr>    <chr>         <chr>      <chr>             <chr>                   
#>  1 Rodentia Abrocomidae   Cuscomys   ashaninka         Cuscomys ashaninka      
#>  2 Rodentia Abrocomidae   Cuscomys   oblativus         Cuscomys oblativus      
#>  3 Rodentia Chinchillidae Lagostomus crassus           Lagostomus crassus      
#>  4 Rodentia Cricetidae    Aegialomys ica               Aegialomys ica          
#>  5 Rodentia Cricetidae    Akodon     josemariarguedasi Akodon josemariarguedasi
#>  6 Rodentia Cricetidae    Akodon     juninensis        Akodon juninensis       
#>  7 Rodentia Cricetidae    Akodon     kotosh            Akodon kotosh           
#>  8 Rodentia Cricetidae    Akodon     orophilus         Akodon orophilus        
#>  9 Rodentia Cricetidae    Akodon     sp. Ancash        Akodon sp. Ancash       
#> 10 Rodentia Cricetidae    Akodon     sp. Villa         Akodon sp. Villa        
#> # ℹ 46 more rows

# Endemic species in Yungas (YUN)
pm_endemics(ecoregion = "YUN")
#> # A tibble: 48 × 5
#>    order           family         genus       species     scientific_name      
#>    <chr>           <chr>          <chr>       <chr>       <chr>                
#>  1 Chiroptera      Molossidae     Mormopterus phrudus     Mormopterus phrudus  
#>  2 Chiroptera      Phyllostomidae Anoura      javieri     Anoura javieri       
#>  3 Cingulata       Dasypodidae    Dasypus     pilosus     Dasypus pilosus      
#>  4 Didelphimorphia Didelphidae    Marmosa     andersoni   Marmosa andersoni    
#>  5 Didelphimorphia Didelphidae    Marmosa     parda       Marmosa parda        
#>  6 Didelphimorphia Didelphidae    Marmosops   juninensis  Marmosops juninensis 
#>  7 Didelphimorphia Didelphidae    Monodelphis gardeni     Monodelphis gardeni  
#>  8 Didelphimorphia Didelphidae    Philander   nigratus    Philander nigratus   
#>  9 Eulipotyphla    Soricidae      Cryptotis   evaristoi   Cryptotis evaristoi  
#> 10 Eulipotyphla    Soricidae      Cryptotis   peruviensis Cryptotis peruviensis
#> # ℹ 38 more rows

```
