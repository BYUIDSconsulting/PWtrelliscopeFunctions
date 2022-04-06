# PW Trelliscope Functions
A package to generate trelliscope displays.

There are 4 main types of displays:
* Heat Map
* Sankey Chart
* Tree Map
* Sunburst Chart


## Installation

```
devtools::install_github("BYUIDSconsulting/PWtrelliscopeFunctions")
```


## Heat Map Trelliscope
using the `heatmap_trelliscope()` function you can create a trelliscope of heatmaps.

example:

```
heatmap_trelliscope(gapminder::gapminder, "continent",'year','country',"lifeExp")
```

## Sankey Trelliscope
using the `sankey_trelliscope()` function yo ucan create a trelliscope of sankey charts

Example:

```

dat <- gapminder::gapminder
dat$year <- as.character(dat$year)

dat <- dat %>% 
  group_by(continent, country, year) %>% 
  summarise(pop = mean(pop))

PWtrelliscopeFunctions::sankey_trelliscope(data = dat
                                           ,facet = "year"
                                           ,quant_variable = "pop"
                                           )
                                           
```


## Sunburst Trelliscope

using the `sunburst_trelliscope()` function yo ucan create a trelliscope of sunburst charts

Example:

```

dat <- gapminder::gapminder
dat$year <- as.character(dat$year)

dat <- dat %>% 
  group_by(continent, country, year) %>% 
  summarise(pop = mean(pop))

PWtrelliscopeFunctions::sunburst_trelliscope(data = dat
                                           ,facet = "year"
                                           ,quant_variable = "pop"
                                           )
                                           
```


## Treemap Trelliscope

using the `treemap_trelliscope()` function yo ucan create a trelliscope of treemap charts

Example:

```

dat <- gapminder::gapminder
dat$year <- as.character(dat$year)

dat <- dat %>% 
  group_by(continent, country, year) %>% 
  summarise(pop = mean(pop))

PWtrelliscopeFunctions::treemap_trelliscope(data = dat
                                           ,facet = "year"
                                           ,quant_variable = "pop"
                                           )
                                           
```

