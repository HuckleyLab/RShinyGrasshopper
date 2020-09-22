library(shiny)
library(tidyverse)
library(shinyWidgets)
library(plotly)
library(cowplot)
library(httr)
library(RCurl)


#specify choices
specs= c("Aeropedellus clavatus", "Melanoplus boulderensis", "Chloealtis abdominalis", "Camnula pellucida", "Melanoplus dawsoni", "Melanoplus sanguinipes")
elevs= c("1752m", "2195m", "2591m", "3048m")
initials = c("1958", "1959", "1960") 
resurveys = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015")


# Define UI 
shinyUI(
  fluidPage(  
    title = "Grasshoppers",
    includeMarkdown("include.md"),
    hr(),
    # Place the filter horizontally
    fluidRow(
       column(4, radioButtons('facet', 'Select variable for columns', c("Species", "Year"), inline = TRUE)),
       column(4, selectInput('species.sel', 'Select species to plot', choices= as.character(specs), multiple = TRUE, selected = "Melanoplus sanguinipes")),
       column(4, pickerInput('period', 'Select years to plot',
                             choices = list(Initial = as.character(initials), Resurvey = as.character(resurveys)),
                             options = list(`actions-box` = TRUE),
                             multiple = TRUE,
                             selected = initials))
    ),
  
    #pick species and sites
    fluidRow(
     column(4,radioButtons('x', 'Predictor variable (X)', c('Day of Year','Cumulative GDDs'), inline = TRUE)),
     column(4,selectInput('sites.sel', 'Select sites to plot', choices= as.character(elevs), multiple=TRUE, selected=elevs))
    ),
   
    # Show a plot of the generated distribution

    plotlyOutput(outputId="trendPlot"),
    hr(),
    
    includeMarkdown("include2.md"),
    fluidRow(
      column(5,selectInput('species.sel2', 'Select species to plot', choices= specs, multiple=TRUE, selected="Melanoplus sanguinipes")),
      column(5,selectInput('sites.sel2', 'Select sites to plot', choices= elevs, multiple=TRUE, selected=elevs))
    ),
    
    plotOutput(outputId="secondPlot"),
    hr()
  )
)