#' Create the sunburst Plot
#' @param dat dataframe
#' @param quant Quantitative variable
#' @keywords internal
plot_sunburst <- function(dat, quant){

  #This will tell us which column is the quantitative variable. We Set 'amount_award' as the qunatitative variable in the dataframe and retrieve the column number
  quant_var <- which(colnames(dat) == quant)

  #We set the quantitative variable column to 'amount' for standardization
  colnames(dat)[quant_var] <- "amount"

  non_quant_dat <- dat[,-quant_var]

  dat <- dat %>%
    drop_na() %>%
    group_by(.dots = colnames(non_quant_dat)) %>%
    summarise(amount = sum(amount)) %>%
    filter(amount > 0)

  sunburstDF <- as.sunburstDF(dat, value_column = "amount", add_root = TRUE)

  plot_ly(data = sunburstDF, ids = ~ids, labels= ~labels, parents = ~parents, values= ~values, type='sunburst', branchvalues = 'total')

}
