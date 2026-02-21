# -------------------------------------------------------------------------
# Helpers for attach message (perumammals-style, tidyverse-inspired)
# -------------------------------------------------------------------------

perumammals_pkg_version <- function() {
  # Prefer packageVersion(): robust and does not depend on DESCRIPTION parsing
  as.character(utils::packageVersion("perumammals"))
}

perumammals_backbone_summary <- function(backbone) {
  # backbone expected to have: source_year, n_species
  year <- backbone$source_year %||% NA
  nsp  <- backbone$n_species %||% NA

  paste0(
    "Taxonomic backbone: Pacheco et al. (", year, ") | ",
    "Species: ", nsp
  )
}

perumammals_attach_message <- function(backbone) {
  # Build a single message (like tidyverse) to print once
  header <- cli::rule(
    left  = cli::style_bold("Attaching perumammals"),
    right = paste0("perumammals ", perumammals_pkg_version())
  )

  lines <- c(
    paste0(cli::col_green(cli::symbol$tick), " ", cli::col_grey(perumammals_backbone_summary(backbone))),
    paste0(cli::col_blue(cli::symbol$info), " ", cli::col_grey("Use pm_backbone_info() for full citation and details"))
  )

  paste0(header, "\n", paste(lines, collapse = "\n"))
}

# A tiny %||% helper (avoid importing rlang just for this)
`%||%` <- function(x, y) if (is.null(x)) y else x

# -------------------------------------------------------------------------
# .onAttach hook
# -------------------------------------------------------------------------

.onAttach <- function(libname, pkgname) {
  backbone <- peru_mammals_backbone

  # Print one cohesive startup message
  packageStartupMessage(perumammals_attach_message(backbone))

  # Optional: check for backbone update (quiet and only when it makes sense)
  verbose <- isTRUE(getOption("perumammals.verbose"))
  if (interactive() && verbose) {
    check_result <- tryCatch(
      check_backbone_update(backbone$source_year),
      error = function(e) NULL
    )

    if (!is.null(check_result) && isTRUE(check_result$update_available)) {
      packageStartupMessage(
        cli::col_yellow(
          paste0(
            cli::symbol$warning, " ",
            "A newer version of the mammal checklist may be available. ",
            "See doi:10.15381/rpb.v28i4.21019"
          )
        )
      )
    }
  }

  invisible()
}

# -------------------------------------------------------------------------
# .onLoad hook (tu versión está bien; solo lo dejo casi igual)
# -------------------------------------------------------------------------

.onLoad <- function(libname, pkgname) {
  opt <- options()

  opt_perumammals <- list(
    perumammals.show_progress = TRUE,
    perumammals.verbose = FALSE
  )

  to_set <- !(names(opt_perumammals) %in% names(opt))
  if (any(to_set)) options(opt_perumammals[to_set])

  invisible()
}

# -------------------------------------------------------------------------
# Progress bar helper (igual que el tuyo)
# -------------------------------------------------------------------------

show_progress <- function() {
  isTRUE(getOption("perumammals.show_progress")) && interactive()
}

# -------------------------------------------------------------------------

#' Check if taxonomic backbone needs updating
#'
#' Checks whether a newer version of the Pacheco et al. mammal checklist
#' might be available based on the publication year.
#'
#' @param backbone_year Numeric or character year of the current backbone.
#'
#' @return A list with components:
#'   \itemize{
#'     \item \code{update_available} – logical indicating if update may be available.
#'     \item \code{message} – character string with information message.
#'   }
#' @keywords internal
check_backbone_update <- function(backbone_year) {
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  backbone_year <- as.integer(backbone_year)

  # If backbone is more than 2 years old, suggest checking for updates
  years_old <- current_year - backbone_year

  if (years_old >= 2) {
    return(list(
      update_available = TRUE,
      message = paste0(
        "The taxonomic backbone is from ", backbone_year,
        " (", years_old, " years old). ",
        "Consider checking for updates."
      )
    ))
  } else {
    return(list(
      update_available = FALSE,
      message = "Backbone is current."
    ))
  }
}

#' Detect trinomial names (3+ taxonomic elements)
#' @keywords internal
.detect_trinomial <- function(orig_names) {
  word_counts <- stringr::str_count(orig_names, "\\S+")
  is_trinomial <- word_counts >= 3
  has_sp_notation <- grepl("\\ssp\\.\\s", orig_names, ignore.case = TRUE)
  is_trinomial <- is_trinomial & !has_sp_notation
  return(is_trinomial)
}

#' Invalidate trinomial matches in validation results
#' @keywords internal
.invalidate_trinomials <- function(results) {
  is_trinomial <- .detect_trinomial(results$Orig.Name)

  if (!any(is_trinomial)) {
    return(results)
  }

  trinomial_names <- results$Orig.Name[is_trinomial]
  n_trinomial <- length(trinomial_names)

  warning(
    paste0(
      "Found ", n_trinomial, " name(s) with 3+ elements (likely author info or infraspecies).\n",
      "The peru_mammals database only accepts binomial names (Genus species).\n",
      "Please provide names WITHOUT author information or infraspecific taxa.\n\n",
      "Invalid names:\n",
      paste(paste0("  - '", trinomial_names, "'"), collapse = "\n"),
      "\n\nThese names have been marked as NOT FOUND.\n"
    ),
    call. = FALSE,
    immediate. = TRUE
  )

  results_modified <- results |>
    dplyr::mutate(
      matched = dplyr::if_else(is_trinomial, FALSE, matched),
      Matched.Name = dplyr::if_else(is_trinomial, "---", Matched.Name),
      Matched.Genus = dplyr::if_else(is_trinomial, NA_character_, Matched.Genus),
      Matched.Species = dplyr::if_else(is_trinomial, NA_character_, Matched.Species),
      Matched.Rank = dplyr::if_else(is_trinomial, NA_integer_, Matched.Rank),
      Match.Level = dplyr::if_else(
        is_trinomial,
        "Invalid: 3+ elements (remove author/infraspecies)",
        Match.Level
      ),
      valid_rank = dplyr::if_else(is_trinomial, FALSE, valid_rank),
      Comp.Rank = dplyr::if_else(is_trinomial, FALSE, Comp.Rank),
      scientific_name = dplyr::if_else(is_trinomial, NA_character_, scientific_name),
      common_name = dplyr::if_else(is_trinomial, NA_character_, common_name),
      family = dplyr::if_else(is_trinomial, NA_character_, family),
      order = dplyr::if_else(is_trinomial, NA_character_, order),
      endemic = dplyr::if_else(is_trinomial, NA, endemic),
      genus_dist = dplyr::if_else(is_trinomial, NA_integer_, genus_dist),
      species_dist = dplyr::if_else(is_trinomial, NA_integer_, species_dist)
    )

  return(results_modified)
}




# variables interns

utils::globalVariables(c(
  # Objetos de datos internos
  "peru_mammals",
  "peru_mammals_backbone",
  "peru_mammals_ecoregions",
  "peru_mammals_ecoregions_meta",

  # Variables relacionadas con nombres científicos
  "scientific_name",
  "species",
  "genus",
  "genus_upper",
  "species_upper",

  # Variables originales (input)
  "Orig.Genus",
  "Orig.Name",
  "Orig.Species",

  # Variables de coincidencia (match)
  "Matched.Genus",
  "Matched.Name",
  "Matched.Rank",
  "Matched.Species",
  "Match.Level",
  "matched",

  # Variables de ranking y clasificación
  "Rank",
  "Comp.Rank",
  "valid_rank",
  "sorter",

  # Variables de distancia fuzzy
  "fuzzy_genus_dist",
  "fuzzy_species_dist",
  "genus_dist",
  "species_dist",

  # Metadatos taxonómicos
  "Author",
  "family",
  "common_name",
  "endemic",

  # Funciones y objetos especiales
  ".data",
  "head",

  "Endemism.Status",
  "Match.Quality", "Presence.Status", "Summary", "is_fuzzy",
  "endemic_pct", "endemic_rate", "n_endemic", "n_families", "n_genera", "n_species"
))
