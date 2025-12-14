# Exploring Mammal Diversity in Peru with perumammals

## Introduction

Peru is widely recognized as one of the world’s megadiverse countries,
ranking second in the Neotropics and the Americas for mammalian
diversity, with **573 species** across 13 orders (Pacheco et al., 2021).
The `perumammals` package provides direct access to this updated
taxonomic dataset, enabling researchers, students, and conservation
practitioners to explore, validate, and analyze mammals occurring in
Peru.

### Dataset Background

The updated mammalian checklist by Pacheco et al. (2021) compiles:

- **573 species**, **223 genera**, **51 families**, **13 orders**
- **87 endemic species** (15.2% of total)
- Presence across 9 ecoregions, from coastal deserts to Amazonian
  rainforests
- Continuous updates reflecting recent systematic revisions

The package adopts this taxonomic framework and includes tools for
validating species names and handling synonyms or misspelled entries via
fuzzy matching.

## Loading the Dataset

``` r
data("peru_mammals")

glimpse(peru_mammals)
#> Rows: 573
#> Columns: 12
#> $ pm_id                <chr> "M0542_EUB", "M0543_BAL", "M0544_BAL", "M0545_BAL…
#> $ order                <chr> "Artiodactyla", "Artiodactyla", "Artiodactyla", "…
#> $ family               <chr> "Balaenidae", "Balaenopteridae", "Balaenopteridae…
#> $ genus                <chr> "Eubalaena", "Balaenoptera", "Balaenoptera", "Bal…
#> $ species              <chr> "australis", "bonaerensis", "borealis", "edeni", …
#> $ scientific_name      <chr> "Eubalaena australis", "Balaenoptera bonaerensis"…
#> $ scientific_name_full <chr> "Eubalaena australis (Desmoulins, 1822)", "Balaen…
#> $ author               <chr> "(Desmoulins, 1822)", "Burmeister, 1867", "Lesson…
#> $ common_name          <chr> "Ballena franca del sur", "Ballena minke austral"…
#> $ endemic              <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
#> $ ecoregions           <chr> "OCE", "OCE", "OCE", "OCE", "OCE", "OCE", "OCE", …
#> $ reference            <chr> "Reyes 2009", "Reyes 2009", "Jefferson et al. 199…
```

## Taxonomic Diversity

### Orders and Species Richness

``` r
order_summary <- pm_list_orders() |> 
  dplyr::arrange(dplyr::desc(n_species)) |> 
  dplyr::mutate(percentage = round(n_species / sum(n_species) * 100, 1))

order_summary
#> # A tibble: 13 × 6
#>    order            n_families n_genera n_species n_endemic percentage
#>    <chr>                 <int>    <int>     <int>     <int>      <dbl>
#>  1 Rodentia                 11       67       194        56       33.9
#>  2 Chiroptera                8       64       189         9       33  
#>  3 Didelphimorphia           1       15        47        10        8.2
#>  4 Artiodactyla             10       31        46         0        8  
#>  5 Primates                  3       12        42         9        7.3
#>  6 Carnivora                 7       20        33         0        5.8
#>  7 Pilosa                    4        5         7         0        1.2
#>  8 Cingulata                 2        3         5         1        0.9
#>  9 Eulipotyphla              1        1         3         2        0.5
#> 10 Lagomorpha                1        1         2         0        0.3
#> 11 Paucituberculata          1        2         2         0        0.3
#> 12 Perissodactyla            1        1         2         0        0.3
#> 13 Sirenia                   1        1         1         0        0.2

ggplot(order_summary, 
       aes(x = reorder(order, n_species),
           y = n_species)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = n_species),
            hjust = -0.2, size = 3) +
  coord_flip() +
  labs(
    title = "Mammalian Diversity in Peru by Order",
    subtitle = "Based on Pacheco et al. (2021)",
    x = "Order",
    y = "Number of Species"
  ) +
  theme_minimal()
```

![.](vignette_files/figure-html/orders-diversity-1.png)

**Rodentia** (194 species) and **Chiroptera** (189 species) together
account for nearly **67%** of Peru’s mammalian diversity.

## Endemic Species

``` r
pm_list_endemic(include_rate = TRUE)
#> # A tibble: 14 × 7
#>    order        n_families n_genera n_endemic n_species endemic_rate endemic_pct
#>    <chr>             <int>    <int>     <int>     <int>        <dbl>       <dbl>
#>  1 Rodentia             11       67        56       194       0.289         28.9
#>  2 Chiroptera            8       64         9       189       0.0476         4.8
#>  3 Didelphimor…          1       15        10        47       0.213         21.3
#>  4 Artiodactyla         10       31         0        46       0              0  
#>  5 Primates              3       12         9        42       0.214         21.4
#>  6 Carnivora             7       20         0        33       0              0  
#>  7 Pilosa                4        5         0         7       0              0  
#>  8 Cingulata             2        3         1         5       0.2           20  
#>  9 Eulipotyphla          1        1         2         3       0.667         66.7
#> 10 Lagomorpha            1        1         0         2       0              0  
#> 11 Paucituberc…          1        2         0         2       0              0  
#> 12 Perissodact…          1        1         0         2       0              0  
#> 13 Sirenia               1        1         0         1       0              0  
#> 14 Total                16       43        87       573       0.152         15.2
```

**Rodentia** contains the largest number of endemic species (56),
representing **64.4%** of all mammalian endemics in Peru.

## Geographic Distribution

### Ecoregional Diversity

``` r

# Obtener datos de ecoregiones
ecoregion_diversity <- pm_list_ecoregions(include_endemic = TRUE)
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

# Preparar datos para el gráfico tipo waffle
waffle_data <- ecoregion_diversity |> 
  select(ecoregion_label, pct_endemic) |> 
  mutate(
    total_pct = paste0(round(pct_endemic, 1), "% endemic"),
    ecoregion_full = paste0(ecoregion_label, "\n", total_pct)
  ) |> 
  rowwise() |> 
  mutate(
    grid_data = list(
      expand.grid(x = 1:10, y = 1:10) |> 
        mutate(
          id = row_number(),
          type = ifelse(id <= round(pct_endemic), "Endemic", "Common")
        )
    )
  ) |> 
  unnest(grid_data)

# Crear el gráfico
ggplot(waffle_data, aes(x = x, y = y, fill = type)) +
  geom_tile(color = "white", linewidth = 0.4) +
  facet_wrap(~ecoregion_full, ncol = 2) +
  scale_fill_manual(
    name = NULL,
    values = c("Common" = "#CBD5E1", "Endemic" = "#E07A5F"),
    labels = c("Common species", "Endemic species")
  ) +
  coord_equal() +
  labs(
    title = "Mammal Endemism by Ecoregion in Peru",
    subtitle = "Each square represents 1% of species. The percentage indicates the proportion of endemic species"
  ) +
  theme_void() +
  theme(
    plot.title = element_text(
      face = "bold", 
      size = 16, 
      hjust = 0.5, 
      margin = margin(b = 5)
    ),
    plot.subtitle = element_text(
      hjust = 0.5, 
      size = 10, 
      color = "gray30", 
      margin = margin(b = 20)
    ),
    legend.position = "bottom",
    legend.text = element_text(size = 10),
    legend.key.size = unit(0.7, "cm"),
    legend.margin = margin(t = 15),
    strip.text = element_text(
      size = 9,
      face = "bold", 
      lineheight = 1.1,
      margin = margin(t = 5, b = 5)  # Aumentar márgenes
    ),
    strip.clip = "off",  # Permitir que el texto se extienda fuera del panel
    plot.background = element_rect(fill = "white", color = NA),
    panel.spacing.x = unit(2, "lines"),  # Aumentar espacio horizontal
    panel.spacing.y = unit(2.5, "lines"),  # Aumentar espacio vertical
    plot.margin = margin(15, 15, 15, 15)
  )
```

![.](vignette_files/figure-html/ecoregions-1.png)

The **Selva Baja** contains the highest species richness, while the
**Yungas** harbor the greatest number of endemic mammals.

## Name Validation and Fuzzy Matching

``` r
species_list <- c(
  "Tremarctos ornatos",
  "Leopardus pardalis",
  "Odocoileus virginanus",
  "Lagothrix flavicauda",
  "Alouatta seniculus",
  "Puma concolor"
)

validated <- validate_peru_mammals(
  species_list,
  quiet = TRUE
)

validated %>%
  select(Orig.Name, Matched.Name, Match.Level, valid_rank)
#>               Orig.Name         Matched.Name            Match.Level valid_rank
#> 1    Tremarctos ornatos   Tremarctos ornatus             Exact rank       TRUE
#> 2    Leopardus pardalis   Leopardus pardalis             Exact rank       TRUE
#> 3 Odocoileus virginanus           Odocoileus Matched at higher rank      FALSE
#> 4  Lagothrix flavicauda Lagothrix flavicauda             Exact rank       TRUE
#> 5    Alouatta seniculus   Alouatta seniculus             Exact rank       TRUE
#> 6         Puma concolor        Puma concolor             Exact rank       TRUE
```

The fuzzy matching tool corrects common misspellings and returns
standardized scientific names while preserving the original input.

## Practical Applications

### Conservation Assessment

``` r
endemic_primates <- peru_mammals %>%
  filter(order == "Primates", endemic == TRUE) %>%
  select(genus, species, common_name)

endemic_primates
#> # A tibble: 9 × 3
#>   genus      species       common_name                                
#>   <chr>      <chr>         <chr>                                      
#> 1 Lagothrix  flavicauda    Mono choro de cola amarilla                
#> 2 Aotus      miconax       Mono nocturno peruano, mono nocturno andino
#> 3 Saguinus   illigeri      Pichico pardo de Illiger                   
#> 4 Saguinus   leucogenys    Pichico andino                             
#> 5 Saguinus   nigrifrons    Pichico de frente negra                    
#> 6 Callicebus oenanthe      Tocón del río Mayo                         
#> 7 Callicebus urubambensis  Tocón del Urubamba                         
#> 8 Pithecia   aequatorialis Huapo ecuatorial                           
#> 9 Pithecia   isabela       Huapo de Isabel
```

### Research Data Cleaning

``` r
field_data <- data.frame(
  site = rep(c("Site_A", "Site_B", "Site_C"), each = 3),
  species = c(
    "Tremarctos ornatos", "Mazama rufina", "Odocoileus virginianus",
    "Leopardus pardalis", "Puma concolor", "Leopardus jacobita",
    "Lagothrix flavicauda", "Ateles belzebuth", "Alouatta seniculus"
  ),
  count = c(2, 1, 3, 1, 2, 1, 5, 3, 2)
)

cleaned_data <- field_data %>%
  left_join(
    validate_peru_mammals(field_data$species),
    by = c("species" = "Orig.Name")
  ) %>%
  select(site, original = species, validated = Matched.Name, count, Match.Level)

cleaned_data
#>     site               original            validated count
#> 1 Site_A     Tremarctos ornatos   Tremarctos ornatus     2
#> 2 Site_A          Mazama rufina        Mazama rufina     1
#> 3 Site_A Odocoileus virginianus           Odocoileus     3
#> 4 Site_B     Leopardus pardalis   Leopardus pardalis     1
#> 5 Site_B          Puma concolor        Puma concolor     2
#> 6 Site_B     Leopardus jacobita   Leopardus jacobita     1
#> 7 Site_C   Lagothrix flavicauda Lagothrix flavicauda     5
#> 8 Site_C       Ateles belzebuth     Ateles belzebuth     3
#> 9 Site_C     Alouatta seniculus   Alouatta seniculus     2
#>              Match.Level
#> 1             Exact rank
#> 2             Exact rank
#> 3 Matched at higher rank
#> 4             Exact rank
#> 5             Exact rank
#> 6             Exact rank
#> 7             Exact rank
#> 8             Exact rank
#> 9             Exact rank
```

------------------------------------------------------------------------
