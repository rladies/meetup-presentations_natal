# R-Ladies Natal - 1° Meetup
# Introdução ao R: passo a passo para iniciantes
# Coorganizadora e ministrante: Jeanne Franco
# Data: 17/06/2020

# Pedindo ajuda

help("anova") # Ajuda sobre a ANOVA
?anova # Outra forma de pedir ajuda sobre a análise
?read.table # Solicitar ajuda sobre a função read.table

# Outras funções 

find("plot") # Encontra o pacote da função "plot"
example("plot") # Apresenta diferentes tipos de gráficos
example("lm") # Retorna um exemplo com a função lm
demo(Hershey) # Apresenta diversos símbolos que podem ser usados em fórmulas matemáticas
 
# Pacotes

# Em "Packages" é possível visualizar todos os pacotes disponíveis com uma pequena descrição
# sobre cada um deles.

# Acesse "https://cran.r-project.org/" clique em "Packages" > "CRAN Task Views" para ter a opção 
# dos pacotes disponíveis por tópicos de diferentes análises estatísticas.

# função library

library(ggplot2) # Verifica a instalação do pacote
library(help="ggplot2") # Abre um documento com informações detalhadas sobre o pacote

# Instalação de pacotes
# Exemplos

install.packages("car")
install.packages("lme4")
install.packages("nlme")
install.packages("RColorBrewer")
install.packages("tree")

# Linha de comando vs Script

# Você deve sempre abrir um novo script ao screver muitas linhas de comando ou para organizar
# suas análises de trabalhos de disciplinas ou TCC. Isso evita que você perca os códigos
# e continue de onde parou ao salvar seu script em um diretório ou pasta.

# Clique em "File" > "Novo Script"
# Coloque informaçõs sobre as análises do seu trabalho, seu nome e data
# Para salvar novo script: "Ctrl+S" ou "File" > "Save As"

