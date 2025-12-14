# Getting Started with perumammals

## Introduction

The **perumammals** package provides tools for working with Peru’s
mammalian biodiversity. It includes a curated taxonomic backbone based
on Pacheco et al. (2021), the most comprehensive and up-to-date
synthesis of Peruvian mammal diversity.

This vignette will show you how to:

- Install and load the package
- Access the mammal species data
- Validate species names
- Identify endemic species
- Explore species by ecoregion
- Work with taxonomic families

## Installation

You can install the development version of perumammals from GitHub:

``` r
# Using pak (recommended)
pak::pak("PaulESantos/perumammals")

# Or using remotes
remotes::install_github("PaulESantos/perumammals")
```

## Loading the package

``` r
library(perumammals)
```

## Available dataset

The main dataset included in the package is the species list provided as
an appendix in Pacheco et al. (2021):

``` r
# Main species backbone
data(peru_mammals)
head(peru_mammals)
#>       pm_id        order          family        genus     species
#> 1 M0542_EUB Artiodactyla      Balaenidae    Eubalaena   australis
#> 2 M0543_BAL Artiodactyla Balaenopteridae Balaenoptera bonaerensis
#> 3 M0544_BAL Artiodactyla Balaenopteridae Balaenoptera    borealis
#> 4 M0545_BAL Artiodactyla Balaenopteridae Balaenoptera       edeni
#> 5 M0546_BAL Artiodactyla Balaenopteridae Balaenoptera    musculus
#> 6 M0547_BAL Artiodactyla Balaenopteridae Balaenoptera    physalus
#>            scientific_name                      scientific_name_full
#> 1      Eubalaena australis    Eubalaena australis (Desmoulins, 1822)
#> 2 Balaenoptera bonaerensis Balaenoptera bonaerensis Burmeister, 1867
#> 3    Balaenoptera borealis        Balaenoptera borealis Lesson, 1828
#> 4       Balaenoptera edeni         Balaenoptera edeni Anderson, 1879
#> 5    Balaenoptera musculus    Balaenoptera musculus (Linnaeus, 1758)
#> 6    Balaenoptera physalus    Balaenoptera physalus (Linnaeus, 1758)
#>               author                     common_name endemic ecoregions
#> 1 (Desmoulins, 1822)          Ballena franca del sur   FALSE        OCE
#> 2   Burmeister, 1867           Ballena minke austral   FALSE        OCE
#> 3       Lesson, 1828                  Ballena de Sei   FALSE        OCE
#> 4     Anderson, 1879                Ballena de Bryde   FALSE        OCE
#> 5   (Linnaeus, 1758)   Rorcual gigante, ballena azul   FALSE        OCE
#> 6   (Linnaeus, 1758) Rorcual común, ballena de aleta   FALSE        OCE
#>               reference
#> 1            Reyes 2009
#> 2            Reyes 2009
#> 3 Jefferson et al. 1993
#> 4            Reyes 2009
#> 5 Jefferson et al. 1993
#> 6 Jefferson et al. 1993
```

## Basic name validation

The core function
[`validate_peru_mammals()`](https://paulesantos.github.io/perumammals/reference/validate_peru_mammals.md)
checks if species names are present in the Peruvian mammal checklist:

``` r
# Single species
species_list <- c(
  "Puma concolor",           # Valid name
  "Tremarctos ornatus",      # Valid name  
  "Panthera onca",           # Valid name
  "Lycalopex sechurae",      # Valid name
  "Odocoileus virginianus",  # Valid name
  "Puma concolar"            # Misspelled
)

results <- validate_peru_mammals(species_list)
results
#>   sorter              Orig.Name       Matched.Name            Match.Level
#> 1      1          Puma concolor      Puma concolor             Exact rank
#> 2      2     Tremarctos ornatus Tremarctos ornatus             Exact rank
#> 3      3          Panthera onca      Panthera onca             Exact rank
#> 4      4     Lycalopex sechurae Lycalopex sechurae             Exact rank
#> 5      5 Odocoileus virginianus         Odocoileus Matched at higher rank
#> 6      6          Puma concolar      Puma concolor             Exact rank
#>   matched Rank Matched.Rank Comp.Rank valid_rank Orig.Genus Orig.Species Author
#> 1    TRUE    2            2      TRUE       TRUE       PUMA     CONCOLOR       
#> 2    TRUE    2            2      TRUE       TRUE TREMARCTOS      ORNATUS       
#> 3    TRUE    2            2      TRUE       TRUE   PANTHERA         ONCA       
#> 4    TRUE    2            2      TRUE       TRUE  LYCALOPEX     SECHURAE       
#> 5   FALSE    2            1     FALSE      FALSE ODOCOILEUS  VIRGINIANUS       
#> 6    TRUE    2            2      TRUE       TRUE       PUMA     CONCOLAR       
#>   Matched.Genus Matched.Species genus_dist species_dist    scientific_name
#> 1          PUMA        CONCOLOR          0            0      Puma concolor
#> 2    TREMARCTOS         ORNATUS          0            0 Tremarctos ornatus
#> 3      PANTHERA            ONCA          0            0      Panthera onca
#> 4     LYCALOPEX        SECHURAE          0            0 Lycalopex sechurae
#> 5    ODOCOILEUS            <NA>          0           NA               <NA>
#> 6          PUMA        CONCOLOR          0            1      Puma concolor
#>                       common_name  family     order endemic
#> 1        Puma, león, lluichu-puma Felidae Carnivora   FALSE
#> 2 Oso de anteojos, ucumari, ucucu Ursidae Carnivora   FALSE
#> 3      Jaguar, otorongo, uturuncu Felidae Carnivora   FALSE
#> 4                Zorro de Sechura Canidae Carnivora   FALSE
#> 5                            <NA>    <NA>      <NA>      NA
#> 6        Puma, león, lluichu-puma Felidae Carnivora   FALSE
```

## Quick checks with wrapper functions

### Check if species occur in Peru

``` r
# Returns TRUE/FALSE
is_peru_mammal(species_list)
#> [1] "Found in Peru" "Found in Peru" "Found in Peru" "Found in Peru"
#> [5] "Not found"     "Found in Peru"
```

### Identify endemic species

``` r
# Check which species are endemic to Peru
species_list <- c("Thomasomys notatus", "Tremarctos ornatus", "Eptesicus mochica", "Puma concolar")

is_endemic_peru(species_list)
#> [1] "Endemic to Peru" "Not endemic"     "Endemic to Peru" "Not endemic"

# Get endemic status as character
endemic_status <- ifelse(
  is_endemic_peru(species_list) == "Endemic to Peru",
  "Endémica",
  "No endémica"
)
endemic_status
#> [1] "Endémica"    "No endémica" "Endémica"    "No endémica"
```

### Check match quality

``` r
# Get match quality levels
match_quality_peru(species_list)
#> [1] "Exact" "Exact" "Exact" "Fuzzy"
```

## Working with data frames

The validation functions integrate smoothly with data frames and the
tidyverse:

``` r
library(dplyr)

# Create a sample dataset
my_data <- tibble(
  species = species_list,
  abundance = c(5, 3, 2, 8)
)

# Add validation results
my_data_validated <- my_data |> 
  mutate(
    in_peru = is_peru_mammal(species),
    endemic = is_endemic_peru(species),
    match_quality = match_quality_peru(species)
  )

my_data_validated
#> # A tibble: 4 × 5
#>   species            abundance in_peru       endemic         match_quality
#>   <chr>                  <dbl> <chr>         <chr>           <chr>        
#> 1 Thomasomys notatus         5 Found in Peru Endemic to Peru Exact        
#> 2 Tremarctos ornatus         3 Found in Peru Not endemic     Exact        
#> 3 Eptesicus mochica          2 Found in Peru Endemic to Peru Exact        
#> 4 Puma concolar              8 Found in Peru Not endemic     Fuzzy
```

## Exploring taxonomic families

### List all families

``` r
# Get summary of all families
families <- pm_list_families()
families
#> # A tibble: 51 × 5
#>    order        family          n_genera n_species n_endemic
#>    <chr>        <chr>              <int>     <int>     <int>
#>  1 Artiodactyla Balaenidae             1         1         0
#>  2 Artiodactyla Balaenopteridae        2         6         0
#>  3 Artiodactyla Camelidae              2         4         0
#>  4 Artiodactyla Cerevidae              5         8         0
#>  5 Artiodactyla Delphinidae           13        17         0
#>  6 Artiodactyla Iniidae                1         1         0
#>  7 Artiodactyla Phocoenidae            1         1         0
#>  8 Artiodactyla Physeteridae           2         3         0
#>  9 Artiodactyla Tayassuidae            2         2         0
#> 10 Artiodactyla Ziphiidae              2         3         0
#> # ℹ 41 more rows

# Families with highest species richness
families |> 
  arrange(desc(n_species)) |> 
  head(10)
#> # A tibble: 10 × 5
#>    order           family           n_genera n_species n_endemic
#>    <chr>           <chr>               <int>     <int>     <int>
#>  1 Rodentia        Cricetidae             40       137        47
#>  2 Chiroptera      Phyllostomidae         38       107         3
#>  3 Didelphimorphia Didelphidae            15        47        10
#>  4 Chiroptera      Molossidae              9        30         3
#>  5 Chiroptera      Vespertilionidae        4        25         3
#>  6 Primates        Cebidae                 6        23         4
#>  7 Rodentia        Echimyidae              8        20         3
#>  8 Artiodactyla    Delphinidae            13        17         0
#>  9 Chiroptera      Emballonuridae          7        14         0
#> 10 Primates        Pitheciidae             3        12         4
```

### Filter by family

``` r
# Get summary for bat species (Phyllostomidae)
pm_list_families() |> 
  filter(family == "Phyllostomidae")
#> # A tibble: 1 × 5
#>   order      family         n_genera n_species n_endemic
#>   <chr>      <chr>             <int>     <int>     <int>
#> 1 Chiroptera Phyllostomidae       38       107         3

# Get species list for a specific family
 pm_species(family = "Phyllostomidae")
#> # A tibble: 107 × 5
#>    order      family         genus    species       scientific_name       
#>    <chr>      <chr>          <chr>    <chr>         <chr>                 
#>  1 Chiroptera Phyllostomidae Anoura   aequatoris    Anoura aequatoris     
#>  2 Chiroptera Phyllostomidae Anoura   caudifer      Anoura caudifer       
#>  3 Chiroptera Phyllostomidae Anoura   cultrata      Anoura cultrata       
#>  4 Chiroptera Phyllostomidae Anoura   fistulata     Anoura fistulata      
#>  5 Chiroptera Phyllostomidae Anoura   geoffroyi     Anoura geoffroyi      
#>  6 Chiroptera Phyllostomidae Anoura   javieri       Anoura javieri        
#>  7 Chiroptera Phyllostomidae Anoura   latidens      Anoura latidens       
#>  8 Chiroptera Phyllostomidae Anoura   peruana       Anoura peruana        
#>  9 Chiroptera Phyllostomidae Artibeus aequatorialis Artibeus aequatorialis
#> 10 Chiroptera Phyllostomidae Artibeus anderseni     Artibeus anderseni    
#> # ℹ 97 more rows
```

## Analyzing endemic species

### Get endemic species list

``` r
# List all endemic species
endemic_mammals <- pm_species(endemic = TRUE)
endemic_mammals
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

# Endemic species by family
endemic_mammals |> 
  group_by(family) |> 
  summarise(n_species = n_distinct(scientific_name)) |> 
  arrange(desc(n_species)) |> 
  head(10)
#> # A tibble: 10 × 2
#>    family           n_species
#>    <chr>                <int>
#>  1 Cricetidae              47
#>  2 Didelphidae             10
#>  3 Cebidae                  4
#>  4 Pitheciidae              4
#>  5 Echimyidae               3
#>  6 Molossidae               3
#>  7 Phyllostomidae           3
#>  8 Vespertilionidae         3
#>  9 Abrocomidae              2
#> 10 Soricidae                2
```

### Endemic species by ecoregion

``` r
# Compare endemism across ecoregions
endemic_rate <- pm_list_ecoregions(include_endemic = TRUE)
#> ── Peruvian Mammal Ecoregions (Brack-Egg, 1986) ────────────────────────────────
#> ℹ Number of ecoregions: 10
#> ℹ Total mammal species in Peru: 573
#> 
#> Ecoregions by species richness:
#> 
#> SB - Selva Baja: 320 species (55.8%), 18 endemic (5.6%)
#> YUN - Yungas: 256 species (44.7%), 48 endemic (18.8%)
#> SP - Sabana de Palmera: 83 species (14.5%), 0 endemic (0%)
#> BSE - Bosque Seco Ecuatorial: 81 species (14.1%), 4 endemic (4.9%)
#> VOC - Vertiente Occidental: 72 species (12.6%), 15 endemic (20.8%)
#> PUN - Puna: 71 species (12.4%), 14 endemic (19.7%)
#> BPP - Bosque Pluvial del Pacífico: 69 species (12%), 0 endemic (0%)
#> COS - Costa: 66 species (11.5%), 16 endemic (24.2%)
#> OCE - Oceánica: 30 species (5.2%), 0 endemic (0%)
#> PAR - Páramo: 26 species (4.5%), 4 endemic (15.4%)
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> ────────────────────────────────────────────────────────────────────────────────
endemic_rate
#> # A tibble: 10 × 6
#>    ecoregion_code ecoregion_label    n_species n_endemic pct_species pct_endemic
#>    <chr>          <chr>                  <int>     <int>       <dbl>       <dbl>
#>  1 SB             Selva Baja               320        18        55.8         5.6
#>  2 YUN            Yungas                   256        48        44.7        18.8
#>  3 SP             Sabana de Palmera         83         0        14.5         0  
#>  4 BSE            Bosque Seco Ecuat…        81         4        14.1         4.9
#>  5 VOC            Vertiente Occiden…        72        15        12.6        20.8
#>  6 PUN            Puna                      71        14        12.4        19.7
#>  7 BPP            Bosque Pluvial de…        69         0        12           0  
#>  8 COS            Costa                     66        16        11.5        24.2
#>  9 OCE            Oceánica                  30         0         5.2         0  
#> 10 PAR            Páramo                    26         4         4.5        15.4

# Endemic species in Yungas
pm_by_ecoregion(ecoregion = "YUN", endemic = TRUE)
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

## Ecoregion analysis

### Species distribution across ecoregions

``` r

# Count species per ecoregion
pm_list_ecoregions()
#> ── Peruvian Mammal Ecoregions (Brack-Egg, 1986) ────────────────────────────────
#> ℹ Number of ecoregions: 10
#> ℹ Total mammal species in Peru: 573
#> 
#> Ecoregions by species richness:
#> 
#> SB - Selva Baja: 320 species (55.8%)
#> YUN - Yungas: 256 species (44.7%)
#> SP - Sabana de Palmera: 83 species (14.5%)
#> BSE - Bosque Seco Ecuatorial: 81 species (14.1%)
#> VOC - Vertiente Occidental: 72 species (12.6%)
#> PUN - Puna: 71 species (12.4%)
#> BPP - Bosque Pluvial del Pacífico: 69 species (12%)
#> COS - Costa: 66 species (11.5%)
#> OCE - Oceánica: 30 species (5.2%)
#> PAR - Páramo: 26 species (4.5%)
#> 
#> Use pm_by_ecoregion() to filter species by ecoregion
#> Use include_endemic = TRUE to see endemic species counts
#> ────────────────────────────────────────────────────────────────────────────────
```

### Species with widest distribution

``` r
# Species occurring in most ecoregions
peru_mammals_ecoregions |> 
  count(scientific_name, name = "n_ecoregions") |> 
  arrange(desc(n_ecoregions)) |> 
  top_n(10)
#> Selecting by n_ecoregions
#> # A tibble: 12 × 2
#>    scientific_name          n_ecoregions
#>    <chr>                           <int>
#>  1 Puma concolor                       8
#>  2 Desmodus rotundus                   7
#>  3 Molossus molossus                   7
#>  4 Odocoileus peruvianus               7
#>  5 Conepatus semistriatus              6
#>  6 Lasiurus blossevillii               6
#>  7 Leopardus pardalis                  6
#>  8 Mazama americana                    6
#>  9 Myotis keaysi                       6
#> 10 Myotis nigricans                    6
#> 11 Rhipidomys leucodactylus            6
#> 12 Tamandua tetradactyla               6
```

## Practical examples

### Example 1: Data cleaning workflow

``` r
# Messy species list from field observations
field_data <- tibble(
  location = c("Manu", "Tambopata", "Paracas", "Cusco", "Lima"),
  species_name = c(
    "puma concolor",           # lowercase
    "Tremarctos ornatu",       # missing 's'
    "Otaria flavescens",       # marine mammal
    "Lycalopex sechure",       # missing 'ae'
    "Unknown bat"              # invalid
  ),
  count = c(2, 1, 15, 3, 8)
)

# Validate and clean
field_data_clean <- field_data %>%
  mutate(
    # Validate names
    validated = validate_peru_mammals(species_name)$Matched.Name,
    # Check if in Peru
    in_checklist = is_peru_mammal(species_name),
    # Get match quality
    quality = match_quality_peru(species_name)
  )

field_data_clean
#> # A tibble: 5 × 6
#>   location  species_name      count validated          in_checklist  quality  
#>   <chr>     <chr>             <dbl> <chr>              <chr>         <chr>    
#> 1 Manu      puma concolor         2 Puma concolor      Found in Peru Exact    
#> 2 Tambopata Tremarctos ornatu     1 Tremarctos ornatus Found in Peru Fuzzy    
#> 3 Paracas   Otaria flavescens    15 Otaria flavescens  Found in Peru Exact    
#> 4 Cusco     Lycalopex sechure     3 Lycalopex sechurae Found in Peru Fuzzy    
#> 5 Lima      Unknown bat           8 ---                Not found     Not found
```

### Example 2: Endemic species summary

``` r
# Get all endemic mammals
endemic_species <- pm_species(endemic = TRUE)
endemic_species
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
# Total endemic species by order
endemic_species |> 
  count(order, name = "n_endemic") |> 
  arrange(desc(n_endemic))
#> # A tibble: 6 × 2
#>   order           n_endemic
#>   <chr>               <int>
#> 1 Rodentia               56
#> 2 Didelphimorphia        10
#> 3 Chiroptera              9
#> 4 Primates                9
#> 5 Eulipotyphla            2
#> 6 Cingulata               1
```

### Example 3: Ecoregion-specific analysis

``` r
# Focus on Selva Baja (Amazon lowlands)

selva_baja_species <- pm_by_ecoregion(ecoregion = "SB")
selva_baja_species
#> # A tibble: 320 × 5
#>    order        family      genus       species     scientific_name       
#>    <chr>        <chr>       <chr>       <chr>       <chr>                 
#>  1 Artiodactyla Cerevidae   Blastocerus dichotomus  Blastocerus dichotomus
#>  2 Artiodactyla Cerevidae   Mazama      americana   Mazama americana      
#>  3 Artiodactyla Cerevidae   Mazama      nemorivaga  Mazama nemorivaga     
#>  4 Artiodactyla Cerevidae   Odocoileus  peruvianus  Odocoileus peruvianus 
#>  5 Artiodactyla Delphinidae Sotalia     fluviatilis Sotalia fluviatilis   
#>  6 Artiodactyla Iniidae     Inia        geoffrensis Inia geoffrensis      
#>  7 Artiodactyla Tayassuidae Dicotyles   tajacu      Dicotyles tajacu      
#>  8 Artiodactyla Tayassuidae Tayassu     pecari      Tayassu pecari        
#>  9 Carnivora    Canidae     Atelocynus  microtis    Atelocynus microtis   
#> 10 Carnivora    Canidae     Speothos    venaticus   Speothos venaticus    
#> # ℹ 310 more rows

# Endemic species in Selva Baja
pm_by_ecoregion(ecoregion = "SB", endemic = TRUE) |> 
  count(family, name = "n_species") |> 
  arrange(desc(n_species))
#> # A tibble: 7 × 2
#>   family         n_species
#>   <chr>              <int>
#> 1 Cebidae                4
#> 2 Didelphidae            4
#> 3 Pitheciidae            4
#> 4 Cricetidae             2
#> 5 Phyllostomidae         2
#> 6 Echimyidae             1
#> 7 Sciuridae              1
```

## Advanced: Fuzzy matching details

The validation algorithm uses a hierarchical matching approach:

1.  **Exact match**: Perfect match with accepted name
2.  **Genus + fuzzy species**: Genus exact, species with small
    differences
3.  **Fuzzy genus + exact species**: Species exact, genus with small
    differences
4.  **Double fuzzy**: Both genus and species with small differences
5.  **No match**: No acceptable match found

``` r
# Examples of different match levels
test_names <- c(
  "Puma concolor",              # Level: Exact
  "Tremarctos ornatus Cuvier",  
  "Lycalopex sechure",          # Level: Genus + fuzzy species
  "Lyclopex sechurae",          # Level: Fuzzy genus + exact species
  "Panthera onca"               # Level: Exact
)

validate_peru_mammals(test_names) |> 
  select(Orig.Name, Matched.Name, matched)
#> Warning: Found 1 name(s) with 3+ elements (likely author info or infraspecies).
#> The peru_mammals database only accepts binomial names (Genus species).
#> Please provide names WITHOUT author information or infraspecific taxa.
#> 
#> Invalid names:
#>   - 'Tremarctos ornatus cuvier'
#> 
#> These names have been marked as NOT FOUND.
#>                   Orig.Name       Matched.Name matched
#> 1             Puma concolor      Puma concolor    TRUE
#> 2 Tremarctos ornatus cuvier                ---   FALSE
#> 3         Lycalopex sechure Lycalopex sechurae    TRUE
#> 4         Lyclopex sechurae Lycalopex sechurae    TRUE
#> 5             Panthera onca      Panthera onca    TRUE
```

## Citation

When using this package, please cite both the package and the source
data:

``` r
citation("perumammals")
```

**Package citation:** Santos Andrade, P. E., & Gonzales Guillen, F. N.
(2025). perumammals: Taxonomic Backbone and Name Validation Tools for
Mammals of Peru.

**Data source:** Pacheco, V., Cadenillas, R., Zeballos, H., Hurtado, C.
M., Ruelas, D., & Pari, A. (2021). Lista actualizada de la diversidad de
los mamíferos del Perú y una propuesta para su actualización. *Revista
Peruana de Biología*, 28(special issue), e21019.
<https://doi.org/10.15381/rpb.v28i4.21019>
