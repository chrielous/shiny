library(shiny)
library(caret)


shinyServer(

  function(input, output)
  {
    #output$oid1 <- renderPrint({input$id1})
    #
    sLength <- reactive({as.numeric(input$sLength)})
    sWidth <- reactive({as.numeric(input$sWidth)})
    pLength <- reactive({as.numeric(input$pLength)})
    pWidth <- reactive({as.numeric(input$pWidth)})
    
    output$oid1 <- renderPrint({test(input$sLength,input$sWidth,input$pLength,input$pWidth)})
  }
  )
getModel<-function()
{
  data(iris)
  model<-train(Species ~ ., data=iris, method = "nb")
  return(model)
}

test <- function(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
{
  model <- getModel()
  id<-1
  a<-cbind(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
  testData<-data.frame(a)
  test<-data.frame(a)
  test2<-data.frame(4,5,5,4)
  colnames(test)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
  colnames(test2)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
  dt<-rbind(test,test2)  
  bb<-predict(model,dt)

  return(toString(bb[1]))
}
