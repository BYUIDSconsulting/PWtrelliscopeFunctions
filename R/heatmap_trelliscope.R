#' Create Heatmap Trelliscopes
#'
#' @param data dataframe to be turned into heatmap trelliscope.
#' @param facet column of variables that you want the trelliscope to group on.
#' @param x x axis variable for heatmap
#' @param y y axis variable for heatmap
#' @param fill quantitative fill variable for heatmap
#' @param title Title of the trelliscope
#' @param path path to location to save trelliscope
#'
#' @return Trelliscope Display
#' @export
#'
#' @examples
#'
#' heatmap_trelliscope(gapminder::gapminder, "continent",'year','country',"lifeExp")
#'
heatmap_trelliscope <- function(data, facet, x, y, fill, title = "HeatMap", path = "~heatmap"){

  if (typeof(unique(data[,x])) == "list") {
    varx <- unique(data[,x])[[1]]
    vary <- unique(data[,y])[[1]]
  }else{
    varx <- unique(data[,x])
    vary <- unique(data[,y])
  }

  place_holder_dat <<- expand.grid(varx,vary)

  colnames(place_holder_dat) <<- c(x,y)

  data <- data[,c(facet,x,y,fill)]

  dat_max <- max(data[,fill][[1]])

  data <- suppressWarnings(nest(data, -facet))

  data <- suppressMessages(
    data %>%
      mutate(struc_data = map(data, heatmap_struc_func))
  )

  rm(place_holder_dat, pos = ".GlobalEnv")


  data <- data %>%
    mutate(heat_plot = map_plot(.x = struc_data, .f = heatmap_plot_func))

  data %>%
    drop_na() %>%
    trelliscope(name = title,
                path = path)


}


