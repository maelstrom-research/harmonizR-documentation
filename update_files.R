library(harmonizRv3)
library(fs)
# usethis::use_pkgdown()

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
pkgdown::build_site()

dir_copy(
  "/staff/gfabre/harmonizRv3/docs",
  "/staff/gfabre/harmonizR-documentation/docs",
  overwrite = TRUE
)
