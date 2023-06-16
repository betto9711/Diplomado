a <- readline(prompt="Ingrese el primer número: ")
as.numeric(a)
b <- readline(prompt="Ingrese el segundo número: ")
as.numeric(b)
if (a>b){
  print("el primer numero es mayor")}

velocidad<- function(d,t){
  d1=d*1000 #convertimos km a m
  t1=t*60   #convertimos min a seg
  v=d1/t1
  return(v)
}
velocidad(6,1)

#funcion cuadratica
cuadratica<-function(a,b,c){
 d=b^2-4*b*c
   x=(-b+sqrt(d))/2*a
   x2=(-b-sqrt(d))/2*a
 return(x)
}
cuadratica(1,6,9)

