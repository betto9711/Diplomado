#libreria que estudiaremos
install.packages("Datetime")
#Proporciona métodos para trabajar con fechas nominales, horas y duraciones
#Este paquete proporciona un enfoque más casual para casos de apoyo que no requieren un tratamiento riguroso.
#La primera función que veremos sera Sys.Date(), la cual nos da el dia de hoy
Sys.Date()
#Para crear una fecha en R el modo más sencillo es utilizar la función as.Date()
#Formatos que se tienen
# %d -> dia (1-31)
#%a -> dia semana abreviado 3 letres
#%A -> dia semana completo
#%m -> mes (1-12)
#%b -> mes abreviado a 3 letras
#%B -> mes completo
#%y -> año dos digitos
#%Y -> año 4 digitos
#El formato es  “año-mes-día” (yyyy-mm-dd)
muertos<-as.Date("2023-05-01")
muertos
#Podemos ver que la clase nos da una fecha
class(muertos)
#Si damos el formado de fecha a (dd-mm-yyyy) tenemos que expecificar
muertos=as.Date("01/11/2023",format="%d/%m/%Y")
muertos
muertos=as.Date("1 Noviembre 2023",format="%d %B %Y")
muertos
#Es similar para listas
dias=c("08/04/64","01/05/97","25/11/97","21/12/97")
dias
as.Date(dias, format="%d/%m/%y")
#Conversión de variables tipo fecha a variables tipo carácter
#dos opciones 
#primera con as.character
cm=as.character(muertos)
cm
class(cm)
#segunda con format
fm=format(muertos)
fm
class(fm)
#Presentar fecha como caracteres en distintos formatos
as.character(muertos, format="%d %b %Y")
as.character(muertos, format="%A, %d de %B de %Y")
as.character(muertos, format="%d/%m/%y")
#Podemos tomar partes de nuestra fecha
format(muertos, "%A")
format(muertos, "%B")
format(muertos, "%d")
format(muertos, "%y")
format(muertos, "%Y")
#aplica para las listas
cu=c("08/04/64","21/12/68","01/05/97","25/11/97")
cu
f=as.Date(cu, format = "%d/%m/%y")
f
format(f, "%B")
format(f, "%y")
format(f,"%b")
format(f,"%d")
#funcion unclass nos da los dias transcurridos desde 1/01/1970 hasta la fecha dada
unclass(as.Date("1970-1-1"))
#nos da 0 dias transcurridos
unclass(as.Date("1969-12-20"))
#nos faltan doce dias para la fecha
unclass(as.Date("1997-11-25"))
#dias transcurridos hasta mi fecha de nacimiento
unclass(Sys.Date())
#nos dice cuantos dias han pasado hasta hoy
#operaciones con fechas
##diferencia de fechas
dia1=as.Date("25/12/2012",format="%d/%m/%Y")
dia2=as.Date("20/1/2013",format="%d/%m/%Y")
dia3=as.Date("25/12/2013",format="%d/%m/%Y")
dia2-dia1
#diferencia en min, horas, dias, semanas, meses, años
#funcion difftime
#Semanas
difftime(dia3, dia1, units="weeks")
#dias
difftime(dia3, dia1, units="days")
#horas
difftime(dia3, dia1, units="hours")
#min
difftime(dia3, dia1, units="mins")
#segundos
difftime(dia3, dia1, units="secs")
#suma y diferencia, fecha y entero
#a la fecha se le puden sumar un entero el cual sera el incremento en dias
dia3-15
dia2+10
#La función diff() calcula la diferencia, en días, entre los términos sucesivos de un vector de fechas (declaradas con clase date):
dias=as.Date(c("1/10/2005","2/2/2006","3/4/2006","6/8/2006"),format="%d/%m/%Y")
diff(dias)
#Sucesiones de fechas
#funcion seq() para crear una secuencia
#puede ser entre dos dias y dar la longitud
seq(dia1,dia3,length=10)
seq(dia1,dia3,by=15)
#Especificar el tiempo
#semanas
seq(dia1,dia3,by="week") 
#meses
seq(dia1,dia3,by="month")
#2semanas
seq(dia1,dia3,by="2 weeks")
#3 meses
seq(dia1,dia3,by="3 months")
#funcion posixct
#para especificar fecha o fecha y hora
#ejemplo de dia
#aclarar formato
fh1=as.POSIXct("01/10/1983",format="%d/%m/%Y")
class(fh1)
#ejemplo de dia y hora
#aclarar formato
fh2=as.POSIXct("01/10/1983 22:10:00",format="%d/%m/%Y %H:%M:%S")
class(fh2)
#R aplica usos horarios, zona temporal
# R muestra los nombres de todos los husos horarios mediante la función OlsonNames(). En concreto, Canarias se encuentra en la zona WET (Western European Time), que pasa a denominarse WEST (Western European Summer Time) cuando se activa el horario de verano.
#Si quisiéramos especificar una fecha y hora correspondiente a otro huso horario deberíamos especificarlo mediante la opción tz; por ejemplo, si la hora que queremos introducir corresponde a la ciudad de Los Angeles en California EEUU, que está incluída en el huso horario PDT (Pacific Daylight Time), usaríamos:
as.POSIXct("01/10/1983 22:10:00",format="%d/%m/%Y %H:%M:%S", tz="PDT")
#Nos da la hora actual con la zona de usos horarios
Sys.time()
#Operaciones con Fechas/Horas de clase POSIXct
#la clase POSIXct almacena nuestros datos en segundos
#si realzamos operaciones con numeros enteros este los manejara en segundos
fh=as.POSIXct("1997-11-25")
fh
#realimazos una suma
fh+20
#realizamos una resta
fh-50
#comparando dos fechas
fc=as.POSIXct("1997-05-01")
fc
fh-fc
#Al calcular la diferencia entre dos horas, se tiene en cuenta el efecto del cambio de horario en el horario de verano respecto al de invierno
as.POSIXct("2013-03-10 08:32:07") - as.POSIXct("2013-03-09 23:55:26")
#Fecha y hora en la clase POSIXlt
#La clase POSIXlt se diferencia de POSIXct en que almacena sus valores en forma de lista. 
#Esta lista contiene el año, mes, dia, hora, minutos y segundos en componentes separadas, por lo que su extracción resulta sencilla.
fm=as.POSIXlt("1997-11-25 02:35:24")
fm
#podemos extraer cada parte de la fecha
#los segundos
fm$sec
#los minutos
fm$min
#la hora
fm$hour
#el dia
fm$mday
#el mes
fm$mon
#el año
fm$year
#el dia del año
fm$yday
##el dia de la semana
fm$wday
#el uso horario
fm$zone
install.packages("lubridate")
library(lubridate)
#Proporciona métodos para trabajar con fechas nominales, horas y duraciones
#Este paquete proporciona un enfoque más casual para casos de apoyo que no requieren un tratamiento riguroso.
#La primera función que veremos sera sys.getlocale("LC_TIME") la cual nos brinda datos de nuestra ubicacion y tiempo
Sys.getlocale("LC_TIME")
#nos permite conocer el dia en que estamos
today()
#Devuelve la fecha y hora de ese momento.
now()
#devuelve la hora de la fecha
hour(now())
#devuelve los minutos de la fecha
minute(now())
#devuelve los segundos de la fecha
second(now())
#Separa el año, mes y día de una fecha.
h<- today()
h
rbind(year(h),month(h),day((h)))
#regresa el dia de la semana de la fecha
#asignando un valor 1-7, semana inglesa
wday(h)
#colocar la etiqueda de label para nombre D-s
wday(h, label = TRUE)
#formato de fecha dia/mes/año
c<-dmy("25/11/1997")
#obtenemos sus partes
w<-wday(c) #nos da el numero del dia
m<-mday(c)
y<-yday(c)
rbind(w,m,y)
wday(c, label = TRUE)#agregamos el dia en nombre
#lubridate maneja husos horarios lo definiremos con tz
#link para los husos horarios 
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
#fomato ymd_hms es año/mes/dia_hora/min/seg.
m<-ymd_hms("1997-05-01 16:25:14", tz = "America/Chicago")
#revisar hora en otro huso horario
with_tz(m,"Pacific/Auckland")
with_tz(m,"Indian/Mahe")
class(m)
#nos puede dar la fecha en diferentes lugares del planeta
nyc <- now("America/New_York")
nyc
paris<-now("Europe/Paris")
paris
alemania<-now("Europe/Berlin")
alemania
#las fechas con horarios las maneja clase POSIXct
#para actualizar fechas
ahora<-now()
ahora
update(ahora, hours = 8, minutes = 34, seconds = 55)
#operaciones
#sumar/restar diferentes cantidades de tiempo
#sumar o restar dias
v <- nyc+days(2)
v
#sumar o restar horas
paris-hours(5)
#periodos transcurridos
#nos da el tiempo transcurrido de un punto al otro
d<-interval(c, m)
d
as.period(d)