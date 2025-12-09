#' List taxonomic orders in the Peruvian mammal backbone
#'
#' Summarises the number of families, genera, species and endemic species
#' per order in \code{peru_mammals}.
#'
#' @return A tibble with one row per order and the following columns:
#'   \itemize{
#'     \item \code{order} – taxonomic order.
#'     \item \code{n_families} – number of families in the order.
#'     \item \code{n_genera} – number of genera in the order.
#'     \item \code{n_species} – number of species in the order.
#'     \item \code{n_endemic} – number of endemic species in the order.
#'   }
#'
#' @examples
#' \dontrun{
#' pm_list_orders()
#' }
#'
#' @export
pm_list_orders <- function() {
  peru_mammals |>
    dplyr::group_by(.data$order) |>
    dplyr::summarise(
      n_families = dplyr::n_distinct(.data$family),
      n_genera   = dplyr::n_distinct(.data$genus),
      n_species  = dplyr::n_distinct(.data$scientific_name),
      n_endemic  = sum(.data$endemic, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::arrange(.data$order)
}

#' List taxonomic families in the Peruvian mammal backbone
#'
#' Summarises the number of genera, species and endemic species per family.
#' Optionally filters the output to one or more taxonomic orders.
#'
#' @param order Optional character vector specifying one or more taxonomic
#'   orders to include. If \code{NULL} (default), all orders are included.
#'   Order names are case-sensitive (e.g., "Rodentia", "Chiroptera").
#'
#' @return A tibble with one row per family, arranged by order and family name,
#'   with the following columns:
#'   \describe{
#'     \item{order}{Taxonomic order}
#'     \item{family}{Family name}
#'     \item{n_genera}{Number of genera in the family}
#'     \item{n_species}{Number of species in the family}
#'     \item{n_endemic}{Number of endemic species to Peru in the family}
#'   }
#'
#' @examples
#' # All families
#' pm_list_families()
#'
#' # Only families within Rodentia
#' pm_list_families(order = "Rodentia")
#'
#' # Multiple orders
#' pm_list_families(order = c("Rodentia", "Chiroptera"))
#'
#' @export
pm_list_families <- function(order = NULL) {
  x <- peru_mammals

  # Validate order parameter
  if (!is.null(order)) {
    if (!is.character(order)) {
      stop("'order' must be a character vector", call. = FALSE)
    }

    invalid_orders <- setdiff(order, unique(peru_mammals$order))
    if (length(invalid_orders) > 0) {
      warning(
        "The following order(s) not found in the backbone: ",
        paste(invalid_orders, collapse = ", "),
        call. = FALSE
      )
    }

    x <- dplyr::filter(x, .data$order %in% !!order)

    if (nrow(x) == 0) {
      warning("No families found for the specified order(s)", call. = FALSE)
      return(tibble::tibble(
        order = character(),
        family = character(),
        n_genera = integer(),
        n_species = integer(),
        n_endemic = integer()
      ))
    }
  }

  x |>
    dplyr::group_by(.data$order, .data$family) |>
    dplyr::summarise(
      n_genera  = dplyr::n_distinct(.data$genus),
      n_species = dplyr::n_distinct(.data$scientific_name),
      n_endemic = sum(.data$endemic, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::arrange(.data$order, .data$family)
}

#' List genera in the Peruvian mammal backbone
#'
#' Summarises the number of species and endemic species per genus.
#' Optionally restricts the output to one or more orders and/or families.
#' Genera with missing values are excluded from the results.
#'
#' @param order Optional character vector with one or more taxonomic orders
#'   to keep. If \code{NULL} (default), no filter is applied by order.
#'   Invalid order names will generate a warning.
#' @param family Optional character vector with one or more families to keep.
#'   If \code{NULL} (default), no filter is applied by family.
#'   Invalid family names will generate a warning.
#'
#' @return A tibble with one row per genus and the following columns:
#'   \itemize{
#'     \item \code{order} – taxonomic order.
#'     \item \code{family} – family name.
#'     \item \code{genus} – genus name.
#'     \item \code{n_species} – number of species in the genus.
#'     \item \code{n_endemic} – number of endemic species in the genus.
#'   }
#'   Returns an empty tibble with the same structure if no records match
#'   the specified filters.
#'
#' @details
#' The function validates input parameters and warns if invalid order or
#' family names are provided. It also warns if the filters result in an
#' empty dataset.
#'
#' @examples
#' # All genera
#' pm_list_genera()
#'
#' # Genera within Chiroptera (bats)
#' pm_list_genera(order = "Chiroptera")
#'
#' # Multiple orders
#' pm_list_genera(order = c("Didelphimorphia", "Chiroptera"))
#'
#' # Genera within a specific family
#' bat_genera <- pm_list_genera(family = "Phyllostomidae")
#'
#' # Count total endemic species in a family
#' sum(bat_genera$n_endemic)
#'
#' # Combination of filters
#' pm_list_genera(order = "Chiroptera", family = "Phyllostomidae")
#'
#' # Invalid input generates warning
#' \dontrun{
#' pm_list_genera(order = "InvalidOrder")
#' }
#'
#' @export
pm_list_genera <- function(order = NULL, family = NULL) {
  # Input validation
  if (!is.null(order) && !is.character(order)) {
    stop("'order' must be a character vector or NULL")
  }
  if (!is.null(family) && !is.character(family)) {
    stop("'family' must be a character vector or NULL")
  }

  x <- peru_mammals

  # Apply filters with validation
  if (!is.null(order)) {
    invalid <- setdiff(order, unique(peru_mammals$order))
    if (length(invalid) > 0) {
      warning("Order(s) not found: ", paste(invalid, collapse = ", "))
    }
    x <- dplyr::filter(x, .data$order %in% !!order)
  }

  if (!is.null(family)) {
    invalid <- setdiff(family, unique(x$family))
    if (length(invalid) > 0) {
      warning("Family/families not found: ", paste(invalid, collapse = ", "))
    }
    x <- dplyr::filter(x, .data$family %in% !!family)
  }

  if (nrow(x) == 0) {
    warning("No records match the specified filters")
    return(tibble::tibble(
      order = character(), family = character(), genus = character(),
      n_species = integer(), n_endemic = integer()
    ))
  }

  x |>
    dplyr::filter(!is.na(.data$genus)) |>
    dplyr::group_by(.data$order, .data$family, .data$genus) |>
    dplyr::summarise(
      n_species = dplyr::n_distinct(.data$scientific_name),
      n_endemic = sum(.data$endemic, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::arrange(.data$order, .data$family, .data$genus)
}

#' List endemic mammal species of Peru
#'
#' Returns endemic species from the Peruvian mammal backbone, with optional
#' filters by order, family and/or ecoregion.
#'
#' This is a convenience wrapper around \code{\link{pm_species}()} with
#' \code{endemic = TRUE}.
#'
#' @inheritParams pm_species
#'
#' @return A tibble with endemic species (subset of \code{peru_mammals}).
#'
#' @examples
#' \dontrun{
#' # All endemic species
#' pm_endemics()
#'
#' # Endemic rodents
#' pm_endemics(order = "Rodentia")
#'
#' # Endemic species in Yungas (YUN)
#' pm_endemics(ecoregion = "YUN")
#' }
#'
#' @export
pm_endemics <- function(order = NULL,
                        family = NULL,
                        genus = NULL,
                        ecoregion = NULL) {
  pm_species(
    order     = order,
    family    = family,
    genus     = genus,
    endemic   = TRUE,
    ecoregion = ecoregion
  ) |>
    dplyr::select(order, family, genus, species, scientific_name)
}
