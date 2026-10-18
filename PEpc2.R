library(readxl)
library(ggplot2)

dados <- read_excel("wine_prod_EU.xlsx")

dados_filtrados <- subset(dados, !is.na(Category) & `Product Group` != "Non-Vinified")

dados_2016 <- subset(dados_filtrados, Year == 2016)

main_countries <- c("France", "Italy", "Spain", "Portugal")

dados_2016$Country_Group <- ifelse(dados_2016$`Member State` %in% main_countries,
                                   dados_2016$`Member State`, "Others")

dados_agrupados <- aggregate(Availability ~ Category + Country_Group, data = dados_2016, sum)

ggplot(dados_agrupados, aes(x = Category, y = Availability, fill = Country_Group)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Wine Availability in 2016 by Category and Country",
       x = "Wine Category",
       y = "Availability (10^3 hL)",
       fill = "Country") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))