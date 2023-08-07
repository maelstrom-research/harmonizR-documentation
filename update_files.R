library(harmonizR)
library(madshapR)
library(fabR)
library(fs)
# usethis::use_pkgdown()

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
devtools::build_readme()
fs::dir_delete("docs")
pkgdown::build_site()

fs::dir_delete("../harmonizR-documentation/docs")
fs::dir_copy(
  "docs",
  "../harmonizR-documentation/docs",
  overwrite = TRUE
)

harmonizR_help()
