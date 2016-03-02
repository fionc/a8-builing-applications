# Required packages
library(shiny)
library(plotly)
library(dplyr)

# Making widgets
shinyUI(fluidPage(
  
  # Title
  titlePanel("Iris Data"),
  
  # Radio button widget for different species
  radioButtons("species", label="Select species",
               choices = list("Setosa" = "setosa",
                              "Versicolor" = "versicolor",
                              "Virginica" = "virginica"),
               selected = 'setosa'),
  
  # Drop-down widget for different plant parts
  selectInput("plant", label = "Select plant parts", 
               choices = list("Sepal", "Petal"),
               selected = "Sepal"),
  
  # Makes the plot
  mainPanel(
    plotlyOutput("plot")
  )
))