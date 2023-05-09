library(tidyverse)
tmp <- read_csv("../extdata/DIAData/Dataset_45245_item_.csv")
colnames(tmp) <- make.names(colnames(tmp))
colnames(tmp)
tmp <- tmp |> mutate(GroupingVar = ifelse(grepl("_A_", Name),"A", "B"))
tmp$Type <- "DIA"


Exp2DSGrad30 <- tmp |>
  filter(grepl("Exp02_", Relative.Path)) |>
  filter(grepl("Grad030", Relative.Path)) |>
  filter(!is.na(Name))
write_csv(Exp2DSGrad30, file = "Exp2DSGrad30.csv")


Exp2DSGrad90staggered <- tmp |>
  filter(grepl("Exp02_", Relative.Path)) |>
  filter(grepl("Grad090", Relative.Path)) |>
  filter(grepl("staggered", Relative.Path)) |>
  filter(!is.na(Name))
write_csv(Exp2DSGrad90staggered, file = "Exp2DSGrad90staggered.csv")

Exp2DSGrad90 <- tmp |>
  filter(grepl("Exp02_", Relative.Path)) |>
  filter(grepl("Grad090", Relative.Path)) |>
  filter(!grepl("staggered", Relative.Path)) |> filter(!is.na(Name))
write_csv(Exp2DSGrad90, file = "Exp2DSGrad90.csv")


Exp2DSGrad150 <- tmp |>
  filter(grepl("Exp02_", Relative.Path)) |>
  filter(grepl("Grad150", Relative.Path)) |>
  filter(!is.na(Name))
write_csv(Exp2DSGrad150, file = "Exp2DSGrad150.csv")
