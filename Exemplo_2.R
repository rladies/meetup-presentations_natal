# R-Ladies Natal - 1� Meetup
# Introdu��o ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# C�lculos

log(42/7.3) # Fun��o logaritmica
5+6+3+6+4+2+4+8+3+2+7 # Soma
5+6+3+5+9+ # Observe o prompt que retorna um "+" indicando fun��o incompleta

# Pressione "Esc" ap�s clicar no console para voltar o prompt >

5*8 # Multiplica��o
4-9 # Subtra��o
2+3; 5*7; 3-7 # Podemos escrever as opera��es na mesma linha usando ";"
1.2e3 # Move tr�s casas decimais � direita
1.2e-2 # Move duas casas decimais � esquerda
7^3 # 7 elevado ao cubo
3^2 # 3 elevado ao quadrado
3^2 / 2 # Elevado a dois e dividido por 2

# Fun��es matem�ticas

floor(5.7) # Fun��o: mais pr�ximo n�mero inteiro abaixo
ceiling(5.7) # Fun��o: mais pr�ximo n�mero inteiro acima
log10(6) # log na base 10. Observe as op��es de log fornecidas pelo R
pi # Valor de pi
sin(pi/3) # Seno
cos(pi/3) # Conseno
runif(100) # Gera 100 n�meros rand�micos entre 0 e 1
dist.norm <- rnorm(50) # Gera 100 n�meros rand�micos com distrubui��o normal
dist.norm 
hist(dist.norm)
# Atribui��es de vari�veis

# Evite usar x ou y como nomes de vari�veis
# Evite usar n�meros ou s�mbolos
# Evite espa�os em brancos ao nomear as vari�veis
# Evite nomes muito longos
# O nome � dado atrav�s do s�mbolo <- (menor e sinal de menos) seguido do conjunto de dados

y <- 5 + 3 # Para maior legibilidade dos c�digos, separde os operadores
y # Resultado de 5 + 3 
x <- c(1, 2, 7, 4, 9) # Observe a fun��o concatenar
# Concatenar: juntar em uma cadeia ou sequ�ncia l�gica
x # Aqui x n�o representa um c�culo, e sim um conjunto de valores
alt.arv <- c(1, 2, 7, 4, 9) # Ao dar o nome abreviado voc� saber� que o conjunto se refere a 
# altura de �rvores, isso facilita a identifica��o das suas vari�veis

# Operadores

# >= # Sinal maior igual 
# < # Menor que
# <= # Menor igual 
# == # Igual
# != # N�o iguais
# * # Inserido em um modelo n�o indica multiplica��o, indica mais quando se refere a vari�veis 
# : # Inserido em um modelo n�o indica sequ�ncia, indica intera��o entre vari�veis
# <- # Indica atribui��o
# $ # Indexa��o de listas

datasets:: # Conjunto de dados do R 
data("iris") # Conjunto de dados iris
list(iris$Species) # Lista dos nomes das esp�cies
table(iris$Sepal.Length) # Valores do comprimento de s�palas

# Verifique sua tabela com fun��es vetoriais

names(iris) # Nome de todas as vari�veis da tabela
str(iris) # Mostra quais vari�veis s�o num�ricas e categ�ricas
is.factor(iris$Species) # Verifica se a vari�vel Specie � um fator
is.numeric(iris$Species) # Verifica se a vari�vel Specie � num�rica
levels(iris$Species) # N�veis de esp�cies
nlevels(iris$Species) # N�mero de n�veis de esp�cies
summary(iris) # Mostra resultado dos valores m�ximos e m�nimos, m�dias e medianas
sum(iris$Sepal.Length) # Soma dos valores de comprimento de s�palas

# M�dias, medianas, desvios padr�o, vari�ncia, etc.

mean(iris$Sepal.Length) # Valor m�dio do comprimento de s�palas
median(iris$Sepal.Length) # Valor da mediana
max(iris$Sepal.Length) # Valor m�ximo
min(iris$Sepal.Width) # Valor m�nimo
range(iris$Sepal.Length) # Apresenta ambos valores m�ximo e m�nimo
sd(iris$Petal.Length) # Desvio padr�o
var(iris$Petal.Length) # Vari�ncia
length(iris$Sepal.Length) # N�mero de amostras
quantile(iris$Sepal.Length) # Quantis em intervalos regulares
with(iris, mean(Sepal.Length)) # Fun��o que presenta mesma funcionalidade do indexador "$"
se <- with(iris, mean(Sepal.Length)/length(Sepal.Length)) # Calcula erro padr�o

# OBS.: Prefira usar o indexador "$" ou "with" ao inv�s da fun��o "attach"

# Ranqueamento dos dados das vari�veis

sort(iris$Sepal.Width) # Coloca os valores do menor para o maior
rank(iris$Sepal.Length) # Rankeamento de todos os valores do menor para o maior

# Gerando repeti��es

rep(5, 10)
rep(6,7) # Repete o n�mero 6 sete vezes
rep(1:8, 2) # De 1 a 8 repetindo a sequ�ncia duas vezes
rep(1:8, each = 2, times = 4) # Sequ�ncia de 1 a 8 de dois em dois repetindo os valores 4 vezes

# Gerando sequ�ncias

0:10 # Sequ�ncia de 0 a 10
seq(0, 20, 2) # Sequ�ncia de 0 a 20, de dois em dois n�meros
seq(from = 0.04, by = 0.01, length = 11) # Partindo de 0.04 com 11 valores

# Fun��o de igualdade all.equal

a <- 0.6 - 0.2 # Atribui��o de vari�vel a
b <- 0.4 # Atribui��o de vari�vel b
a == b # a e b s�o iguais? retorna False
all.equal(a, b) # a e b s�o iguais? Fun��o mais adequada

# Fun��o tapply e aggregate

comp.sepala <- (iris$Sepal.Length) # Extrai a vari�vel comprimento de s�pala
comp.petal <- (iris$Petal.Length) # Extrai a vari�vel comprimento de p�tala
sp <- (iris$Species) # Extrai a vari�vel esp�cie
tapply(comp.petal, sp, mean) # M�dia do comprimento de p�tala por esp�cie
tapply(comp.petal, sp, var) # Vari�ncia do comprimento de p�tala por esp�cie
tapply(comp.petal, sp, sd) # desvio padr�o do comprimento de p�tala por esp�cie
aggregate(cbind(comp.sepala, comp.petal) ~ sp, iris, mean) # Resultados da m�dia de comprimento
# de s�palas e p�talas por esp�cie; resultados de duas vari�veis

# Localiza��o de vetores

y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11) # Conjunto de valores de y
which(y > 5) # Localiza a posi��o dos valores maiores que 5
which(y < 5)

# Transformando conjunto de vari�veis

numerico <- as.numeric(factor(c("a","b","c"))) # Transformando valores categ�ricos em num�ricos
is.numeric(numerico)
fator <- as.factor(c("1", "6", "4", "7")) # Transformando valores num�ricos em categ�ricos
is.factor(fator)

# Matrizes - Fun��o matrix

X <- matrix(c(1,0,0,0,1,0,0,0,1), nrow = 3) # Conjunto de valores em 3 linhas
vector <- c(1,2,3,4,4,3,2,1) # Defini��o de valores
V <- matrix(vector, byrow = T, nrow = 2) # Conjunto de valores em duas linhas
is.matrix(V) # Confirmar se o conjunto � uma matriz; retorna TRUE
rowSums(X) # Soma das linhas da matriz de X
colSums(X) # Soma das colunas da matriz de X
rowSums(V) # Soma das linhas da matriz de V
colSums(V) # Soma das colunas da matriz de V
# V[Linha, Coluna] # Colchetes�o usados para selecionar valores
V[1:2,1:4] # Seleciona todos os valores
V[2,-1] # Seleciona valores na segunda linha e retira valor da primeira coluna

# N�meros rand�micos 

runif(3) # Gera tr�s n�mero rand�micos entre 0 e 1
runif(5) # Gera cinco n�mero rand�micos entre 0 e 1
set.seed(375) # Ao correr o c�digo novamente, permite obter o mesmo conjunto de 
# n�meros rand�micos da �ltima vez
runif(4)
current <-.Random.seed
runif(4)
runif(1:9) # Gera nove n�meros rand�micos

# Amostragem: fun��o sample

# A fun��o sample faz um embaralhamento dos conet�dos de um vetor em uma sequ�ncia rand�mica.
# Os mesmos n�meros do vetor s�o mantidos.
# N�meros rand�micos podem ser usados em planejamentos de desenho amostral (aloca��o de 
# tratamentos para indiv�duos).

d <- c(3, 6, 4, 8, 3, 8, 4, 9, 4, 2, 8, 4, 8, 3)
sample(d)
sample(d, 5) # Faz um sorteio de 5 valores do conjunto
sample(d, replace = T) # Replace � um argumento da fun��o sample e T � igual a True, indicando
# que deve haver repeti��o dos valores no sorteio
z <- c(4, 5, 7, 3)
sample(z, 3, replace = T)
sample(z, 3, replace = F) # Seleciona 3 n�meros. Replace = False indica n�o repeti��o 
# dos valores

# Fun��es unique e duplicate

names <- c("Williams","Jones","Smith","Williams","Jones","Williams") # Objeto com lista de nomes
table(names) # A tabela mostra o n�mero de repeti��es de cada nome
unique(names) # Mostra apenas os nomes listados, sem repeti��o
marcas <- c("Apple", "Samsung", "Lenovo", "Dell", "Samsung")
duplicated(marcas) # Indica o local onde ocorre duplica��o atrav�s de true

# NAs, valores infinitos e n�o-num�ricos

# O R indica quando um valor � infinito atrav�s do "Inf" ou "-Inf" (infinito e negativo)

3/0 
-12/0
1/0

# O R tamb�m indica valores que n�o s�o n�mericos (NaN). Exemplos:

0/0
Inf - Inf
Inf/Inf

# Para checar se um conjunto de dados apresentam valores n�o num�ricos, infinitos ou NAs, use:
# is.infinit()
# is.finit()
# is.na()
# is.nan()
# na.omit() # Usado para omitir NAs de tabelas

# Algumas tabelas podem apresentar NAs o qual indica valores perdidos e que podem afetar as
# suas an�lises. Exemplo:

w <- c(4, 6, 8, 9, 3, NA, 6, 4, 9, 2)
is.na(w) # Indica atrav�s de true a linha com o valor perdido
w == "NA" # Outro m�todo para encontrar NAs
# na.omit() # Usado para omitir NAs de tabelas
w.na <- na.omit(w) # Deve-se primeiro criar um objeto!
w.na
