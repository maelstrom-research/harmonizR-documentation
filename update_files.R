library(harmonizRv3)
library(fs)
# usethis::use_pkgdown()

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
pkgdown::build_site()

fs::dir_copy(
  "/staff/atrottier//harmonizRv3/docs",
  "/staff/atrottier//harmonizR-documentation/docs",
  overwrite = TRUE
)


harmonizRv3::harmonizR_help()
