dados <- read.csv("winequality-white-q5.csv", header = TRUE, sep = ",")

dados$sqrt_chlorides <- sqrt(dados$chlorides)

boxplot(sqrt_chlorides ~ quality,
        data = dados,
        main = "Boxplot of sqrt(chlorides) by Wine Quality",
        xlab = "Wine Quality (1 = poor, 5 = excellent)",
        ylab = "sqrt(chlorides)",
        col = "lightblue",
        border = "darkblue")