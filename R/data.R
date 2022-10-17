#---- QUAMPO DATA ------------------------------------------
  
  #' Download QUAMPO project data
  #'
  #' @return the path where the files have been stored
  #'
  #' @export
  #'
  download_wibe <- function() {
    
    # SOURCE
    # Epinoux et al. (2022).Water Interdisciplinary Biology and Ecology database
    # WIBE”: Towards FAIR, open and interdisciplinary data on biomarkers to 
    # monitor the ecological status of coastal waters, available online at
    # https://data.pndb.fr/view/urn:uuid:99abf52c-b271-4b66-ae50-c504e492bc4c
    
    # urls & paths
    wibe_url  <- "https://pndb.fr/metacat/d1/mn/v2/packages/application%2Fbagit-097/resource_map_urn%3Auuid%3A7bf52280-5ed6-48e5-b857-a4f9adecb90f"
    wibe_file <- here::here("data", basename(wibe_url))
    #wibe_file <- here::here("data", paste0(basename(wibe_url), ".zip"))
    wibe_dir  <- here::here("data/wibe")
    #wibe_zip
   # wibe_shp  <- here::here(wibe_dir, "wibe.shp")
    
    if (dir.exists(wibe_dir)) unlink(wibe_dir, recursive = TRUE, force = TRUE)
    
    # download & unzip wibe
    download.file(url = wibe_url, destfile = wibe_file, cacheOK = FALSE, mode = "wb")
    file.rename(here::here("data", basename(wibe_url)), here::here("data",paste0(basename(wibe_url), ".zip")))
    unzip(paste0(wibe_file, ".zip"), exdir = wibe_dir, junkpaths = TRUE)
    unlink(wibe_file)
    
    #if (!file.exists(wibe_shp)) stop("download_wibe failed !")
    #return(wibe_shp)
    
  }#eo download_wibe
  
  
  #' Import data about the project
  #'
  #' @return the project data
  #' @export
  #'
  data_project <- function() {
    
    # path
    project_path <- here::here("data/wibe/Project.csv")
    
    # import project data
    project <- read.csv(project_path, header = TRUE, sep = ";")
    
    # lower column names 
    names(project) <- tolower(names(project))
    
    # correct
    project <- as.data.frame(lapply(project, function(x) gsub("-", "_", x)))
    project <- as.data.frame(lapply(project, function(x) gsub("/", "_", x)))
    
  }#eo data_project
  
  
  #' Import data about the studied taxon
  #'
  #' @return data about the studied taxon
  #' @export
  #'
  data_taxref <- function() {
    
    # path
    taxref_path <- here::here("data/wibe/TAXREF.csv")
    
    # import taxref data
    taxref <- read.csv(taxref_path, header = TRUE, sep = ";")
    
    # lower colnames 
    names(taxref) <- tolower(names(taxref))
    
    # correct
    taxref <- as.data.frame(lapply(taxref, function(x) tolower(x)))
    
  }#eo data_taxref
  
  #' Import the data about the fieldwork
  #'
  #' @return the data about the fieldwork
  #' @export
  #'
  data_fieldwork <- function() {
    
    # path
    fieldwork_path <- here::here("data/wibe/Fieldwork.csv")
    
    # import fieldwork data
    fieldwork <- read.csv(fieldwork_path, header = TRUE, sep = ";")
    
    # lower colnames 
    names(fieldwork) <- tolower(names(fieldwork))
    
    # correct
    fieldwork <- as.data.frame(lapply(fieldwork, function(x) tolower(x)))
    fieldwork <- as.data.frame(lapply(fieldwork, function(x) gsub("-", "_", x)))
    fieldwork <- as.data.frame(lapply(fieldwork, function(x) gsub("/", "_", x)))
    fieldwork <- as.data.frame(lapply(fieldwork, function(x) gsub("'", "_", x)))
    
  }#eo data_fieldwork
  
  #' Import the data about the sampling stations
  #'
  #' @return the data about the sampling stations
  #' @export
  #'
  data_s_st<- function() {
    
    # path
    s_st_path <- here::here("data/wibe/Sampling_stations.csv")
  
    # import taxref data
    s_st <- read.csv(s_st_path, header = TRUE, sep = ";")
  
    # lower colnames 
    names(s_st) <- tolower(names(s_st))
  
    # correct
    s_st <- as.data.frame(lapply(s_st, function(x) tolower(x)))
    s_st <- as.data.frame(lapply(s_st, function(x)  gsub("'", "_", x)))
    s_st <- as.data.frame(lapply(s_st, function(x)  gsub(" ", "_", x)))
    s_st <- as.data.frame(lapply(s_st, function(x)  gsub("î", "_", x)))
    
    return(s_st)
    
  }#eo data_s_st
  
  #' Import WIBE data dictionary
  #'
  #' @return WIBE data dictionary
  #' @export
  #'
  data_wdd <- function() {
    
    # path
    wdd_path <- here::here("data/wibe/WIBE_Data_Dictionary.csv")
    
    # import wdd data
    wdd <- read.csv(wdd_path, header = TRUE, sep = ";")
    
    # lower colnames 
    names(wdd) <- tolower(names(wdd))
    names(wdd) <- gsub(".", "_", names(wdd), fixed = TRUE)
    
    # correct
    wdd <- as.data.frame(lapply(wdd, function(x) tolower(x)))
    
    
    return(wdd)
    
  }#eo data_wdd
  
  #' Import water samples measurements data (QUALIPERTUIS, QUAMPO)
  #'
  #' @return water samples measurements data
  #' @export
  #'
  data_wsm <- function() {
    
    # path
    wsm_path <- here::here("data/wibe/Water_samples_measurements.csv")
    
    # import wdd data
    wsm <- read.csv(wsm_path, header = TRUE, sep = ";")
    
    # lower colnames
    names(wsm) <- tolower(names(wsm))
    
    return(wsm)
    
  }#eo data_wsm
  
  
  #' Import field organisms samples data
  #'
  #' @return data about field organisms samples data
  #' @export
  #'
  data_fos <- function() {
    
    # path
    fos_path <- here::here("data/wibe/Field_organisms_samples.csv")
    
    # import wdd data
    fos <- read.csv(fos_path, header = TRUE, sep = ";")
    
    # lower colnames
    names(fos) <- tolower(names(fos))
    
    # correct
    fos <- as.data.frame(lapply(fos, function(x) tolower(x)))
    fos <- as.data.frame(lapply(fos, function(x)  gsub("'", "_", x)))
    fos <- as.data.frame(lapply(fos, function(x)  gsub(" ", "_", x)))
    fos <- as.data.frame(lapply(fos, function(x)  gsub(".", "", x, fixed = TRUE)))
    
    return(fos)
    
  }#eo data_fos
  
  
################################################################################
################################################################################
  
  data_hobo <- function() { 
    
    hobo_data <- readxl::read_xlsx(paste0(here::here("data"),"/","Hobo_2020-2022 QUAMPO.xlsx"))
    hobo_data$`Date Heure` <- as.Date(hobo_data$`Date Heure`)
    hobo_data$Year <- lubridate::year(hobo_data$`Date Heure`)
    hobo_data <- as.data.frame(hobo_data)
    # colnames(hobo_data)[2] <- "Date"
    
    hobo_mn <- as.data.frame(tapply(hobo_data$Temperature, list(hobo_data$`Date Heure`, hobo_data$Site), mean))
    hobo_sd <- as.data.frame(tapply(hobo_data$Temperature, list(hobo_data$`Date Heure`, hobo_data$Site), sd))
    
    hobo_data <- data.frame(rows = as.Date(row.names(hobo_mn)), stack(hobo_mn), stack(hobo_sd)[,"values"])
    colnames(hobo_data) <- c("date", "tp_mn", "site", "tp_sd")
    hobo_data <- hobo_data[,c("site", "date", "tp_mn", "tp_sd")]
    
    if (!file.exists(paste0(here::here("data"),"/","hobo_data.RDS"))) {
      
      saveRDS(hobo_data, file = paste0(here::here("data"),"/","hobo_data.RDS"))
    }#eo if
    
    }#eo data_hobo
  
  data_ibr <- function() {
    
    ibr_data      <- readxl::read_xlsx(paste0(here::here("data"),"/", "2022_IBR_allports.xlsx"), sheet = 1)
    ibr_data$IBR  <- as.numeric(ibr_data$IBR)
    ibr_data$SD   <- as.numeric(ibr_data$SD)
    ibr_data$year <- lubridate::year(gsub(".*(.{4})$", "\\1-01-01", ibr_data$date))
    ibr_data$date <- lubridate::my(ibr_data$date)
    
    if (!file.exists(paste0(here::here("data"),"/","ibr_data.RDS"))) {
      
      saveRDS(ibr_data, file = paste0(here::here("data"),"/","ibr_data.RDS"))
    }#eo if
    
  }
  
  data_ports <- function() {
    
        id       <- c("Saint-Florent", "Ile Rousse", "Calvi", "STARESO")
        lat      <- c("42.681846", "42.636572", "42.566667","42.580178")
        long     <- c("9.303704","8.935399","8.750000", "8.724331")

        ports    <- data.frame(id,lat,long)
        ports_sf <- sf::st_as_sf(ports, coords = c("long","lat"), crs = "WGS84")
        
        if (!file.exists(here::here("data/ports_markers.shp"))) {
        
       sf::st_write(ports_sf, here::here("data/ports_markers.shp"))
        }#eo if
    
  }#eo data_ports
  
  
  # for shiny
  # updateSelectInput(inputId = "port", choices = unique(.hobo_data$Site))
  
  temperature_data <- shiny::reactive({
    req(input$port)

    .hobo_data |>
      dplyr::filter(Site == input$port)
  })
  # 
  # ## IBR data ====
  # .ibr_data <- readxl::read_xlsx("2022_IBR_allports.xlsx", sheet = 1)
  # .ibr_data$IBR <- as.numeric(.ibr_data$IBR)
  # .ibr_data$SD <- as.numeric(.ibr_data$SD)
  # .ibr_data$year <- lubridate::year(gsub(".*(.{4})$", "\\1-01-01", .ibr_data$date))
  # .ibr_data$date <- lubridate::my(.ibr_data$date)
  # 
  # ibr_data <- reactive({
  #   req(input$port)
  #   
  #   .ibr_data |>
  #     dplyr::filter(site == input$port) |> 
  #     dplyr::filter(specie == "limpet")
  # })
  # 
  # ## Stress data ====
  # 
  # .stress_data <- readxl::read_xlsx("2022_06_15 moy_sd_biomeffect_col.xlsx")[,-1] |>
  #   filter(specie == "limpet")
  # .stress_data$date <- lubridate::my(.stress_data$date)
  # 
  # stress_data <- reactive({
  #   req(input$port)
  #   
  #   .stress_data |>
  #     dplyr::filter(site == input$port)
  # })
  # 
