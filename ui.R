library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Iris identification tool"),
  sidebarPanel(h3('Mesuring Iris:'),
               sliderInput('sLength', 'Length of Sepal:',value = 5.8, min = 4, max = 8, step = 0.1,),
               sliderInput('sWidth', 'Width of Sepal:',value = 3, min = 2, max = 4.5, step = 0.1,),
               sliderInput('pLength', 'Length of Petal:',value = 3.7, min = 1, max = 7, step = 0.1,),
               sliderInput('pWidth', 'Width of Petal:',value = 1.1, min = 0.1, max = 2.5, step = 0.1,),

               submitButton('Submit')),
  mainPanel(h2('The Specie of this Iris is most likely to be:'),verbatimTextOutput("oid1"))
)
)