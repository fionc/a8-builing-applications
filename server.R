# Required packages
library(shiny)
library(dplyr)
library(plotly)

# Makes a scatter plot where user can see the length and width of 
# different species of iris and different plant parts

shinyServer(function(input, output) {
  output$plot <- renderPlotly({
    
    # Filtered the species from iris dataframe
    info <- filter(iris, Species == input$species)
    
    
    # Makes a scatterplot that allows the user to pick from the different inputs (species and plant parts).
    # Scatterplot will show the length and width of those plant parts (sepal and petal)
    x_label <- paste0(input$plant, ".Length")
    y_label <- paste0(input$plant, ".Width")
    scat_plot <- plot_ly(info, 
                         x = info[[x_label]],
                         y = info[[y_label]],
                         mode = "markers"
                         )
    
    # Labels the graph's title and x & y axis
    layout(title = paste("Iris data scatterplot"),
           xaxis = list(title = paste(input$plant, "Length")),
           yaxis = list(title = paste(input$plant, "Width")))
  })
})