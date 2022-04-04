#' Helper function to get data structured
#' @param dat1 dataframe
#' @keywords internal
heatmap_struc_func <- function(dat1){

  x <- colnames(dat1)[1]
  y <- colnames(dat1)[2]
  fill <- colnames(dat1)[3]

  dat1 <- dat1 %>%
    group_by(.dots = c(x,y)) %>%
    summarise(!!fill := sum(!!sym(fill))) %>%
    right_join(place_holder_dat, by = c(x,y)) %>%
    ungroup()

  dat1[is.na(dat1[,3]),3] <- 0

  dat1

}
