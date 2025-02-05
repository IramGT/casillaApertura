## LIBRARIES

library(sf)
library(ggplot2)
library(dplyr)
library(viridis)
library(readr)
library(utils)
library(raster)
library(shiny)
library(bslib)
library(shinyjs)
library(DT)

## DATA BASES IN GOOGLE SHEETS

# Bases de datos
# Bases de datos
apertura <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQG_Id15Btst8xfynnrjkBq8ppLud3PpZOzkk6coiVYGvmTWUMhO3HfDKv-5URrLNt7o-WnCh_0PQIS/pub?output=csv")

#### UI ####
ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "simplex"),
  tags$style(type = "text/css", "html, body {width:100%; height:100%} #map{height:80vh !important;}"),
    tabsetPanel(
    tabPanel("APERTURA", DT::dataTableOutput("ziptable1"))
    ))

#### SERVER ####

server <- function(input, output) {
  

    
    output$ziptable1 <- DT::renderDataTable({
      tabla <- apertura 
      
      DT::datatable(tabla, options = list(pageLength = 50), escape = FALSE)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
