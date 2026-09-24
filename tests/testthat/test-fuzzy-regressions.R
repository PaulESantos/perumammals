test_that("fuzzy genus ambiguity is based on candidates, not input rows", {
  target <- tibble::tibble(
    genus = c("Panthera", "Felis"),
    species = c("onca", "catus"),
    family = c("Felidae", "Felidae")
  )
  input <- tibble::tibble(Orig.Genus = c("PANTERA", "FELIX", "PANTERA"))

  result <- expect_no_warning(fuzzy_match_genus(input, target))

  expect_true(all(result$fuzzy_match_genus))
  expect_null(attr(result, "ambiguous_genera"))
  expect_equal(nrow(result), nrow(input))
})

test_that("fuzzy genus preserves unmatched rows without a second join", {
  target <- tibble::tibble(genus = "Panthera", species = "onca")
  input <- tibble::tibble(Orig.Genus = c("PANTERA", "UNRELATED"))

  result <- fuzzy_match_genus(input, target)

  expect_equal(nrow(result), nrow(input))
  expect_true(result$fuzzy_match_genus[result$Orig.Genus == "PANTERA"])
  expect_false(result$fuzzy_match_genus[result$Orig.Genus == "UNRELATED"])
})

test_that("fuzzy genus reports genuinely tied candidates", {
  target <- tibble::tibble(
    genus = c("Aaa", "Aab"),
    species = c("one", "two"),
    family = c("Test", "Test")
  )

  result <- NULL
  expect_warning(
    result <- fuzzy_match_genus(tibble::tibble(Orig.Genus = "AAC"), target),
    "multiple fuzzy matches"
  )

  ambiguous <- attr(result, "ambiguous_genera")
  expect_equal(nrow(ambiguous), 2L)
})

test_that("fuzzy species uses an explicit two-character threshold", {
  target <- tibble::tibble(
    genus = "Panthera",
    species = "onca",
    scientific_name = "Panthera onca",
    common_name = "Oso"
  )
  input <- tibble::tibble(
    sorter = 1L,
    Orig.Genus = "PANTHERA",
    Orig.Species = "UNRELATED",
    Matched.Genus = "PANTHERA"
  )

  result <- fuzzy_match_species_within_genus(input, target)

  expect_equal(nrow(result), 1L)
  expect_false(result$fuzzy_match_species_within_genus)
  expect_true(is.na(result$Matched.Species))
})
