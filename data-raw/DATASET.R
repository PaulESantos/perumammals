# data-raw/peru_mammals.R
# Construye los objetos de datos internos del paquete 'perumammals'
# a partir del anexo de Pacheco et al. (2021).

library(readxl)
library(dplyr)
library(stringr)
library(tidyr)
library(tibble)
library(usethis)

# -------------------------------------------------------------------------
# 1. Leer datos crudos desde el Excel
# -------------------------------------------------------------------------

raw_path <- "data-raw/anexo_1_pacheco_etal_2021.xlsx"

mam_raw <- readxl::read_excel(raw_path)

# Esperamos columnas:
# id, orden, familia, genero, epitheto, author,
# scientific_name, nombre_cientifico, nombre_comun,
# ecorregion, referencia, endemico

# -------------------------------------------------------------------------
# 2. Crear identificador interno pm_id
#    Formato sugerido: Mxxxx_GEN
# -------------------------------------------------------------------------
mam_raw |>  names()

peru_mammals <- mam_raw |>
  # Renombrar columnas a nombres en inglés y sin tildes
  dplyr::rename(
    order              = orden,
    family             = familia,
    genus              = genero,
    species            = epitheto,
    scientific_name    = scientific_name,
    scientific_name_full = nombre_cientifico,
    common_name        = nombre_comun,
    ecoregions_raw     = ecorregion,
    reference          = referencia,
    endemic_raw        = endemico
  ) |>
  dplyr::mutate(
    # pm_id basado en id numérico + 3 primeras letras del género
    genus_abbr = stringr::str_to_upper(stringr::str_sub(genus, 1L, 3L)),
    pm_id = sprintf("M%04d_%s", as.integer(id), genus_abbr),

    # Endemismo como lógico: cualquier valor no-NA = TRUE
    endemic = !is.na(endemic_raw),

    # Ecorregiones tal como aparecen en el anexo (string)
    ecoregions = ecoregions_raw
  ) |>
  # Seleccionar y ordenar columnas finales
  dplyr::select(
    pm_id,
    order,
    family,
    genus,
    species,
    scientific_name,
    scientific_name_full,
    author,
    common_name,
    endemic,
    ecoregions,
    reference
  ) |>
  dplyr::arrange(order, family, genus, species)

peru_mammals
mam_raw
# -------------------------------------------------------------------------
# 3. Tabla larga especie–ecorregión: peru_mammals_ecoregions
# -------------------------------------------------------------------------

peru_mammals_ecoregions <-
  peru_mammals |>
  dplyr::select(pm_id, scientific_name, ecoregions) |>
  tidyr::separate_longer_delim(ecoregions, ", ") |>
  # Separar por comas: "YUN, SB, SP" -> varias filas
  dplyr::mutate(
    ecoregions = str_trim(ecoregions),
    ecoregion_code = na_if(ecoregions, "")
  ) |>
  dplyr::filter(!is.na(ecoregion_code)) |>
  dplyr::select(pm_id, scientific_name, ecoregion_code) |>
  dplyr::distinct() |>
  dplyr::arrange(ecoregion_code, scientific_name)

# -------------------------------------------------------------------------
# 4. Metadatos de ecorregiones: peru_mammals_ecoregions_meta
#    (por ahora sólo códigos; etiquetas se pueden completar luego)
# -------------------------------------------------------------------------

ecoregion_labels <- tibble::tibble(
  ecoregion_code = c("OCE", "BPP", "BSE", "COS", "VOC", "PAR", "PUN", "YUN", "SB", "SP"),
  ecoregion_label = c(
    "Oceánica",
    "Bosque Pluvial del Pacífico",
    "Bosque Seco Ecuatorial",
    "Costa",
    "Vertiente Occidental",
    "Páramo",
    "Puna",
    "Yungas",
    "Selva Baja",
    "Sabana de Palmera"
  )
)

peru_mammals_ecoregions_meta <-
  peru_mammals_ecoregions |>
  dplyr::distinct(ecoregion_code) |>
  dplyr::arrange(ecoregion_code) |>
  dplyr::left_join(ecoregion_labels, by = "ecoregion_code")
peru_mammals_ecoregions_meta
peru_mammals_ecoregions
# -------------------------------------------------------------------------
# 5. Info resumen del backbone: peru_mammals_backbone
# -------------------------------------------------------------------------

peru_mammals_backbone <- tibble(
  source = "Pacheco et al. (2021) Lista actualizada de la diversidad de los mamíferos del Perú y una propuesta para su actualización",
  source_year = 2021L,
  n_species = nrow(peru_mammals),
  created_at = Sys.Date()
)
peru_mammals_backbone
# -------------------------------------------------------------------------
# 6. Guardar datos en el paquete
# -------------------------------------------------------------------------

usethis::use_data(
  peru_mammals,
  peru_mammals_ecoregions,
  peru_mammals_ecoregions_meta,
  peru_mammals_backbone,
  overwrite = TRUE
)

