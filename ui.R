#
#
#
# Part of trench project
# author Aji John https://github.com/ajijohn
# UI
#
# todo
# axis labels
# setae length
# 
#

library(shiny)
library(tidyverse)

#specify choices
specs= c("Aeropedellus clavatus", "Camnula pellucida", "Melanoplus dawsoni", "Melanoplus sanguinipes", "Melanoplus boulderensis")
elevs= c("1752m", "2195m", "2591m", "3048m")

dataset <-read.csv(paste(getwd(),"/gh-all.csv",sep = ""))

# Define UI 
shinyUI(

# Define UI
fluidPage(  
  title = "Grasshoppers",
  fluidRow(
    column(12,
           includeMarkdown("include.md")
    )),

 hr(),
  # Place the filter horizontally
 fluidRow(
     column(4,selectInput('x', 'Predictor variable (X)', c('Day of Year'='ordinal','Cumulative GDDs'=' cdd_sum'))),
     column(4,    sliderInput('year', 'Range of years to plot', 
                              min=min(dataset$year),
                              max=max(dataset$year), 
                              value=c(min(dataset$year), 
                                      max(dataset$year)),
                              format = "####",sep = "",step = 1))
     
     #column(4,selectInput('y', 'Y',  c('Developmental Index'='DI'))),
    #column(4,selectInput('color', 'Color', c('Mean Season GDDs'='Cdd_siteave')))
  ),
 
 #pick species and sites 
 fluidRow(
   column(4,selectInput('species.sel', 'Select species to plot', choices= as.character(specs), multiple=TRUE, selectize=FALSE, selected=specs)),
   column(4,selectInput('sites.sel', 'Select sites to plot', choices= as.character(elevs), multiple=TRUE, selectize=FALSE, selected=elevs))
 ),
 
# choices = as.character(nba[,1] ),
# multiple = TRUE,
# selected = nba[1,1]
 
 
  # Show a plot of the generated distribution
  mainPanel(
    column(12,plotOutput(outputId="trendPlot", width="800px",height="600px")
  )),
 hr(),
 fluidRow(
   column(12,
          includeMarkdown("include2.md")
   )),
 fluidRow(
   column(4,selectInput('species.sel2', 'Select species to plot', choices= specs, multiple=TRUE, selectize=FALSE, selected=specs)),
   column(4,selectInput('sites.sel2', 'Select sites to plot', choices= elevs, multiple=TRUE, selectize=FALSE, selected=elevs))
   
   ),
 fluidRow(
   
   
   column(12,plotOutput(outputId="secondPlot")
   )),
 fluidRow(
   column(12,
          includeMarkdown("include3.md")
   )),
 hr()


)
)
