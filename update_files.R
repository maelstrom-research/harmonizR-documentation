library(tidyverse)
library(fs)

file_copy(
  "/staff/gfabre/ownDir/in_development/harmonizR/README.md",
  "/staff/gfabre/ownDir/in_development/harmonizR-documentation/README.md",
  overwrite = TRUE
)

dir_copy(
  "/staff/gfabre/ownDir/in_development/harmonizR/docs",
  "/staff/gfabre/ownDir/in_development/harmonizR-documentation/docs",
  overwrite = TRUE
)
