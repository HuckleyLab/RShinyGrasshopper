library(shiny)
library(tidyverse)
library(shinyWidgets)
library(plotly)
library(cowplot)
library(httr)
library(RCurl)
library(cicerone)
library(shinyjs)
library(shinyBS)

#specify choices
specs= c("Aeropedellus clavatus", "Melanoplus boulderensis", "Chloealtis abdominalis", "Camnula pellucida", "Melanoplus dawsoni", "Melanoplus sanguinipes")
elevs= c("1752m", "2195m", "2591m", "3048m")
initials = c("1958", "1959", "1960") 
resurveys = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015")


# Define UI 
shinyUI <- fluidPage(
  use_cicerone(),
  useShinyjs(),
  title = "Grasshoppers",
  setBackgroundColor(color = "#C7DAE0"),
  titlePanel(
    div(tags$img(src="TrenchEdLogo.png", height = 150), 
        "How Grasshopper Development shifts with Climate Change")
  ),
  includeMarkdown("include.md"),
  actionBttn(
    inputId = "reset1",
    label = "Reset", 
    style = "material-flat",
    color = "danger",
    size = "xs"
  ),
  bsTooltip("reset1", "If you have already changed the variables, reset them to default here before starting the tour."),
  
  actionBttn(
    inputId = "tour1",
    label = "Take a tour!", 
    style = "material-flat",
    color = "success",
    size = "sm"
  ),
  
  hr(),
  # Place the filter horizontally
  
  div(
    id = "viz-wrapper",
  
    fluidRow(
       column(4, 
              div(
                id = "facet-wrapper", 
                radioButtons('facet', 'Select variable for columns', c("Species", "Year"), inline = TRUE)
              )
       ),
       column(4, 
              div(
                id = "spec-wrapper", 
                pickerInput('species.sel', 'Select species to plot', choices = as.character(specs), multiple = TRUE, selected = "Melanoplus sanguinipes",
                             options = list(`actions-box` = TRUE))
              )
       ),
       column(4, 
              div(
                id = "period-wrapper", 
                pickerInput('period', 'Select years to plot',
                             choices = list(Initial = as.character(initials), Resurvey = as.character(resurveys)),
                             options = list(`actions-box` = TRUE),
                             multiple = TRUE,
                             selected = initials)
              )
       )
    ),
  
    #pick species and sites
    fluidRow(
     column(4, 
            div(
              id = "x-wrapper",
              radioButtons('x', 'Predictor variable (X)', c('Day of Year', 'Cumulative GDDs'), inline = TRUE)
            )
     ),
     column(4, 
            div(
              id = "elev-wrapper",
              pickerInput('sites.sel', 'Select sites to plot', choices = as.character(elevs), multiple = TRUE, selected = elevs,
                           options = list(`actions-box` = TRUE))
            )
      )
    ),
   
    # Show a plot of the generated distribution
  
    plotlyOutput(outputId = "trendPlot")
  ),
  
  hr(),
  
  includeMarkdown("include2.md"),
  
  actionBttn(
    inputId = "reset2",
    label = "Reset", 
    style = "material-flat",
    color = "danger",
    size = "xs"
  ),
  bsTooltip("reset2", "If you have already changed the variables, reset them to default here before starting the tour."),
  
  actionBttn(
    inputId = "tour2",
    label = "Take a tour!", 
    style = "material-flat",
    color = "success",
    size = "sm"
  ),
  hr(),
  fluidRow(
    column(5, 
           div(
             id = "spec2-wrapper",
             pickerInput('species.sel2', 'Select species to plot', choices = specs, multiple = TRUE, selected = "Melanoplus sanguinipes",
                          options = list(`actions-box` = TRUE))
          )
    ),
    column(5, 
           div(
             id = "elev2-wrapper",
             pickerInput('sites.sel2', 'Select sites to plot', choices = elevs, multiple = TRUE, selected = elevs,
                          options = list(`actions-box` = TRUE))
           )
    )
  ),
  
  plotOutput(outputId = "secondPlot"),
  hr()
)
