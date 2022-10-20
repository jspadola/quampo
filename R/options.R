# runtime options --------------------------------------------------------------
options(stringsAsFactors = FALSE)

# project specific global variables --------------------------------------------

globals <- function() {
  list(
    ports      = c("Calvi", "Saint-Florent", "L'Île Rousse", "STARESO"),
    metal      = c("aluminium",
                    "arsenic", 
                    "cobalt",
                    "cuivre",
                    "fer",
                    "manganèse",
                    "molybdène",
                    "plomb",
                    "antimoine",
                    "sélénium",
                    "zinc"),
    etm       = c("al", "as", "co", "cu", "fe", "mn", "mo", "pb", "sb", "se", "zn"),
    nut       = c("nitrite", "nitrate", "silica", "phosphate", "ammonium"),
    hyd       = c("c1_naphthalene",
                  "c2_naphthalene",
                  "c3_naphthalene",
                  "acenapthtylene",
                  "fluorene",
                  "c2_fluorene",
                  "c3_fluorene",
                  "pyrene",
                  "chrysene",
                  "benzo_b_k_fluranthene",
                  "benzo_e_pyrene",
                  "benzo_a_pyrene",
                  "perylene"),
    msl_ibr_v = c("TA_PK", "TA_GST", "TA_LAC", "TA_SOD", "TA_ACHE","glyc"),
    ptl_ibr_v = c("TA_PK", "TA_LDH", "TA_GST", "TA_LAC", "TA_SOD", "TA_ACHE", "lipid", "glyc")
    
  )
}#eo globals
