# PW Trelliscope Functions
A package to generate trelliscope displays.


## Installation

```
devtools::install_github("BYUIDSconsulting/PWtrelliscopeFunctions")
```


## Heat Map Trelliscope
using the `heatmap_trelliscope()` function you can create a trelliscope of heatmaps.

Here is an example using the gapminder dataset:

```
heatmap_trelliscope(gapminder::gapminder, "continent",'year','country',"lifeExp")
```

## Sankey Trelliscope
using the `sankey_trelliscope()` function yo ucan create a trelliscope of sankey charts
