
#Jonathan Iván Reyes Spperman A01213385
#Juan Manuel Sánchez Soto A01213248

####### Ejercicio 1 ########
lista1<-list(uno=1:900,dos=50:500,tres=800:1000)
lista1$uno
lista1$dos
lista1$tres
#799
lista1$uno[799]
#101
lista1$dos[52]
#869
lista1$tres[70]

####### Ejercicio 2 ########
m1<-matrix(1:1000,100,100)
#Columna 98
m1[,98]
#Renglon 59
m1[59,]
#Columna 59 como matriz
m1[,59,drop=F]
#Numero 99
m1[99,1]

####### Ejercicio 3 ########
getwd()
setwd("C:/Users/JuanManuel/Documents/ITESM/8vo Semestre/Big Data")
census<-read.csv('cbp12co.txt',header=T)
census[,4]

####### Ejercicio 4 ########
con<-url("http://www.facebook.com","r");
pag<-readLines(con,10)
pag
