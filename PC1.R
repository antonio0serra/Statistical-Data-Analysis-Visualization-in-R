# Carregar o pacote 
library(ggplot2)

# Ler o ficheiro CSV
dados <- read.csv("hcvdat0.csv")

# Remover a primeira coluna (índice)
dados <- dados[, -1]

# Remover observações com valores em falta
dados <- na.omit(dados)

# Garantir que Category é tratada como variável categórica
dados$Category <- as.factor(dados$Category)

# Criar boxplots paralelos
grafico <- ggplot(dados, aes(x = Category, y = PROT)) +
  geom_boxplot() +
  labs(
    title = "Relationship between PROT and Category",
    x = "Category",
    y = "PROT"
  ) +
  theme_minimal()

# Mostrar gráfico
print(grafico)