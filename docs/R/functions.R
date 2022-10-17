
plot_tp <- function(port = "Calvi") {
  
  temp    <- readRDS(file = here::here("data/hobo_data.RDS"))
  temp    <- temp[temp$site %in% port,]
  
  
  row.names(temp) <- temp$date
  temp     <- temp[,-c(1,2)]
  temp$lwr <- temp$tp_mn - temp$tp_sd
  temp$upr <- temp$tp_mn + temp$tp_sd
  temp     <- temp[,-2]
  
  dygraphs::dygraph(temp) %>% dygraphs::dySeries(c("lwr","tp_mn","upr"))

}
