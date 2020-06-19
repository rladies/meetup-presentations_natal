# R-Ladies Natal - 1° Meetup
# Introdução ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Cálculos

log(42/7.3) # Função logaritmica
5+6+3+6+4+2+4+8+3+2+7 # Soma
5+6+3+5+9+ # Observe o prompt que retorna um "+" indicando função incompleta

# Pressione "Esc" após clicar no console para voltar o prompt >

5*8 # Multiplicação
4-9 # Subtração
2+3; 5*7; 3-7 # Podemos escrever as operações na mesma linha usando ";"
1.2e3 # Move três casas decimais à direita
1.2e-2 # Move duas casas decimais à esquerda
7^3 # 7 elevado ao cubo
3^2 # 3 elevado ao quadrado
3^2 / 2 # Elevado a dois e dividido por 2

# Funções matemáticas

floor(5.7) # Função: mais próximo número inteiro abaixo
ceiling(5.7) # Função: mais próximo número inteiro acima
log10(6) # log na base 10. Observe as opções de log fornecidas pelo R
pi # Valor de pi
sin(pi/3) # Seno
cos(pi/3) # Conseno
runif(100) # Gera 100 números randômicos entre 0 e 1
dist.norm <- rnorm(50) # Gera 100 números randômicos com distrubuição normal
dist.norm 
hist(dist.norm)
# Atribuições de variáveis

# Evite usar x ou y como nomes de variáveis
# Evite usar números ou símbolos
# Evite espaços em brancos ao nomear as variáveis
# Evite nomes muito longos
# O nome é dado através do símbolo <- (menor e sinal de menos) seguido do conjunto de dados

y <- 5 + 3 # Para maior legibilidade dos códigos, separde os operadores
y # Resultado de 5 + 3 
x <- c(1, 2, 7, 4, 9) # Observe a função concatenar
# Concatenar: juntar em uma cadeia ou sequência lógica
x # Aqui x não representa um cáculo, e sim um conjunto de valores
alt.arv <- c(1, 2, 7, 4, 9) # Ao dar o nome abreviado você saberá que o conjunto se refere a 
# altura de árvores, isso facilita a identificação das suas variáveis

# Operadores

# >= # Sinal maior igual 
# < # Menor que
# <= # Menor igual 
# == # Igual
# != # Não iguais
# * # Inserido em um modelo não indica multiplicação, indica mais quando se refere a variáveis 
# : # Inserido em um modelo não indica sequência, indica interação entre variáveis
# <- # Indica atribuição
# $ # Indexação de listas

datasets:: # Conjunto de dados do R 
data("iris") # Conjunto de dados iris
list(iris$Species) # Lista dos nomes das espécies
table(iris$Sepal.Length) # Valores do comprimento de sépalas

# Verifique sua tabela com funções vetoriais

names(iris) # Nome de todas as variáveis da tabela
str(iris) # Mostra quais variáveis são numéricas e categóricas
is.factor(iris$Species) # Verifica se a variável Specie é um fator
is.numeric(iris$Species) # Verifica se a variável Specie é numérica
levels(iris$Species) # Níveis de espécies
nlevels(iris$Species) # Número de níveis de espécies
summary(iris) # Mostra resultado dos valores máximos e mínimos, médias e medianas
sum(iris$Sepal.Length) # Soma dos valores de comprimento de sépalas

# Médias, medianas, desvios padrão, variância, etc.

mean(iris$Sepal.Length) # Valor médio do comprimento de sépalas
median(iris$Sepal.Length) # Valor da mediana
max(iris$Sepal.Length) # Valor máximo
min(iris$Sepal.Width) # Valor mínimo
range(iris$Sepal.Length) # Apresenta ambos valores máximo e mínimo
sd(iris$Petal.Length) # Desvio padrão
var(iris$Petal.Length) # Variância
length(iris$Sepal.Length) # Número de amostras
quantile(iris$Sepal.Length) # Quantis em intervalos regulares
with(iris, mean(Sepal.Length)) # Função que presenta mesma funcionalidade do indexador "$"
se <- with(iris, mean(Sepal.Length)/length(Sepal.Length)) # Calcula erro padrão

# OBS.: Prefira usar o indexador "$" ou "with" ao invés da função "attach"

# Ranqueamento dos dados das variáveis

sort(iris$Sepal.Width) # Coloca os valores do menor para o maior
rank(iris$Sepal.Length) # Rankeamento de todos os valores do menor para o maior

# Gerando repetições

rep(5, 10)
rep(6,7) # Repete o número 6 sete vezes
rep(1:8, 2) # De 1 a 8 repetindo a sequência duas vezes
rep(1:8, each = 2, times = 4) # Sequência de 1 a 8 de dois em dois repetindo os valores 4 vezes

# Gerando sequências

0:10 # Sequência de 0 a 10
seq(0, 20, 2) # Sequência de 0 a 20, de dois em dois números
seq(from = 0.04, by = 0.01, length = 11) # Partindo de 0.04 com 11 valores

# Função de igualdade all.equal

a <- 0.6 - 0.2 # Atribuição de variável a
b <- 0.4 # Atribuição de variável b
a == b # a e b são iguais? retorna False
all.equal(a, b) # a e b são iguais? Função mais adequada

# Função tapply e aggregate

comp.sepala <- (iris$Sepal.Length) # Extrai a variável comprimento de sépala
comp.petal <- (iris$Petal.Length) # Extrai a variável comprimento de pétala
sp <- (iris$Species) # Extrai a variável espécie
tapply(comp.petal, sp, mean) # Média do comprimento de pétala por espécie
tapply(comp.petal, sp, var) # Variância do comprimento de pétala por espécie
tapply(comp.petal, sp, sd) # desvio padrão do comprimento de pétala por espécie
aggregate(cbind(comp.sepala, comp.petal) ~ sp, iris, mean) # Resultados da média de comprimento
# de sépalas e pétalas por espécie; resultados de duas variáveis

# Localização de vetores

y <- c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11) # Conjunto de valores de y
which(y > 5) # Localiza a posição dos valores maiores que 5
which(y < 5)

# Transformando conjunto de variáveis

numerico <- as.numeric(factor(c("a","b","c"))) # Transformando valores categóricos em numéricos
is.numeric(numerico)
fator <- as.factor(c("1", "6", "4", "7")) # Transformando valores numéricos em categóricos
is.factor(fator)

# Matrizes - Função matrix

X <- matrix(c(1,0,0,0,1,0,0,0,1), nrow = 3) # Conjunto de valores em 3 linhas
vector <- c(1,2,3,4,4,3,2,1) # Definição de valores
V <- matrix(vector, byrow = T, nrow = 2) # Conjunto de valores em duas linhas
is.matrix(V) # Confirmar se o conjunto é uma matriz; retorna TRUE
rowSums(X) # Soma das linhas da matriz de X
colSums(X) # Soma das colunas da matriz de X
rowSums(V) # Soma das linhas da matriz de V
colSums(V) # Soma das colunas da matriz de V
# V[Linha, Coluna] # Colchetesão usados para selecionar valores
V[1:2,1:4] # Seleciona todos os valores
V[2,-1] # Seleciona valores na segunda linha e retira valor da primeira coluna

# Números randômicos 

runif(3) # Gera três número randômicos entre 0 e 1
runif(5) # Gera cinco número randômicos entre 0 e 1
set.seed(375) # Ao correr o código novamente, permite obter o mesmo conjunto de 
# números randômicos da última vez
runif(4)
current <-.Random.seed
runif(4)
runif(1:9) # Gera nove números randômicos

# Amostragem: função sample

# A função sample faz um embaralhamento dos conetúdos de um vetor em uma sequência randômica.
# Os mesmos números do vetor são mantidos.
# Números randômicos podem ser usados em planejamentos de desenho amostral (alocação de 
# tratamentos para indivíduos).

d <- c(3, 6, 4, 8, 3, 8, 4, 9, 4, 2, 8, 4, 8, 3)
sample(d)
sample(d, 5) # Faz um sorteio de 5 valores do conjunto
sample(d, replace = T) # Replace é um argumento da função sample e T é igual a True, indicando
# que deve haver repetição dos valores no sorteio
z <- c(4, 5, 7, 3)
sample(z, 3, replace = T)
sample(z, 3, replace = F) # Seleciona 3 números. Replace = False indica não repetição 
# dos valores

# Funções unique e duplicate

names <- c("Williams","Jones","Smith","Williams","Jones","Williams") # Objeto com lista de nomes
table(names) # A tabela mostra o número de repetições de cada nome
unique(names) # Mostra apenas os nomes listados, sem repetição
marcas <- c("Apple", "Samsung", "Lenovo", "Dell", "Samsung")
duplicated(marcas) # Indica o local onde ocorre duplicação através de true

# NAs, valores infinitos e não-numéricos

# O R indica quando um valor é infinito através do "Inf" ou "-Inf" (infinito e negativo)

3/0 
-12/0
1/0

# O R também indica valores que não são númericos (NaN). Exemplos:

0/0
Inf - Inf
Inf/Inf

# Para checar se um conjunto de dados apresentam valores não numéricos, infinitos ou NAs, use:
# is.infinit()
# is.finit()
# is.na()
# is.nan()
# na.omit() # Usado para omitir NAs de tabelas

# Algumas tabelas podem apresentar NAs o qual indica valores perdidos e que podem afetar as
# suas análises. Exemplo:

w <- c(4, 6, 8, 9, 3, NA, 6, 4, 9, 2)
is.na(w) # Indica através de true a linha com o valor perdido
w == "NA" # Outro método para encontrar NAs
# na.omit() # Usado para omitir NAs de tabelas
w.na <- na.omit(w) # Deve-se primeiro criar um objeto!
w.na
