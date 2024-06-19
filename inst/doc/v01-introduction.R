## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggtibble)

## ----typical, fig.cap=all_plots$caption---------------------------------------
# Note, add `fig.cap=all_plots$caption` to show the generated caption for the
# figures

library(ggtibble)
library(dplyr)
library(ggplot2)

d_plot <-
  mtcars |>
  mutate(
    dispu = "cu. in."
  )
all_plots <-
  ggtibble(
    d_plot,
    aes(x = disp, y = hp),
    outercols = c("cyl", "dispu"),
    caption = "Horsepower by displacement for {cyl} cars",
    labs = list(x = "Displacement ({dispu})", y = "Gross horsepower")
  ) +
  geom_point() +
  geom_line()

# The result is a tibble with columns for the `data_plot`, `figure`, and
# `caption`
as_tibble(all_plots)

# You can then show all the figures with the `knit_print()` method.
knit_print(all_plots)

