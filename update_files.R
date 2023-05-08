library(harmonizR)
library(madshapR)
library(fabR)
library(fs)
# usethis::use_pkgdown()

devtools::document(roclets = c('rd', 'collate', 'namespace', 'vignette'))
pkgdown::build_site()

fs::dir_copy(
  "docs",
  "../harmonizR-documentation/docs",
  overwrite = TRUE
)

harmonizR_help()
madshapR_help()
fabR_help()
