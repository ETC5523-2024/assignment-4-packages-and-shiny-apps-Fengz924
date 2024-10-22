# data-raw/eclipse_data.R
eclipse_data <- read.csv("data-raw/eclipse_data_2023_2024.csv")

clean_eclipse_data <- eclipse_data |> na.omit()

save(clean_eclipse_data , file = "data/clean_eclipse_data .rda")
