% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heatmap_trelliscope.R
\name{heatmap_trelliscope}
\alias{heatmap_trelliscope}
\title{Create Heatmap Trelliscopes}
\usage{
heatmap_trelliscope(
  data,
  facet,
  x,
  y,
  fill,
  title = "HeatMap",
  path = "~heatmap"
)
}
\arguments{
\item{data}{dataframe to be turned into heatmap trelliscope.}

\item{facet}{column of variables that you want the trelliscope to group on.}

\item{x}{x axis variable for heatmap}

\item{y}{y axis variable for heatmap}

\item{fill}{quantitative fill variable for heatmap}

\item{title}{Title of the trelliscope}

\item{path}{path to location to save trelliscope}
}
\value{
Trelliscope Display
}
\description{
Create Heatmap Trelliscopes
}
\examples{

heatmap_trelliscope(gapminder::gapminder, "continent",'year','country',"lifeExp")

}
