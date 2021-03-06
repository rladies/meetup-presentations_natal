#Instala��o dos pacotes

install.packages("openxlsx")
install.packages("sampling")


#Carregando pacotes 

library(openxlsx)
library(sampling)

#Leitura dos dados


setwd("C:/Users/User/Desktop") #Sele��o do diret�rio
dados<-read.xlsx("topic6.xlsx") #leitura dos dados

#Visualizando o conjunto de dados

View(dados)

#AMOSTRA ALEAT�RIA SIMPLES SEM REPOSI��O

pilot<-sample(dados$NOTA,100) #amostra piloto
s2<-var(pilot) #vari�ncia da amostra pilot
N=length(dados$NOTA)

qnorm(0.025, 0, 1, lower.tail = FALSE) #valor de z

z=1.96
e<-0.1
n0<-(z^2*s2/e^2)
n<-n0/1+(n0/N)


# sele��o da amostra usando o pacote sampling
#srswowr=Simple random sampling without replacement
#srswr=	Simple random sampling with replacement

x <- srswor(n,N)
dados2 <- getdata(dados, x)
var(dados2$NOTA)
head(dados2)

 
#estimativa da m�dia
mean(dados2$NOTA)

#m�dia da popula��o
mean(dados$NOTA)



dados2$NOTA=as.numeric(dados2$NOTA)
dados$NOTA=as.numeric(dados$NOTA)

#Amostra de participantes

participantes<-read.xlsx("participantes.xlsx")
View(participantes)

# sele��o da amostra usando o pacote sampling

y <- srswor(1,87)
amostra <- getdata(participantes, y)
??sampling


