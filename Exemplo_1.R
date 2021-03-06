# R-Ladies Natal - 1� Meetup
# Introdu��o ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Pedindo ajuda

help("anova") # Ajuda sobre a ANOVA
?anova # Outra forma de pedir ajuda sobre a an�lise
?read.table # Solicitar ajuda sobre a fun��o read.table

# Outras fun��es 

find("plot") # Encontra o pacote da fun��o "plot"
example("plot") # Apresenta diferentes tipos de gr�ficos
example("lm") # Retorna um exemplo com a fun��o lm
demo(Hershey) # Apresenta diversos s�mbolos que podem ser usados em f�rmulas matem�ticas
 
# Pacotes

# Em "Packages" � poss�vel visualizar todos os pacotes dispon�veis com uma pequena descri��o
# sobre cada um deles.

# Acesse "https://cran.r-project.org/" clique em "Packages" > "CRAN Task Views" para ter a op��o 
# dos pacotes dispon�veis por t�picos de diferentes an�lises estat�sticas.

# fun��o library

library(ggplot2) # Verifica a instala��o do pacote
library(help="ggplot2") # Abre um documento com informa��es detalhadas sobre o pacote

# Instala��o de pacotes
# Exemplos

install.packages("car")
install.packages("lme4")
install.packages("nlme")
install.packages("RColorBrewer")
install.packages("tree")

# Linha de comando vs Script

# Voc� deve sempre abrir um novo script ao screver muitas linhas de comando ou para organizar
# suas an�lises de trabalhos de disciplinas ou TCC. Isso evita que voc� perca os c�digos
# e continue de onde parou ao salvar seu script em um diret�rio ou pasta.

# Clique em "File" > "Novo Script"
# Coloque informa��s sobre as an�lises do seu trabalho, seu nome e data
# Para salvar novo script: "Ctrl+S" ou "File" > "Save As"

