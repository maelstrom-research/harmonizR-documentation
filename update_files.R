library(harmonizRv3)
library(fs)
# usethis::use_pkgdown()
pkgdown::build_site()

dir_copy(
  "/staff/gfabre/harmonizRv3/docs",
  "/staff/gfabre/harmonizR-documentation/docs",
  overwrite = TRUE
)

