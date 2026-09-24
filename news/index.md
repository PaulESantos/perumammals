# Changelog

## perumammals 0.1.0

### New features

- Adds concise `pm_*` aliases for the main matching, occurrence,
  endemism, match-quality, and common-name helpers.

### Improvements

- Makes fuzzy-match tie resolution deterministic and preserves repeated
  input records during matching.
- Loads and normalises the packaged taxonomic backbone independently of
  the user’s global environment.
- Makes vignettes reproducible and updates package citation metadata.
