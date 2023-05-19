library(shiny)
library(readr)
library(dplyr)
library(shinythemes)
library(ggplot2)

t<-read_csv("Temperatura_qro_julio_diciembre_2022.csv")
te<-t
tem<-t
t2<-t
t3<-t
ui <- navbarPage(title = "clima Queretaro",
                 theme = shinytheme("darkly"),
                 tabPanel("por mes",
                          "revisaremos la temperatura por mes",
                          selectInput("t2", label = ("Elije un mes"), 
                                      choices = t2$moth),
                          verbatimTextOutput("m"),
                          plotOutput("m2"),
                          #plotOutput("m3"),
                          ),
                 tabPanel("humedad", "revisemos la humedad del estado",
                          selectInput("t", label = ("Elije un mes"), 
                                      choices = t$moth),
                          verbatimTextOutput("h2"),
                          plotOutput("h")
                          ),
                 tabPanel("velocidad",
                          "revisemos la velocidad del aire en el estado",
                          selectInput("te", label = ("Elije un mes"), 
                                      choices = te$moth),
                          verbatimTextOutput("v1"),
                          plotOutput("v")
                          ),
                 tabPanel("Presion",
                          "revisemos la presion en el estado",
                          selectInput("tem", label = ("Elije un mes"), 
                                      choices = tem$moth),
                          verbatimTextOutput("p1"),
                          plotOutput("p")
                 ),
                 tabPanel("por dia",
                          dateInput("t3", label ="selecciona el dia", value="2022-07-01",
                                    min ="2022-07-01",max="2022-12-31"),
                 ),
                
          
)

gh<-function(a){
  ggplot(a,aes(x=x,y=w))+geom_col()
}
gv<-function(a){
  ggplot(a,aes(x=x,y=y, col="red"))+geom_point()+geom_line()
}
gm<-function(a){
  ggplot(a,aes(x=x,y=y, col="green"))+geom_point()+geom_line()
}

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$m<-renderPrint({
    s<-input$t2
    filter(t2, moth %in% s)%>%
      summarise(mean(maxima), mean(minima), mean(velocidad), mean(presion))
  })
  output$m2<-renderPlot({
    s<-input$t2
    filter(t2, moth %in% s)%>%
      mutate(x=day, y=maxima)%>%gm()
  })
  output$h2<-renderPrint({
    input$t
  })
  output$h<-renderPlot({
    s<-input$t
    filter(t, moth %in% s, moth%in% s)%>%
    mutate(x=day, w=humedad)%>%gh()
  })
  output$v1<-renderPrint({
    input$te
  })
  output$v<-renderPlot({
    e<-input$te
    filter(te, moth %in% e)%>%
      mutate(x=day,y=velocidad)%>%gv()
  })
  output$p1<-renderPrint({
    input$tem
  })
  output$p<-renderPlot({
    e<-input$tem
    filter(tem, moth %in% e)%>%
      mutate(x=day,y=presion)%>%gv()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
