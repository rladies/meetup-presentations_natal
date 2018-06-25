####SCRIPT MEETUP R-LADIES (18/06/2018) 
####CURSO: R PARA PRINCIPIANTES
####OBJETIVO: ADQUIRIR NOÇÕES BÁSICAS DO PROGRAMA
####SERÃO ABORDADOS: OPERAÇÕES ARITMÉTICAS; ALGUMAS FUNÇÕES; AJUDA; VETORES; MATRIZES; DATAFRAME;...
####VISUALIZAÇÃO DE DADOS DA ESTAÇÃO METEOROLÓGICA DE SÃO LUÍS-MA / PERÍODO: 01/01/1980-31/12/2017
####NA VISUALIZAÇÃO DOS DADOS VEREMOS: DIMENSÕES; MODIFICAÇÃO DE CLASSES; GRÁFICOS E COMO SALVAR DADOS
####SE HOUVER UM PRÓXIMO ENCONTRO, APRENDEREMOS A FAZER O PREENCHIMENTO DE FALHAR POR MEIO DA REGRESSÃO LINEAR SIMPLES E MÚLTIPLA


####PARA INSTALAR PACOTES, USAR
install.packages("nome_do_pacote")
install.packages("openair")
library(openair)
library()

####PEDINDO AJUDA
help (boxplot)
?log
??variance
help.search ("linear regression")
file.choose()


####INICIANDO ATIVIDADES NO R 

##Soma
3+5

##Subtração
2-6

##Divisão
3/4

##Multiplicação
2*15

##Potenciação
2^5 #ou
2**5

# Operaciones combinadas
(3-2)+(2/3)+2*3^4

#Suponha que queremos saber a parte inteira de uma divisão:
#digamos, quantos 13 existem em 119
119 %/% 13
5%/%2

#suponha, agora, que queremos saber o restante (o que sobra quando
# 119 é dividido por 13), ou seja, o módulo
119 %% 13
5%%2

#O módulo é muito útil para testar se os números são ímpares ou pares:
#os números ímpares têm o valor do módulo=1 e os números pares têm o valor do módulo=1

9 %% 2
8 %% 2

#Fazendo arrendondamentos
floor(5.7) #para menor número inteiro

ceiling(5.7) #para maior número inteiro

rounded<-function(x) floor(x+0.5) #função de arredondamento
rounded(5.7)
rounded(5.4)

##Criando objetos



##raiz quadrada



##logaritmo




##fatorial



##combinação


####TIPOS DE OBJETOS

##Vetores (tem a função c() para criar vetores e armazenam mais de um valor)
#Vetor numérico
(L<-c(2,4,6,8,10,12,14,16,18,20))  #E se quisermos adicionar mais dois números pares ao vetor criado?

(L_1<-c(L, 22,24))

#Vetor com caracteres
(a<-c("norte","sul","leste","oeste"))

#Vetor lógico
(d<-c(T,F,F,F,T,F,T))

#Criando um vetor a partir de uma sequência

(alfa<-c(1:200))

#Vetor com uma seq de 0.2 em 0.2 desde 1 até 3
(sec1<-seq(1,3,0.2))

# Vetor "sec2" com 12 valores entre 1 e 14
(sec2<-seq(length=12,from=1,to=14))

##Matrizes

(alfamat<-matrix(alfa, ncol=10))
dim (alfamat)
summary(alfamat)
alfamat

#Adicionando mais uma coluna com a função "cbind"
(alfamat_1<-cbind(alfamat,201:220))

#Adicionando mais uma linha com a função "rbind"
(alfamat_1<-rbind(alfamat_1,seq(21,221,20)))
rownames(alfamat_1) <- LETTERS[1:21]
alfamat_1

##listas (combinar uma coleção de objetos em um objeto composto maior, ou seja, num único objeto)
#Ingestão de energia pré e pós-menstrual em um grupo de mulheres
intake.pre <- c(5260,5470,5640,6180,6390,6515,6805,7515,7515,8230,8770)
intake.post <- c(3910,4220,3885,5160,5645,4680,5265,5975,6790,6900,7335)

#Para combinar esses vetores individuais em uma lista 
mylist <- list(before=intake.pre,after=intake.post)
mylist

##Data frames
#Parecidos com matrizes: com linhas e colunas (duas dimensões). E cada coluna pode armazenar 
#elementos de diferentes tipos, diferente de uma matriz, que não pode fazer isso.
(d <- data.frame(intake.pre,intake.post))

#Informações da ingestão de energia de apenas uma coluna
d$intake.pre


####MEDIDAS NUMÉRICAS DESCRITIVAS (MND) - ESTATÍSTICA 
##Medidas de Tendência Central (Média, Mediana, Moda)

mean(alfamat_1)
mean(alfamat_1[,1])

median(alfamat_1) 
median(alfamat_1[,9]) 
min(alfamat_1)
max(alfamat_1)

# Valor mínimo e máximo
range(alfamat_1)

##Medidas de Variação/Dispersão (Variância, Desvio-padrão, por exemplo)

var(alfamat_1)
var(alfamat_1[,6])
sd(alfamat_1)
sd(alfamat_1[, 9])

# Correlação
# Usando dataset "rock"
rock
cor(rock)

### Gráficos estatísticos

# Usando os dados do vetor "peso"
peso<-c(67.6, 69.8, 68.5, 70.6, 68.1, 66.5, 65.1, 68.8, 70.3, 65.7, 66.2, 67.1, 67.7,
        68, 65.9, 65, 70.3, 68, 70, 65.2, 69.8, 68.5, 67.5, 66.2, 66.3, 68.1, 67.1, 66.2, 
        71.5, 66.4, 68.8, 67.5, 65.6, 68, 67, 71.3, 66.3, 62.4, 64, 65.4, 72, 72.4)

## Histogramas
windows ()
h1<-hist(peso)

# Especificando o número aproximado de classes
h2<-hist(peso,breaks=9)

# Especificando que a frequência será relativa
h3<-hist(peso,breaks=5,freq=F)

# Título, etiquetas dos eixos e cores
h4<-hist(peso,breaks=5,freq=F,main="Histograma de pesos",xlab="peso",ylab="Frecuencias relativas",col="green")

# Especificando os limites dos eixos x e y.
h5<-hist(peso,breaks=5,freq=F,main="Histograma de pesos",xlab="peso",ylab="Frecuencias relativas",col="green",
         xlim=c(60,74),ylim=c(0,0.25))

# Para eliminar a borda
h6<-hist(peso,breaks=5,freq=F,main="Histograma de pesos",xlab="peso",ylab="Frecuencias relativas",col="green",
         xlim=c(60,74),ylim=c(0,0.25), border=F)

## Gráfico de Caixas/Boxplots

# Especificacão na extensão dos bigodes, título, cor e etiquetas dos eixos
windows ()
boxplot(peso,range=1.5,main="Gráfico de caixas",col="yellow",xlab="Gráfica",ylab="valores",
        col.main=12)

# Especificando a escala
boxplot(peso,range=1.5,main="Gráfico de caixas",col="yellow",xlab="Gráfica",ylab="valores",
        col.main=12,boxwex=0.3)

# Boxplot horizontal
boxplot(peso,range=1.5,main="Gráfico de caixas",col="yellow",xlab="Gráfica",ylab="valores",
        col.main=12,boxwex=0.3,horizontal=T)

## Gráfico de Barras

# Usando dados do vetor "grupo"

grupo<-c("A","A","B","B","B","B","AB", "AB","AB","O","O","AB","AB","A","A","A","B","B","B")

windows ()
barplot(table(grupo))

# Especificando as cores
barplot(table(grupo),col=c("blue","green","red","yellow"))

VADeaths
?VADeaths
# Usando dados de VADeaths
barplot(VADeaths)

# Especificação de barras justapostas
barplot(VADeaths,beside=T)

# Barras empilhadas com especificação na densidade de linhas hachuradas
barplot(VADeaths,beside=F,col=c(1,2,3,4,5),density=c(5,15,25,35))


## Gráficos de Setores/Circulares (Pizza)

windows ()
pie(c(0.1,0.6,0.3))

# Especificação de etiquetas
pie(c(0.1,0.6,0.3),labels=c("A","B","C"))

# Especificação de cores
pie(c(0.1,0.6,0.3),labels=c("A","B","C"),col=c("yellow","green","blue"))

# Especificação na densidade de linhas hachuradas
pie(c(0.1,0.6,0.3),labels=c("A","B","C"),col=c("yellow","green","blue"),density=c(15,24,38))


####UMA SUGESTÃO DE UM PRÓXIMO MEETUP: APENAS GRÁFICOS
##Saídas gráficas (linhas, pontos, textos)
windows()
x <- 1:9
y <- 1:9
plot(x, y, type = "n")
lines(c(2, 8), c(8, 8), lwd = 2, col="red")
lines(c(2, 8), c(7, 7), lty = 2, lwd = 2,col="blue")
lines(c(2, 8), c(6, 6), lty = 3, lwd = 8,col="yellow")
lines(c(2, 8), c(5, 5), lty = 4, lwd = 4,col="pink")
lines(c(2, 8), c(4, 4), lty = 5, lwd = 2,col="orange")
lines(c(2, 8), c(3, 3), lty = 6, lwd = 2,col="red")
lines(c(2, 8), c(5, 6), lty = 9, lwd = 8,col="red")

windows()
x <- 1:10
y <- 1:10
plot(x, y, type = "n")
points(1:10, rep(8, 10 ), pch = 0:9, col = 1:10, cex = 1.5)
points(1:10, rep(6, 10), pch = 10:19, col = 1:10, cex = 1.5 )
points(1:10, rep(4, 10), pch = c(".", "a", "o", "v", "s",
	"c", "&", "$", "@", "%"), col = 1:10, cex = 1.5)

windows()
x <- 1:10
y <- 1:10
plot(x, y, type = "n")
points(seq(1, 9, by = 2 ), rep(5, 5), pch = "+", col = "gray",
	cex = 2)
text(1, 5, "c (0,0)", adj = c(0, 0),col="blue")
text(3, 5, "c(0,1)", adj = c(0, 1),col="yellow")
text(5, 5, "c(1,0)", adj = c(1, 0),col="pink")
text(7, 5, "c(0,NA)", adj = c(1, NA),col="orange")
text(9, 5, "c(NA,NA)", adj = c(0.5, 0.5),col="red")
text(5, 7, "Rladies", adj = c(0, 0), srt = 45,col="black")
text(5, 7, "Rladies", adj = c(0, 0), srt = 90,col="orange")
text(5, 7, "Rladies", adj = c(0, 0), srt = 180,col="darkgreen")
text(5, 7, "Rladies", adj = c(0, 0), srt = 270,col="darkblue")
text(5, 7, "Rladies", adj = c(0, 0), srt = 360,col="chocolate")



windows ()
plot(1:10, 1:10, type = "n", ann = FALSE, axes = FALSE, main = "Bandeira do BRASIL")
rect(1, 2, 10, 9, col = "darkgreen")
polygon(c(5.5, 1.2, 5.5, 9.8), c(2.2, 5.5, 8.8, 5.5), col = "yellow")
symbols(5.5, 5.5, 2, bg = rgb(0, 0, 1), add = TRUE)
rect(3.50, 5.3, 7.46, 5.7, col = "white")
text(5.5, 5.5, "ORDEM E PROGRESSO ", col = "black")
points(5.99, 5.99, , pch = 8, col = "white")
points(c(6.06, 5.91, 6.07, 6.13, 6.24, 5.68, 5.29, 5.19, 5.03, 4.87, 5.13, 5.18, 5.38), c(5.14, 4.82, 4.67, 4.99,
      5.1, 4.9, 4.55, 4.86, 5.06, 5.06, 4.69, 4.47, 4.31),pch= 8, col = "white")
points(c(5.73, 5.88, 5.51, 5.79, 5.96, 6.08, 5.34, 5.5, 5.23, 5.12, 5.55, 5.87, 6.04),
	 c(5.01, 4.58, 4.66, 4.84, 5.1, 4.71, 4.88, 4.56, 4.55, 4.95, 4.42, 4.49, 4.64), pch = 8 ,
	 col = "white")
mtext("AVANTE BRASIL: PÁTRIA AMADA", side = 1, line = -2, font=3, cex=2, adj=c(0.5,0.5))


####ACESSANDO SÉRIE HISTÓRICA NO SITE DO INMET (PASSO A PASSO)
#1. Acessar INMET
#2. Em "ESTAÇÕES E DADOS", clicar sobre BDMEP-DADOS HISTÓRICOS
#3. Acessar o BDMEP (para quem for cadastrado) ou clicar em novo cadastro
#4. Fornecer dados de acesso 
#5. Em dados históricos, escolher o tipo de série histórica a ser trabalhada
#6. após clicar na série escolhida, selecionar o período desejado dos dados, região, estado
# as variáveis de interesse e clicar em pesquisa. Em seguida, clicar ok para a confirmação
# da pesquisa
#7. Vai aparecer um mapa com as estações meteorológicas do local de interesse, então, deve-se
#clicar sobre a estação de interesse, caso queira trabalhar com todas, a seleção é feito 
#um a um
#8. Para salvar os dados da estação, há duas formas:
#8.1 Salvar como link utilizando o botão direito do mouse (armazenar na área de trabalho),
# e abrir o arquivo utilizando o editor Notepad++, por exemplo
#8.2 Ou, clicar em "Baixar os dados", selecionar toda a informação ou a parte principal, 
# copiar e colar no bloco de notas. Logo após, salvar o arquivo em uma pasta específica para
# trabalhar seus dados
#9 Procedimentos no bloco de notas
#9.1 Substituir "Data" por "dia;mes;ano", ou seja, utilizar ponto e vírgula como separador
#9.2 Clicar em Editar+Substituir para poder substituir todas as barras por ; e em seguida, 
#salvar o arquivo
#10 Agora, lendo o arquivo .txt no excel
#10.1 Abrir o excel
#10.2 Abrir o arquivo utilizando uma pasta em amarelo na parte superior à esquerda do programa
#10.3 Selecionar o arquivo .txt e abrir
#10.4 O tipo deve permanecer "Delimitado" e clicar na caixinha "Meus dados possuem cabeçalho" e avançar
#10.5 Escolher ; como delimitador e avançar
#10.6 Não mexer em nada e concluir
#11 Preenchendo as célular vazias por NA
#11.1 Selecionar somente a área referente aos dados
#11.2 Clicar em "Localizar e Selecionar" na parte superior à direita, em seguida, em substituir
#11.3 Na janela de "localizar", deixar vazio mesmo
#11.4 Em "Substituir por", digitar NA e clicar em "Substituir tudo"
#11.5 Após substituído, fechar a janela
#11.6 Agora, é "Salvar como" no formato .csv e rodar no R 


##Limpando ambiente
rm(list = ls())

####TRABALHANDO OS DADOS COM FALHAS

####VERIFICANDO DIRETÓRIO QUE ESTÁ SENDO TRABALHADO

setwd ("C:/UFRN/R_ladies/Minicurso_1_18062018") #Aqui, entre parênteses, deve ser colocado o diretório em que o script está salvo
getwd () #Vai confirmar o diretório, se você errou o endereço, o R vai acusar erro

####VISUALIZANDO OS DADOS 
##Criando um objeto referente à nossa base de dados do INMET

(data_sluis<-read.table("estacao_saoluis_mensal.csv", header=T, sep=";",dec=","))

attach (data_sluis)
ls()

View (data_sluis)
str (data_sluis)


####VISUALIZANDO AS DIMENSÕES DO BD (Primeiros dados do cabeçalho)

dim (data_sluis)
head (data_sluis) 
tail (data_sluis)
names (data_sluis)
summary (data_sluis)

##Testando gráfico
boxplot(InsolacaoTotal~Mes,data_sluis)

####MODIFICANDO CLASSE DE DADOS
data_sluis$VelocidadeVentoMedia <- as.numeric(as.character(data_sluis$VelocidadeVentoMedia))
data_sluis$InsolacaoTotal <- as.numeric(as.character(data_sluis$InsolacaoTotal))
data_sluis$PrecipitacaoTotal <- as.numeric(as.character(data_sluis$PrecipitacaoTotal))
data_sluis$TempMaximaMedia <- as.numeric(as.character(data_sluis$TempMaximaMedia))
data_sluis$TempMinimaMedia <- as.numeric(as.character(data_sluis$TempMinimaMedia))
data_sluis$UmidadeRelativaMedia <- as.numeric(as.character(data_sluis$UmidadeRelativaMedia))

str (data_sluis)

####ALTERANDO NOME DAS VARIÁVEIS

colnames(data_sluis)[6] <- "Vel_Med_Vento" 
names(data_sluis) [7] <- "Insol_Tot"
names(data_sluis) [8] <- "Prec_Tot"
names(data_sluis) [9] <- "Temp_Max_Med"
names(data_sluis) [10] <- "Temp_Min_Med"
names(data_sluis) [11] <- "UR_Med"

names (data_sluis)
boxplot(Insol_Tot~Mes,data_sluis)

####VISUALIZANDO INFORMAÇÕES DA "Tabela de Frequência das Variáveis" 

#Para a frequência mensal 
table(data_sluis[ ,6])

#Para a frequência anual 
table(data_sluis[ ,7])

table(data_sluis[ 11])

####VISUALIZANDO OS GRÁFICOS (MND)
names(data_sluis)

##Histograma
windows ()
hist(Vel_Med_Vento)
hist(Temp_Min_Med,breaks=8,xlab="Temperatura (°C)",ylab="Frequência",main="Distribuição da Temperatura Mínima Média do Município de São Luís",
	las=1,col="blue", ylim=c(0,20))


##Dispersão
windows ()
plot(Temp_Max_Med~Insol_Tot)
plot(Temp_Max_Med~Insol_Tot, las=1, pch=16, cex=0.8,cex.axis=1.3, cex.lab=1.3,main=NULL, col="red")

##Boxplot
windows ()
boxplot(Prec_Tot~Mes, las=1, ylab="Precipitação (mm)", xlab= "Mês", main=NULL)

#Gráficos boxplots mais refinados

#Temperaturas Mínima (col=45) e Máxima (col=yellow): MENSAL
windows ()
par(oma = c (0, 1, 1, 1)) #
par(mgp = c(3, 1, 0.5))

boxplot(Prec_Tot ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="Precipitação (mm)", ylim= c(0,850), xlab="Mês",
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Precipitação Total Acumulada - São Luís", cex=2.0, col="black", font=1))

boxplot(Temp_Max_Med ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="Temperatura (°C)", xlab="Mês", ylim= c(28,34),
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Temperatura Máxima Média - São Luís", cex=2.0, col="black", font=1))

boxplot(UR_Med ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="UR (%)", ylim= c(75,95), xlab="Mês",
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Umidade Relativa Média - São Luís", cex=2.0, col="black", font=1))


####DIVIDINDO A JANELA DO GRÁFICO: ajustando as funções para visualização das temps. mínima e máxima, e precipitação

windows ()
par(mfrow=c(1,3)) #Número de figuras na página
par(oma = c (0, 2, 1, 1)) #controla o gráfico em relação às margens, a ordem é parte inferior, esquerda, superior, direita
par(mgp = c(2.8, 1, 0.5)) #controla a distância de alguns componentes dos eixos em relação a borda da região do gráfico.

boxplot(Prec_Tot ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="Precipitação (mm)", ylim= c(0,850), xlab="Mês",
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Precipitação Total Acumulada - São Luís", cex=2.0, col="black", font=1))

boxplot(Temp_Max_Med ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="Temperatura (°C)", xlab="Mês", ylim= c(28,34),
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Temperatura Máxima Média - São Luís", cex=2.0, col="black", font=1))

boxplot(UR_Med ~ Mes, las=1, data = data_sluis, col = "45", notch = FALSE, ylab="UR (%)", ylim= c(75,95), xlab="Mês",
par(c(font.lab=1,cex.lab=1.0,col.lab="black")), main= list("Umidade Relativa Média - São Luís", cex=2.0, col="black", font=1))

####SALVANDO OS DADOS
##Antes, vamos excluir algumas colunas

View (data_sluis)

data_sluis_1<-subset(data_sluis)[,-c(1,2,5)]
list (data_sluis_1)
View (data_sluis_1)


path_out <- "C:/UFRN/R_ladies/Minicurso_1_18062018/"
arq_out_1 <- "estacao_sluis_19802017.txt"
write.table(x = data_sluis_1, file = paste0(path_out, arq_out_1),
            quote = F, sep = ";", row.names = F, col.names = T)


####SITES DE PESQUISA MUITO BONS E QUE TÊM AJUDADO-ME BASTANTE ACERCA DO R

##https://cantinhodor.wordpress.com/ (O prof. Marcos Vital da UFAL disponibiliza uma apostila muito boa para
#nós, iniciantes no R;

##https://www.r-bloggers.com/ 
 
##http://r-br.2285057.n4.nabble.com/  (A R-br, que é a lista oficial no Brasil de discussão sobre o R)

##https://www.r-project.org/mail.html

##youtube

##ESCALA DE CORES PARA GRÁFICOS NO R
#http://www.ufpa.br/dicas/htm/htm-cor2.htm


####OBRIGADA
windows()
plot(1:10, 1:10, type = "n", ann = FALSE, axes = FALSE)
symbols(5, 5, 2, add = TRUE, inc = FALSE)
symbols(c(4, 6), c(6, 6), c(0.3, 0.3), add = TRUE, inc = FALSE)
points(c(4.041275, 6.086176), c(6.006826, 6.006826), pch = c(44,44), cex = 4, col = "green")
points(c(7.022771, 2.997524) , c(4.974744, 5.011604), pch = c(41,40), cex = 7, col="pink")
segments(4.467296, 3.426621, 5.617553, 3.297611, col = "red")
segments(4.22, 7.1, 5.04, 9, 1)
segments(5.04, 9.01, 5.96, 7.02 )
symbols(5.16, 8.97, 0.2, add = TRUE, inc = FALSE, bg = "pink")
points(4.989172, 4.827304, pch = 94, cex = 3)
points(c(3.49, 3.54, 3.84, 4.07), c(4.71, 4.31, 4.21, 4.6), pch = 42, col = 5:8)
points(c(5.81, 6.05, 6.41, 6.13), c(4.53, 4.01, 4.18, 4.66),pch = 42, col = 5:8)
mtext("OBRIGADA E ATÉ A PRÓXIMA", side = 1, line = -2, font=3, cex=2, adj=c(0.5,0.5))