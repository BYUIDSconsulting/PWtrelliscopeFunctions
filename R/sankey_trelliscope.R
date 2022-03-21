
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'



#' Create Sankey Trelliscopes
#'
#' @param data dataframe to be turned into sankey trelliscope. Ensure that columns are in the order that the sankey
#'    nodes should be left to right
#' @param facet column of variables that you want the trelliscope to group on.
#' @param quant_variable column containing the numeric values for the links between nodes.
#'
#' @return Trelliscope Display
#' @export
#'
#' @examples
#'
#' sankey_trelliscope(data = dat, facet = "state_company", quant_variable = "amount_award")
#'
sankey_trelliscope <- function(data, facet, quant_variable, title = "Sankey", path = "~sankey") {

  dat <- data

  dat <- suppressWarnings(nest(dat, -facet))

  dat <- dat %>%
    mutate(dat_plot = map2_plot(data, quant_variable, sankey_plot_func))

  trel_sankey <- dat %>%
    drop_na() %>%
    trelliscope(name=title,
                path = path,
                thumb = T,
                nrow = 1,
                ncol = 2
      )


  trel_sankey

}

