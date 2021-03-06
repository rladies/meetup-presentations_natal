# R-Ladies Natal - 1� Meetup
# Introdu��o ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Testes Cl�ssicos

# Amostras Simples

# Qual a m�dia?
# O valor m�dio � significativamente diferente do esperado?
# Qual o n�vel de incerteza do valor m�dio?
# Os valores s�o normalmente distribu�dos?
# Existem outliers?

summary(cars$speed)
hist(cars$speed)
y <- cars$speed

# Gr�fico para teste de normalidade

# quantile-quantile plot
# Dados normalmente distribu�dos = Linha reta
# Amostras pequenas pode indicar pouca credibilidade no teste de normalidade

par(mfrow=c(1,1)) # Apenas um gr�fico/uma janela
qqnorm(y)
qqline(y,lty=2) # Plot da linha

# O resultado apresenta apenas um leve formato de "S"

# Teste de normalidade

# Shapiro.wilk
# Hip�tese nula = dados normalmente distribu�dos

shapiro.test(y) # O resultado apresenta distribui��o normal (valor de p>0.05)
# Aceita-se a hip�tese alternativa

x <- exp(rnorm(30))
shapiro.test(x) # O resultado apresenta distribui��o diferente da normal (valor de p>0.05)

wilcox.test(x) # Resultado: aceita a hip�tese alternativa

# Skew e Kurtosis

# Skew = assimetria
# Skew mede at� que ponto uma distribui��o apresenta caudas longas, de um lado ou de
# outro da distribui��o. Uma distribui��o normal apresenta skew = 0, pois ela � sim�trica.
# Quando a cauda se distribui � direita da m�dia indica skew positiva, e quando a cauda
# est� esticada � esquerda da m�dia indica que a skew � negativa.

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

skew(x)/sqrt(6/length(x)) # Para saber se � diferente de zero

1-pt(2.949,28) # Probabilidade de obter um valor de 2.949 ao acaso 
# quando o valor de skew for zero.
# Os dados apresenta significante n�o normalidade (p<0.0032)

# Exemplo com dados de y.

# Kurtosis = rela��o com o pico de uma distribui��o em rela��o ao plano do eixo x. Uma
# distribui��o c�rtica � diferente da distribui��o normal em forma de simo. Distribui��o
# mais plana � chamada platic�rtica e uma distribui��o mais aguda chamada leptoc�rtica.

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

# Comparando vari�ncias: Fisher's F test, var.test
# Comparando m�dias: Student's t test, t.test
# Comparando m�dias com erros nao normais: Wilcoxon's rank test, wilcox.test
# Comparando duas propor��es: binomial test, prop.test

# Vari�ncia

x <- rnorm(240)
y <- rnorm(300)
var(x)
var(y)
var.test(x,y) # Amostras n�o apresentam diferen�as na vari�ncia

# Teste t de Student

# Amostras independentes, vari�ncias constantes, erros normalmente distribu�dos

controle  <- c(24, 35, 32, 23, 25, 22, 27, 25, 21, 42, 20, 24)
experimento <- c(50, 64, 57, 52, 58, 51, 50, 56, 55, 54, 49, 48)
var.test(controle, experimento) # Amostras n�o apresentam diferen�as na vari�ncia
t.test(controle, experimento) # M�dias das amostras s�o diferentes
# C�lculo da m�dia, sd, vari�ncia e boxplot

# Teste Wilcoxon

# Teste n�o param�trico alternativo ao teste t

x <- runif(100)
y <- runif(100)
var.test(x,y) # Vari�ncia nao diferentes
wilcox.test(x, y) # M�dias n�o apresentam diferen�as
mean(x)
mean(y)

# Teste t pareado

# Observa��es pareadas
# Correla��es entre duas medidas
# S�o medidas de um mesmo indiv�duo ou tomadas de um mesmo local

temp.veg  <- c(22, 26, 27, 25, 28, 30, 25, 21, 23, 27, 25, 22) # Solo com vegeta��o
temp.exp <- c(35, 31, 37, 38, 40, 32, 31, 33, 37, 32, 30, 33) # Solo exposto
t.test(temp.veg, temp.solo, paired = TRUE) # M�dias das amostras apresentam diferen�as

data("ToothGrowth")
t.test(ToothGrowth$len[ToothGrowth$supp == "VC"], ToothGrowth$len[ToothGrowth$supp == "OJ"])

# Resultado:p < 0.05. A m�dia das amostras entre os tratamentos s�o diferentes 
# (hip�tese alternativa).

# Teste Kolmogorov-Smirnov
# 
# Determina se duas distribui��es de probabilidades diferem uma da outra
# Determinar se uma distribui��o subjacente difere de uma distribui��o te�rica
# O teste detcta diferen�a nas amostras em rela��o a escla, skewness
# Para amostras simples testa a dist�ncia entre dados observados e uma distribui��o ideal
# Checa a normalidade d euma distribui��o
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

# Reaultado: p < 0.05; rejeita-se a hip�tese nula, distribui��o diferente da normal
# As distribui��es n�o s�o iguais

# Teste binomial

# Propor��o de pessoas pobres que fizeram teste de covid � menor que a prop de ricos
# que realizaram o teste. ocorreu maior quantidade de pessoas com covid na popula��o mais rica, 
# entretanto, a quantidade de pessoas que realizaram o teste foi maior.A quest�o levantada � 
# se essa propor��o exerce diferen�a nas an�lises do teste binomial.

# Exemplo: ocorreu maior quantidade de pessoas com covid na popula��o mais rica, entretanto
# a quantidade de pessoas que realizaram o teste foi maior.

prop.test(c(30,196),c(70,3270)) # 30 pessoas de 196 na popula��o mais pobre

# A n�o signific�ncia na diferen�a entre as propor��es indica que a popula��o mais 
# rica n�o � mais contaminada que a popula��o pobre pelo v�rus.

# Correla��o e covari�ncia

# Duas vari�veis cont�nuas s�o relacionadas?

data("cars")
plot(cars$dist ~ cars$speed)
var(cars$dist)
var(cars$speed)
var(cars$dist, cars$speed) # Covari�ncia
var(cars$dist, cars$speed)/sqrt(var(cars$dist)*var(cars$speed)) # Coeficiente de correla��o, 
# grau de rela�ao entre as vari�veis. Correla��o de 80%
cor(cars$dist, cars$speed) # Correla��o

# Bootstrap

install.packages("boot")
library(boot) # Pacote usado como exemplo

# boot(data, statistic, R)
# R = 10.000 (n�mero de reamostragens)
# statistic = m�dia dos dados

dados <- seq(from = 1, to = 50, length = 30)
dados

mymean <- function(dados,i) mean(dados[i])
myboot <- boot(dados, mymean, R=10000)
myboot
mean(dados)

# Interpreta��o
# valor original � a m�dia de toda amostra
# bias: vi�s, diferen�a entre a m�dia aritmetica e a m�dia das amostras bootstrapped
# std. error: desvio padr�o dos valores simulados

# Refer�ncia: The R Book - Second Edition Michael J. Crawley (2013)
