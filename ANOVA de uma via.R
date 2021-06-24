
# ANOVA de uma via # MEETUP 

# Passo 1: Carregar os pacotes

if(!require(dplyr)) install.packages("dplyr")
library(dplyr)                                
if(!require(RVAideMemoire)) install.packages("RVAideMemoire") 
library(RVAideMemoire)                                        
if(!require(car)) install.packages("car")   
library(car)                                
if(!require(psych)) install.packages("psych") 
library(psych)                                
if(!require(rstatix)) install.packages("rstatix") 
library(rstatix)                                
if(!require(DescTools)) install.packages("DescTools") 
library(DescTools)

# Passo 2: Carregar o banco de dados

# Importante: selecionar o diretório de trabalho (working directory)
# Isso pode ser feito manualmente: Session > Set Working Directory > Choose Directory

dados <- read.csv2('Dados ANOVA.csv', stringsAsFactors = T) # Carregamento do arquivo csv
View(dados)                                # Visualização dos dados em janela separada
glimpse(dados)                             # Visualização de um resumo dos dados


# Passo 3: Verificação da normalidade dos dados
## Shapiro por grupo (pacote RVAideMemoire)

#H0: distribuição dos dados é normal se p > 0,05
#H1: distribuição não segue padrões de normalidade se p < 0,05

byf.shapiro(ALT ~ TRAT, dados)


# Passo 4: Verificação da homogeneidade de variâncias
## Teste de Levene (pacote car)

#H0: dados apresentam homogênidade de variancias se p > 0,05
#H1: dados não apresentam homogênidade de variancias se p < 0,05

leveneTest(ALT ~ TRAT, dados, center=mean)


# Passo 5: Verificação da presença de outliers (por grupo) - Pacotes dplyr e rstatix

# Para ALT: (rstatix)
dados %>%   #identificar por grupo
  group_by(TRAT) %>% 
  identify_outliers(ALT)

## Pelo boxplot:
boxplot(ALT ~ TRAT, data = dados, ylab="Altura das Plantas (cm)", xlab="Tratamento")


# Passo 6: Realização da ANOVA

#H0: todos os grupos possuem médias iguais se p > 0,05
#H1: há pelo menos uma diferença entre as médias se p < 0,05

## Criação do modelo para ALT
anova_ALT <- aov(ALT ~ TRAT, dados)
summary(anova_ALT)

# Passo 7: Análise post-hoc - Pacote DescTools

# Uso do TukeyHSD
PostHocTest(anova_ALT, method = "hsd", conf.level=0.95)

# Passo 8 (opcional): Análise descritiva dos dados
describeBy(dados$ALT, group = dados$TRAT)

# Os dados foram analisados a partir de uma ANOVA de uma via 
#  que verificou o efeito da salinidade em plantas de manjericão e
# foi possível concluir que há um efeito 
# significativo da salinidade na altura das plantas (p>0,05).
