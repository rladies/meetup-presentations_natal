#Instalação dos pacotes

install.packages("openxlsx")
install.packages("sampling")


#Carregando pacotes 

library(openxlsx)
library(sampling)

#Leitura dos dados


setwd("C:/Users/User/Desktop") #Seleção do diretório
dados<-read.xlsx("topic6.xlsx") #leitura dos dados

#Visualizando o conjunto de dados

View(dados)

#AMOSTRA ALEATÓRIA SIMPLES SEM REPOSIÇÃO

pilot<-sample(dados$NOTA,100) #amostra piloto
s2<-var(pilot) #variância da amostra pilot
N=length(dados$NOTA)

qnorm(0.025, 0, 1, lower.tail = FALSE) #valor de z

z=1.96
e<-0.1
n0<-(z^2*s2/e^2)
n<-n0/1+(n0/N)


# seleção da amostra usando o pacote sampling
#srswowr=Simple random sampling without replacement
#srswr=	Simple random sampling with replacement

x <- srswor(n,N)
dados2 <- getdata(dados, x)
var(dados2$NOTA)
head(dados2)

 
#estimativa da média
mean(dados2$NOTA)

#média da população
mean(dados$NOTA)



dados2$NOTA=as.numeric(dados2$NOTA)
dados$NOTA=as.numeric(dados$NOTA)

#Amostra de participantes

participantes<-read.xlsx("participantes.xlsx")
View(participantes)

# seleção da amostra usando o pacote sampling

y <- srswor(1,87)
amostra <- getdata(participantes, y)
??sampling


