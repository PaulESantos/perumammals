# perumammals

# perumammals ![](reference/figures/logo.png)

Taxonomic backbone and name validation tools for the mammals of Peru.

------------------------------------------------------------------------

## Overview

**perumammals** provides a curated, standardized and programmatically
accessible version of the mammal diversity of Peru as compiled by
**Pacheco et al. (2021)**: *“Lista actualizada de la diversidad de los
mamíferos del Perú y una propuesta para su actualización”.*

This publication represents the most up-to-date and comprehensive
synthesis of Peruvian mammal diversity, integrating taxonomic revisions,
biogeographic information, distributional updates and the evaluation of
endemic taxa.

The package includes:

- A **backbone dataset of 573 mammal species** known for Peru
  (terrestrial, arboreal, aquatic and marine).
- **Taxonomic structure** (Order, Family, Genus, Species, authorship).
- **Endemism** information.
- **Ecoregional occurrence**, following the scheme used by Pacheco et
  al. (2021).
- **References and taxonomic notes** as listed in the source document.
- Data structures ready for **name validation**, **biodiversity
  assessments**, **environmental studies**, **species filtering**, and
  **ecoregional analyses**.

The goal of the package is not to replace authoritative taxonomic
databases, but to provide a **stable, Peruvian-focused backbone** and a
set of **reproducible tools** that can be used in ecological,
environmental, biogeographic and conservation workflows.

------------------------------------------------------------------------

## Context from Pacheco et al. (2021)

The backbone included in **perumammals** is derived directly from the
annex of  
Pacheco et al. (2021), who synthesized decades of Peruvian mammalogy
work. Key highlights from the publication include:

### Mammalian Diversity

- **573 species** documented for Peru.  
- Representing **223 genera**, **51 families**, and **13 orders**.
- Includes both **terrestrial and marine** mammals.
- Peru ranks among the most mammal-diverse countries worldwide.

### Endemism

- **87 species** are recognized as **endemic to Peru**, emphasizing the
  country’s importance for global mammalian conservation.

- Several endemics are narrow-ranged and associated with specific
  ecoregions such as the Yungas, Páramo, and Puna.

### Biogeographic Ecoregions

The article assigns each species to one or more Peruvian ecoregions
using the classification widely used in biogeography and conservation
planning:

| Code | Ecoregion                   |
|------|-----------------------------|
| OCE  | Oceánica                    |
| BPP  | Bosque Pluvial del Pacífico |
| BSE  | Bosque Seco Ecuatorial      |
| COS  | Costa                       |
| VOC  | Vertiente Occidental        |
| PAR  | Páramo                      |
| PUN  | Puna                        |
| YUN  | Yungas                      |
| SB   | Selva Baja                  |
| SP   | Sabana de Palmera           |

These codes are incorporated into the package as both:

- part of the main species table, and  
- a dedicated long-format table for analytical workflows.

### Taxonomic Notes and Updates

Pacheco et al. (2021) incorporate:

- New species records and recent taxonomic revisions.
- Updates resulting from molecular phylogenetics and integrative
  taxonomy.
- Clarifications regarding problematic or doubtful taxa.
- Contextual notes on species with uncertain distributions.

------------------------------------------------------------------------

## What the Package Provides

Although `perumammals` contains functions for name validation and
exploration.

The package includes four main datasets:

### **1. `peru_mammals`**

A species-level backbone with:

- Taxonomy (Order, Family, Genus, Species).
- Authorship information.
- Common names when available.
- Endemic status.
- Ecoregion assignments.
- Bibliographic notes.

### **2. `peru_mammals_ecoregions`**

A long-format dataset listing species–ecoregion pairs, ideal for:

- diversity summaries,
- mapping,
- ecoregional filters,
- conservation prioritization.

### **3. `peru_mammals_ecoregions_meta`**

Metadata describing the ecoregion codes used across the package.

### **4. `peru_mammals_backbone`**

Metadata describing:

- the source (Pacheco et al. 2021),
- year of publication,
- number of species,
- date of dataset creation during package build.

These datasets make `perumammals` a lightweight but powerful reference
for any workflow requiring curated and Peruvian-focused mammal
information.

------------------------------------------------------------------------

## Installation

``` r
# Development version from GitHub
# Using pak (recommended)
pak::pak("PaulESantos/perumammals")

# Or using remotes
remotes::install_github("PaulESantos/perumammals")
```

## Citation

If you use this package, please cite:

The package:

``` r
Santos Andrade, P. E. (2025). perumammals: Taxonomic Backbone and Name Validation Tools for Mammals of Peru.
R package version 0.0.0.1.
https://paulesantos.github.io/perumammals/

And the original taxonomic source:

Pacheco, V., Cadenillas, R., Zeballos, H., Hurtado, C. M., Ruelas, D., & Pari, A. (2021). Lista actualizada de la diversidad de los mamíferos del Perú y una propuesta para su actualización.
```
