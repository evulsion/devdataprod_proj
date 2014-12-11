# amended from http://rstudio.github.io/shiny/tutorial/#inputs-and-outputs

library(shiny)
library(datasets)

data <- mtcars

# Define factors
data$am <- factor(data$am, labels = c("Automatic", "Manual"))
data$cyl <- factor(data$cyl)
data$gear <- factor(data$gear)

# Define server logic required to plot the model
shinyServer(function(input, output) {
  
  # Define reactive formula texts
  formulaText <- reactive({
    paste(input$outputVariable, "~", input$inputVariable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate plot
  output$plot <- renderPlot({
    boxplot(as.formula(formulaText()), data = data, xlab=input$inputVariable, ylab=input$outputVariable)
  })
  
  # Generate model summary
  output$summary <- renderPrint({summary(lm(as.formula(formulaText()), data = data))})
})
