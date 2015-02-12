install.packages("plyr")
install.packages("stringr")

tryTolower = function(x)
{
  # create missing value
  # this is where the returned value will be
  y = NA
  # tryCatch error
  try_error = tryCatch(tolower(x), error = function(e) e)
  # if not an error
  if (!inherits(try_error, "error"))
    y = tolower(x)
  return(y)
}
positivas = scan("C:/Users/JuanManuel/Documents/R/Scripts/positive.txt", 
                 what="character", comment.char=";")
negativas = scan("C:/Users/JuanManuel/Documents/R/Scripts/negative.txt",
                 what="character", comment.char=";")

evalua.sentimientos = function(sentencias,
                                positivas,negativas){
  library("plyr");
  library("stringr")
  
  scores = laply(sentencias, function(sentencia, positivas, negativas){
    sentencia = gsub("[[:punct:]]","",sentencia)
    sentencia = gsub("[[:cntrl:]]","",sentencia)
    sentencia = gsub("\\d+","",sentencia)
    
    sentencia = tryTolower(sentencia)
    lista.palabras = str_split(sentencia,"\\s+")
    palabras = unlist(lista.palabras)
    positivas.match = match(palabras, positivas)
    negativas.match = match(palabras, negativas)
    
    positivas.match = !is.na(positivas.match)
    negativas.match = !is.na(negativas.match)
    
    score= sum(positivas.match)-sum(negativas.match)
    
    return (score)
    
    
  }, positivas, negativas)
  
  scores.df = data.frame(score = scores, texto = sentencias)
  return (scores.df)
}



evalua.sentimientos1 = function(sentencias,
                               positivas,negativas){
  #final_scores <- matrix('', 0, 3)
  library("plyr");
  library("stringr")
  
  scores = laply(sentencias, function(sentencia, positivas, negativas){
    insent=sentencia
    sentencia = gsub("[[:punct:]]","",sentencia)
    sentencia = gsub("[[:cntrl:]]","",sentencia)
    sentencia = gsub("\\d+","",sentencia)
    
    sentencia = tryTolower(sentencia)
    lista.palabras = str_split(sentencia,"\\s+")
    palabras = unlist(lista.palabras)
    positivas.match = match(palabras, positivas)
    negativas.match = match(palabras, negativas)
    
    pos1=positivas[positivas.match[!is.na(positivas.match)]]
    neg1=negativas[negativas.match[!is.na(negativas.match)]]
    
    positivas.match = !is.na(positivas.match)
    negativas.match = !is.na(negativas.match)
    
    score= sum(positivas.match)-sum(negativas.match)
    
    res=list(score,pos1,neg1)
    return(res)
  }, positivas, negativas)
  
  return(scores)
}

sent<-evalua.sentimientos1(textoLimpio,positivas,negativas)
sent
hist(as.integer(sent[,1]))


#posResult <- as.data.frame(evalua.sentimientos1(textoLimpio,negativas,positivas))
#negResult <- as.data.frame(evalua.sentimientos1(textoLimpio,negativas,positivas))
#posResult <- cbind(posResult, 'positive')
#colnames(posResult) <- c('sentence', 'neg', 'pos','sentiment')
#negResult <- cbind(negResult, 'negative')
#colnames(negResult) <- c('sentence','neg', 'pos','sentiment')

###combine the positive and negative tables
#results <- rbind(posResult, negResult)


