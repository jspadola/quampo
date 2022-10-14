# runtime options --------------------------------------------------------------
options(stringsAsFactors = FALSE)

# project specific global variables --------------------------------------------

globals <- function() {
  list(
    db_version        = "1.1.1", #version of the Coral Trait Database we use
    ports               = c("st_florent", "ile_rousse", "calvi", "stareso")       
  )
}#eo globals
