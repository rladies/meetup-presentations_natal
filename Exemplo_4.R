# R-Ladies Natal - 1° Meetup
# Introdução ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Testes Clássicos

# Amostras Simples

# Qual a média?
# O valor médio é significativamente diferente do esperado?
# Qual o nível de incerteza do valor médio?
# Os valores são normalmente distribuídos?
# Existem outliers?

summary(cars$speed)
hist(cars$speed)
y <- cars$speed

# Gráfico para teste de normalidade

# quantile-quantile plot
# Dados normalmente distribuídos = Linha reta
# Amostras pequenas pode indicar pouca credibilidade no teste de normalidade

par(mfrow=c(1,1)) # Apenas um gráfico/uma janela
qqnorm(y)
qqline(y,lty=2) # Plot da linha

# O resultado apresenta apenas um leve formato de "S"

# Teste de normalidade

# Shapiro.wilk
# Hipótese nula = dados normalmente distribuídos

shapiro.test(y) # O resultado apresenta distribuição normal (valor de p>0.05)
# Aceita-se a hipótese alternativa

x <- exp(rnorm(30))
shapiro.test(x) # O resultado apresenta distribuição diferente da normal (valor de p>0.05)

wilcox.test(x) # Resultado: aceita a hipótese alternativa

# Skew e Kurtosis

# Skew = assimetria
# Skew mede até que ponto uma distribuição apresenta caudas longas, de um lado ou de
# outro da distribuição. Uma distribuição normal apresenta skew = 0, pois ela é simétrica.
# Quando a cauda se distribui à direita da média indica skew positiva, e quando a cauda
# está esticada à esquerda da média indica que a skew é negativa.

x1 <- seq(0,4,0.01)

plot(x1, dgamma(x,2,2),type="l",ylab="f(x)",xlab="x",col="red")
text(2.7,0.5,"positive skew")

plot(4-x1, dgamma(x,2,2),type="l",ylab="f(x)",xlab="x",col="red")
text(1.3,0.5,"negative skew")

# Dados de x
hist(x)
skew <- function(x){
  m3 <- sum((x-mean(x))^3)/length(x)
  s3 <- sqrt(var(x))^3
  m3/s3
}

skew(x) # Skew positiva

skew(x)/sqrt(6/length(x)) # Para saber se é diferente de zero

1-pt(2.949,28) # Probabilidade de obter um valor de 2.949 ao acaso 
# quando o valor de skew for zero.
# Os dados apresenta significante não normalidade (p<0.0032)

# Exemplo com dados de y.

# Kurtosis = relação com o pico de uma distribuição em relação ao plano do eixo x. Uma
# distribuição cúrtica é diferente da distribuição normal em forma de simo. Distribuição
# mais plana é chamada platicúrtica e uma distribuição mais aguda chamada leptocúrtica.

plot(-200:200,dcauchy(-200:200,0,10),type="l",ylab="f(x)",xlab="",yaxt="n",
     xaxt="n",main="leptokurtosis",col="red")
xv <- seq(-2,2,0.01)
plot(xv,exp(-abs(xv)^6),type="l",ylab="f(x)",xlab="",yaxt="n",
     xaxt="n",main="platykurtosis",col="red")

kurtosis <- function(x) {
  m4 <- sum((x-mean(x))^4)/length(x)
  s4 <- var(x)^2
  m4/s4 - 3 }

kurtosis(x)

# Teste com duas amostras

# Comparando variâncias: Fisher's F test, var.test
# Comparando médias: Student's t test, t.test
# Comparando médias com erros nao normais: Wilcoxon's rank test, wilcox.test
# Comparando duas proporções: binomial test, prop.test

# Variância

x <- rnorm(240)
y <- rnorm(300)
var(x)
var(y)
var.test(x,y) # Amostras não apresentam diferenças na variância

# Teste t de Student

# Amostras independentes, variâncias constantes, erros normalmente distribuídos

controle  <- c(24, 35, 32, 23, 25, 22, 27, 25, 21, 42, 20, 24)
experimento <- c(50, 64, 57, 52, 58, 51, 50, 56, 55, 54, 49, 48)
var.test(controle, experimento) # Amostras não apresentam diferenças na variância
t.test(controle, experimento) # Médias das amostras são diferentes
# Cálculo da média, sd, variância e boxplot

# Teste Wilcoxon

# Teste não paramétrico alternativo ao teste t

x <- runif(100)
y <- runif(100)
var.test(x,y) # Variância nao diferentes
wilcox.test(x, y) # Médias não apresentam diferenças
mean(x)
mean(y)

# Teste t pareado

# Observações pareadas
# Correlações entre duas medidas
# São medidas de um mesmo indivíduo ou tomadas de um mesmo local

temp.veg  <- c(22, 26, 27, 25, 28, 30, 25, 21, 23, 27, 25, 22) # Solo com vegetação
temp.exp <- c(35, 31, 37, 38, 40, 32, 31, 33, 37, 32, 30, 33) # Solo exposto
t.test(temp.veg, temp.solo, paired = TRUE) # Médias das amostras apresentam diferenças

data("ToothGrowth")
t.test(ToothGrowth$len[ToothGrowth$supp == "VC"], ToothGrowth$len[ToothGrowth$supp == "OJ"])

# Resultado:p < 0.05. A média das amostras entre os tratamentos são diferentes 
# (hipótese alternativa).

# Teste Kolmogorov-Smirnov
# 
# Determina se duas distribuições de probabilidades diferem uma da outra
# Determinar se uma distribuição subjacente difere de uma distribuição teórica
# O teste detcta diferença nas amostras em relação a escla, skewness
# Para amostras simples testa a distância entre dados observados e uma distribuição ideal
# Checa a normalidade d euma distribuição
# 
# Teste para amostra simples

runif(30)
prob.germ <- c(0.676434301, 0.448928425, 0.853052609, 0.473205741, 0.164652520, 0.278773492,
               0.335581518, 0.166231713, 0.118047846, 0.535419890, 0.398960461, 0.820369403,
               0.596322970, 0.469289374, 0.745087779, 0.273681890,
               0.194832060, 0.734254131, 0.091754496, 0.003610658, 0.395827094, 0.181725072,
               0.399015331, 0.484991677, 0.810088073, 0.984973677, 0.469517935,
               0.100947151, 0.043670013, 0.150498043)

ks.test(prob.germ, "pnorm")
hist(prob.germ)

# Reaultado: p < 0.05; rejeita-se a hipótese nula, distribuição diferente da normal
# As distribuições não são iguais

# Teste binomial

# Proporção de pessoas pobres que fizeram teste de covid é menor que a prop de ricos
# que realizaram o teste. ocorreu maior quantidade de pessoas com covid na população mais rica, 
# entretanto, a quantidade de pessoas que realizaram o teste foi maior.A questão levantada é 
# se essa proporção exerce diferença nas análises do teste binomial.

# Exemplo: ocorreu maior quantidade de pessoas com covid na população mais rica, entretanto
# a quantidade de pessoas que realizaram o teste foi maior.

prop.test(c(30,196),c(70,3270)) # 30 pessoas de 196 na população mais pobre

# A não significância na diferença entre as proporções indica que a população mais 
# rica não é mais contaminada que a população pobre pelo vírus.

# Correlação e covariância

# Duas variáveis contínuas são relacionadas?

data("cars")
plot(cars$dist ~ cars$speed)
var(cars$dist)
var(cars$speed)
var(cars$dist, cars$speed) # Covariância
var(cars$dist, cars$speed)/sqrt(var(cars$dist)*var(cars$speed)) # Coeficiente de correlação, 
# grau de relaçao entre as variáveis. Correlação de 80%
cor(cars$dist, cars$speed) # Correlação

# Bootstrap

install.packages("boot")
library(boot) # Pacote usado como exemplo

# boot(data, statistic, R)
# R = 10.000 (número de reamostragens)
# statistic = média dos dados

dados <- seq(from = 1, to = 50, length = 30)
dados

mymean <- function(dados,i) mean(dados[i])
myboot <- boot(dados, mymean, R=10000)
myboot
mean(dados)

# Interpretação
# valor original é a média de toda amostra
# bias: viés, diferença entre a média aritmetica e a média das amostras bootstrapped
# std. error: desvio padrão dos valores simulados

# Referência: The R Book - Second Edition Michael J. Crawley (2013)
