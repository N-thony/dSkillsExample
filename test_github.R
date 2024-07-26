library(datasets)  # For iris dataset

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Iris Dataset Scatter Plotofr"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Select input for x-axis variable
      selectInput(inputId = "x_var",
                  label = "X-axis variable",
                  choices = names(iris)[1:4],
                  selected = "Sepal.Length"),
      
      # Select input for y-axis variable
      selectInput(inputId = "y_var",
                  label = "Y-axis variable",
                  choices = names(iris)[1:4],
                  selected = "Sepal.Width")
      
    ),
    
    # Main panel for displaying plots
    mainPanel(
      
      # Output: Scatter plot
      plotOutput(outputId = "scatterplot")
      
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression to create scatter plot
  output$scatterplot <- renderPlot({
    
    # Plotting the selected variables
    plot(iris[[input$x_var]], iris[[input$y_var]],
         xlab = input$x_var,
         ylab = input$y_var,
         main = paste("Scatter plot of", input$x_var, "vs", input$y_var))
    
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)
