#2.1
x<-c(LETTERS[1:20])
x
#2.2
mimatriz <- matrix(1:100, nrow=10, ncol=10)
mimatriz
#2.3
id<-diag(3)
id
#2.4
lista<-list(x,mimatriz,id)
lista
#2.5
e<-c(25,58,55)
m<-c("rock", "pop", "baladas")
s<-c("si", "si", "si")
d<-data.frame(e,m,s)
d
#2.6 el error esta en que no son del mismo tipo, al ser una matrix se requiere ser de la misma variable
edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, 'Superman', 'Batman', NA, 'Batman')
matrix(edad, deporte, comic_fav)
#¿Qué cantidad de dinero sobra al repartir 10000$ entre 3 personas?
cs<-10000 %% 3
cs
#¿Es el número 4560 divisible por 3?
4560 %% 3==0
#3
z <- c(2:87)
z <- z[z%%7==0]
z
#4 Construya dos vectores, el primero con los números enteros desde 7 hasta 3, el segundo vector con los primeros cinco números positivos divisibles por 5. Sea A la condición de ser par en el primer vector. Sea B la condición de ser mayor que 10 en el segundo vector. ¿En cuál de las 5 posiciones se cumple A y B simultáneamente?
a<-c(7:3)
a
b<-c(1:25)[c(1:25)%%5==0]
b
if(a %% 2==0){print(a)}

factorial(8)
q <- readline(prompt="Ingrese el primer numero: ")
s <- readline(prompt="Ingrese el segundo numero: ")
if (q<s){print("el primer numero es mayor")}else{print("el segundo es mayor")}
