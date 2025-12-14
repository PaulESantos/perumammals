# Filter mammal species from the Peruvian backbone

Convenience wrapper around `peru_mammals` to subset species by taxonomic
group, endemism and/or ecoregion.

## Usage

``` r
pm_species(
  order = NULL,
  family = NULL,
  genus = NULL,
  endemic = NULL,
  ecoregion = NULL
)
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

- endemic:

  Optional logical. If `TRUE`, only endemic species are returned; if
  `FALSE`, only non-endemic species are returned; if `NULL` (default),
  no filter is applied by endemism.

- ecoregion:

  Optional character vector with one or more ecoregion codes (e.g.
  `"YUN"`, `"SB"`, `"COS"`). If supplied, only species occurring in at
  least one of the given ecoregions are returned.

## Value

A tibble with a subset of rows from `peru_mammals`.

## Examples

``` r
# All species
pm_species()
#> # A tibble: 573 × 5
#>    order        family          genus        species      scientific_name       
#>    <chr>        <chr>           <chr>        <chr>        <chr>                 
#>  1 Artiodactyla Balaenidae      Eubalaena    australis    Eubalaena australis   
#>  2 Artiodactyla Balaenopteridae Balaenoptera bonaerensis  Balaenoptera bonaeren…
#>  3 Artiodactyla Balaenopteridae Balaenoptera borealis     Balaenoptera borealis 
#>  4 Artiodactyla Balaenopteridae Balaenoptera edeni        Balaenoptera edeni    
#>  5 Artiodactyla Balaenopteridae Balaenoptera musculus     Balaenoptera musculus 
#>  6 Artiodactyla Balaenopteridae Balaenoptera physalus     Balaenoptera physalus 
#>  7 Artiodactyla Balaenopteridae Megaptera    novaeangliae Megaptera novaeangliae
#>  8 Artiodactyla Camelidae       Lama         glama        Lama glama            
#>  9 Artiodactyla Camelidae       Lama         guanicoe     Lama guanicoe         
#> 10 Artiodactyla Camelidae       Vicugna      pacos        Vicugna pacos         
#> # ℹ 563 more rows

# Only Rodentia
pm_species(order = "Rodentia")
#> # A tibble: 194 × 5
#>    order    family        genus        species      scientific_name          
#>    <chr>    <chr>         <chr>        <chr>        <chr>                    
#>  1 Rodentia Abrocomidae   Abrocoma     cinerea      Abrocoma cinerea         
#>  2 Rodentia Abrocomidae   Cuscomys     ashaninka    Cuscomys ashaninka       
#>  3 Rodentia Abrocomidae   Cuscomys     oblativus    Cuscomys oblativus       
#>  4 Rodentia Caviidae      Cavia        aperea       Cavia aperea             
#>  5 Rodentia Caviidae      Cavia        porcellus    Cavia porcellus          
#>  6 Rodentia Caviidae      Cavia        tschudii     Cavia tschudii           
#>  7 Rodentia Caviidae      Galea        musteloides  Galea musteloides        
#>  8 Rodentia Caviidae      Hydrochoerus hydrochaeris Hydrochoerus hydrochaeris
#>  9 Rodentia Caviidae      Microcavia   niata        Microcavia niata         
#> 10 Rodentia Chinchillidae Chinchilla   chinchilla   Chinchilla chinchilla    
#> # ℹ 184 more rows

# Endemic bats (Chiroptera)
pm_species(order = "Chiroptera", endemic = TRUE)
#> # A tibble: 9 × 5
#>   order      family           genus         species   scientific_name     
#>   <chr>      <chr>            <chr>         <chr>     <chr>               
#> 1 Chiroptera Molossidae       Eumops        chiribaya Eumops chiribaya    
#> 2 Chiroptera Molossidae       Mormopterus   phrudus   Mormopterus phrudus 
#> 3 Chiroptera Molossidae       Tomopeas      ravus     Tomopeas ravus      
#> 4 Chiroptera Phyllostomidae   Anoura        javieri   Anoura javieri      
#> 5 Chiroptera Phyllostomidae   Hsunycteris   dashe     Hsunycteris dashe   
#> 6 Chiroptera Phyllostomidae   Micronycteris matses    Micronycteris matses
#> 7 Chiroptera Vespertilionidae Eptesicus     mochica   Eptesicus mochica   
#> 8 Chiroptera Vespertilionidae Lasiurus      arequipae Lasiurus arequipae  
#> 9 Chiroptera Vespertilionidae Myotis        bakeri    Myotis bakeri       

# Species present in Yungas (YUN) and Selva Baja (SB)
pm_species(ecoregion = c("YUN", "SB"))
#> # A tibble: 430 × 5
#>    order        family      genus       species        scientific_name       
#>    <chr>        <chr>       <chr>       <chr>          <chr>                 
#>  1 Artiodactyla Cerevidae   Blastocerus dichotomus     Blastocerus dichotomus
#>  2 Artiodactyla Cerevidae   Mazama      americana      Mazama americana      
#>  3 Artiodactyla Cerevidae   Mazama      chunyi         Mazama chunyi         
#>  4 Artiodactyla Cerevidae   Mazama      nemorivaga     Mazama nemorivaga     
#>  5 Artiodactyla Cerevidae   Mazama      rufina         Mazama rufina         
#>  6 Artiodactyla Cerevidae   Odocoileus  peruvianus     Odocoileus peruvianus 
#>  7 Artiodactyla Cerevidae   Pudu        mephistophiles Pudu mephistophiles   
#>  8 Artiodactyla Delphinidae Sotalia     fluviatilis    Sotalia fluviatilis   
#>  9 Artiodactyla Iniidae     Inia        geoffrensis    Inia geoffrensis      
#> 10 Artiodactyla Tayassuidae Dicotyles   tajacu         Dicotyles tajacu      
#> # ℹ 420 more rows

```
