#' Helper function to get plot
#' @param dat dataframe
#' @keywords internal
heatmap_plot_func <- function(dat){

  cols <- colnames(dat)
  x_var <- cols[1]
  y_var <- cols[2]
  fill_var <- cols[3]


  palette <- colorRampPalette(c("#e0e0e0", "#c22d19"))

  plot_ly(
    data = dat,
    x = as.formula(paste0('~', x_var)),
    y = as.formula(paste0('~', y_var)),
    z = as.formula(paste0('~', fill_var)),
    colors = palette(50),
    type = "heatmap",
    hoverinfo = 'text',
    text = ~paste('</br> ',y_var,': ', dat[,1][[1]],
                  '</br> ',x_var,': ', dat[,2][[1]],
                  '</br> ',fill_var,': ', dat[,3][[1]])) %>%
    layout(
      xaxis = list(showticklabels=FALSE,
                   ticks = ""),
      yaxis = list(showticklabels=FALSE,
                   ticks = "")
    ) %>%
#    colorbar(limits = c(0,max_val),) %>%
    config(displayModeBar = F)


}
