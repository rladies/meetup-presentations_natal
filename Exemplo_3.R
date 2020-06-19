# R-Ladies Natal - 1° Meetup
# Introdução ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Primeiro estabeleça um diretório no seu computador

datasets::cars # Um dos conjuntos de dados do R
data(cars) # Todo conjunto de dados
head(cars) # Primeiros valores da tabela
tail(cars) # Últimos valores da tabela
table(cars) # Tabela com conjunto de valores
table(cars$dist) # Apenas valores de distância
table(cars$speed) # Apenas valores de velocidade
summary(cars)
str(cars)

# OBS.: Acesse help(cars) para entender a descrição dos dados
# Acesse em help as funções de cada tipo de gráfico: hist, barplot, boxplot, etc.

# Histograma
hist()
hist(cars$speed)
hist(cars$dist)

# Boxplot
boxplot(cars$speed)
boxplot(cars$dist)
data("iris")
boxplot(Sepal.Length ~ Species, data = iris)
data("ToothGrowth")

# Dispersão
plot(cars$dist~cars$speed)
plot(cars$dist~cars$speed, col = "red", ylab = "Stopping distance (ft)",
     xlab = "Speed (mph)")
mdisp <- lm(cars$dist~cars$speed) # Modelo linear
abline(mdisp, col = "orange")
plot(cars$dist~cars$speed, col = "blue", ylab = "Stopping distance (ft)",
     xlab = "Speed (mph)", pch = 15)
abline(mdisp, col = "orange", lwd = 2)

data("iris")
plot(iris$Sepal.Length ~ iris$Petal.Length) # Continue

# Símbolos:pch, lwd, cex

# Entrada de dados (tabelas)

# No diretório procure o arquivo em txt ou csv com os dados
# Salve a tabela do Excel como texto separado por tabulação (text(tab delimeted))
# O txt indica que o arquivo foi salvo como um bloco de notas
# Alguns arquivos podem estar salvo em csv, então deve-se usar read.csv para
# buscar o arquivo

# Barra
rank <- read.table(file = "rank_university.txt", header = T)
rank
rank2 <- rank[1:25, ] # Seleciona dados das linhas 1 a 25 e todas as colunas

table(rank$Location)
pais <- table(rank$Location)
score <- table(rank$Score)
barplot(pais)
barplot(table(rank2$Location)) # Frequência de universidades analisadas

colors() # Acesso a cores do R

barplot(table(rank2$Location), col = "seagreen", xlab = "Frequência", 
        ylab = "País") # Após vírgula e enter o código é quebrado em parágrafo, isso
# permite maior organização do script.

covid <- read.csv(file = "full-list-cumulative-total-tests.csv", header = T)
covid
View(covid)
str(covid)
barplot(table(covid$Entity))
covid2 <- covid[1:780, ]
barplot(table(covid2$Entity))

barplot(table(covid2$Entity), ylab = "Frequência de testes", main = "Testes de COVID-19",
        col = "steelblue2")

# Média de testes por país
mean.pais <- tapply(covid2$Total.tests.per.thousand, covid2$Entity, mean)
barplot(mean.pais)
barplot(mean.pais, ylab = "Testes a cada mil pessoas", main = "Testes de COVID-19",
        col = "steelblue2", cex.names = 0.9)

data("iris")
comp.sepala <- (iris$Sepal.Length) # Extrai a variável comprimento de sépala
comp.petal <- (iris$Petal.Length) # Extrai a variável comprimento de pétala
sp <- (iris$Species) # Extrai a variável espécie
irisp <- tapply(comp.petal, sp, mean) 
barplot(irisp)

barplot(irisp, col = "salmon4", xlab = "Espécies", ylab = "Comprimento Pétalas")

data("ToothGrowth")
comp.dentes <- ToothGrowth[ , 1:2] # Seleciona as duas primeiras colunas
suplemento <- comp.dentes$supp
comp <- comp.dentes$len
med.sup <- tapply(comp, suplemento, mean)

barplot(med.sup, main="",
        xlab="Tipo de Suplemento", ylab = "Comprimento dos dentes",
        col=c("darkblue","red"), # Duas cores (concatenar)
        legend.text=c("Suco de Laranja", "Vitamina C"),
        ylim = c(0, 32))

comp.dentes1 <- ToothGrowth[ , 1:3] # Seleciona as duas primeiras colunas
suplemento <- comp.dentes1$supp
comp <- comp.dentes1$len
dos <- comp.dentes1$dose
med.sup1 <- tapply(comp, dos, mean)
desv <- tapply(comp, dos, sd)
ncomp <- tapply(comp, dos, length)
se <- with(comp.dentes1, med.sup1/ncomp)

graf <- barplot(med.sup1, main="Comprimento dos dentes - Porquinho da Índia", 
        ylab = "Comprimento dos dentes", xlab="Dose de vitamina C (mg/dia)",
        legend.text=c("Dose 1","Dose 2","Dose 3"),
        args.legend = list(x="topleft", bty="n"), # bty = n indica legenda sem bordas
        col=c("yellow", "orange", "darkorange2"),
        ylim = c(0, 30))# Três cores (concatenar)
arrows(graf, med.sup1 + se, graf,
       med.sup1 - se, graf, length = 0.08, code = 3, angle = 90,  # code: tipo de barra de erro
       lwd = 2.3) # lwd: espessura da barra de erro
text(graf, 2, paste("n = ", ncomp)) # Número de amostras (length)

boxplot(ToothGrowth$len ~ ToothGrowth$dose, main="Comprimento dos dentes - Porquinho da Índia", 
        ylab = "Comprimento dos dentes", xlab="Dose de vitamina C (mg/dia)",
                      col = c("bisque4", "lightblue4", "lightcoral"))

boxplot(ToothGrowth$len ~ ToothGrowth$dose, main="Comprimento dos dentes - Porquinho da Índia", 
        ylab = "Comprimento dos dentes", xlab="Dose de vitamina C (mg/dia)",
        col = c("bisque4", "lightblue4", "lightcoral"), notch = T) #Fenda

# Linha
rank <- read.table(file = "rank_university.txt", header = T)
rank
rank2 <- rank[1:25, ] 

plot(rank2[, 1] ~ rank2[ , 8], type = "l",
     lwd = 2, col = "darkviolet",
     xlab = "Rank Mundial", ylab = "Score",
     main = "Rankeamento de universidades") # Rank inversamente proporcional a score

rank3 <- rank[1:15, ] 
plot(rank3$Score ~ rank3$world_rank, type = "l",
     col = "forestgreen",
     lwd = 2.8,
     xlab = "Rank Mundial", ylab = "Score",
     main = "Rankeamento de universidades")


rank3 <- rank[1:30, ] 
plot(rank3$Employment ~ rank3$Score, type = "l",
     col = "forestgreen",
     lwd = 2.8,
     xlab = "Score", ylab = "Desemprego",
     main = "Rankeamento de universidades")

