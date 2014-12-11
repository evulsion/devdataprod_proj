# amended from http://rstudio.github.io/shiny/tutorial/#inputs-and-outputs

library(shiny)

# Define UI
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Linear Regression Model on mtcars data"),
  
  # Sidebar with controls to select the input and output variables for the model
  sidebarPanel(
    selectInput("inputVariable", "Input:",
                list("Cylinders" = "cyl", 
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
    selectInput("outputVariable", "Output:",
                list("Miles per gallon" = "mpg", 
                     "Gross horsepower" = "hp", 
                     "Weight (lb/1000)" = "wt"))
  ),
  
  # Show the caption, plot and summary of the selected model
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("plot"),
    h3("Summary of the Linear Regression Model"),
    verbatimTextOutput("summary")
  )
))
