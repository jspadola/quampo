
plot_tp <- function(port = "Calvi") {
  
  temp    <- readRDS(file = here::here("data/hobo_data.RDS"))
  temp    <- temp[temp$site %in% port,]
  
  row.names(temp) <- temp$date
  temp     <- temp[,-c(1,2)]
  temp$lwr <- temp$tp_mn - temp$tp_sd
  temp$upr <- temp$tp_mn + temp$tp_sd
  temp     <- temp[,-2]
  
  dygraphs::dygraph(temp, main = paste0("Suivi de la température des eaux portuaires de ", port)) %>%
    dygraphs::dySeries(c("lwr","tp_mn","upr")) %>%
    dygraphs::dyAxis("y", label = "Température (°C)") %>%
    dygraphs::dyAxis("x", label = "Date") %>%
    dygraphs::dySeries("tp_mn", label = "Température (°C)") %>%
    dygraphs::dyRangeSelector()
    
}#eo plot_tp

plot_ibr <- function(port = "Calvi", species = "limpet", spn ="Mimachlamys varia") {
  
  ibr <- readRDS(file = here::here("data/ibr_data.RDS"))
  ibr <- ibr[ibr$site %in% port,]
  ibr <- ibr[ibr$specie %in% species,]
  
  plotly::plot_ly(data = ibr,
                  x = ~date,
                  y = ~IBR,
                  error_y = list(type = "scatter", array= ~SD)) %>%
  plotly::layout(title = paste0("Evaluation du risque écologique chez ", spn),
                 xaxis = list(title = "Date"),
                 yaxis = list(title = "IBR (Integrative Biomarker Response"))
  
  
}#eo plot ibr
