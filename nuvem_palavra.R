
####Instalando os pacotes
install.packages(c("wordcloud", "tm", "textreadr", "tidytext"), dependencies = TRUE)

# pacote para manipulacao de dados
library(tidyverse)
library(tidytext)
# Leitura de pdf para texto
library(textreadr)
# Pacote de mineracao de texto 
library(tm)
# Grafico nuvem de palavras
library(wordcloud)

# Função para normalizar texto
Normaliza <- function(texto){
  
  # Normaliza texto
  texto %>% 
    chartr(
      old = "áéíóúÁÉÍÓÚýÝàèìòùÀÈÌÒÙâêîôûÂÊÎÔÛãõÃÕñÑäëïöüÄËÏÖÜÿçÇ´`^~¨:.!?&$@#0123456789",
      new = "aeiouAEIOUyYaeiouAEIOUaeiouAEIOUaoAOnNaeiouAEIOUycC                       ",
      x = .) %>% # Elimina acentos e caracteres desnecessarios
    str_squish() %>% # Elimina espacos excedentes 
    tolower() %>% # Converte para minusculo
    return() 
}

# Lista de palavras para remover
 palavrasRemover <- c(stopwords(kind = "pt"), letters) %>%
  as.tibble() %>% 
  rename(Palavra = value) %>% 
  mutate(Palavra = Normaliza(Palavra))

 # Arquivo pdf na web
arquivoPdf <- "https://www.scielo.br/pdf/csc/v25s1/1413-8123-csc-25-s1-2423.pdf"
 
# Criamos tabela com palavras e frequencias
 frequenciaPalavras <- arquivoPdf %>% 
   read_pdf() %>% 
   as.tibble() %>% 
   select(text) %>% 
   unnest_tokens(Palavra, text) %>% 
   mutate(Palavra = NormalizaParaTextMining(Palavra)) %>% 
   anti_join(palavrasRemover) %>% 
   count(Palavra, sort = TRUE) %>% 
   filter(Palavra != "")
 
 # Visualiza frequencia de palavras frequenciaPalavras 
 # Cria nuvem de palavras
 wordcloud(
  words = frequenciaPalavras$Palavra, 
  freq = frequenciaPalavras$n,
  min.freq = 1,
  max.words = 100, 
  random.order = FALSE, 
  rot.per = 0.30, 
  scale=c(5, .5),
  colors = brewer.pal(4, "Dark2")
)
 
