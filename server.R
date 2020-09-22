
# Read data from Github
#absM.all=read.csv(text=GET("https://github.com/HuckleyLab/RShinyGrasshopper/gh-all.csv"))
#absM.all.ssy=read.csv(text=GET("https://github.com/HuckleyLab/RShinyGrasshopper/gh-all.ssy.csv"), sep = "")

# Load data
absM.all = read.csv("gh-all.csv")
absM.all.ssy = read.csv("gh-all.ssy.csv")

# Changing to bad colnames just so that it shows the right tooltops when running ggplotly. Couldn't figure out a way to change names for tooltip.
colnames(absM.all)[24] <- "Mean season GDDs"
colnames(absM.all)[16] <- "Cumulative GDDs"
colnames(absM.all)[1] <- "Day of year"
colnames(absM.all)[18] <- "Development index"
absM.all$`Mean season GDDs` <- round(absM.all$`Mean season GDDs`, digits = 2)
absM.all$`Development index` <- round(absM.all$`Development index`, digits = 2)


elevs= c("3048m", "2591m", "2195m", "1752m")
rgb.palette <- colorRampPalette(c("red", "orange", "blue"), space = "rgb")


# Define server logic to do filtering
shinyServer(function(input, output) {
  
  dataset <- reactive({
    absM.all %>% filter(year %in% input$period & species %in% input$species.sel & elev.lab %in% input$sites.sel)
  })
  
  dataset2 <- reactive({
    absM.all.ssy %>% filter(species %in% input$species.sel2 & elev.lab %in% input$sites.sel2)
  })
  
  
  output$trendPlot <- renderPlotly({
    
    xlab.title = ifelse(input$x == "Cumulative GDDs", "Cumulative growing degree days (GDDs)", "Day of year")
    
    xvar = ifelse(input$x == "Cumulative GDDs", "`Cumulative GDDs`", "`Day of year`")

    p <- ggplot(data = dataset(), aes_string(x = xvar, y = "`Development index`", color = "`Mean season GDDs`", group = 'year')) + 
      geom_point(size = 0.7) + geom_line(aes(linetype = period, alpha=0.5)) +
      scale_colour_gradientn(colours = rev(rgb.palette(10))) + 
      labs(x = xlab.title, y = "Development Index", linetype = "") +
      theme(legend.position = "bottom") + 
      guides(alpha = FALSE)
    
    if(input$facet == "Species"){
      p <- p + facet_grid(factor(elev.lab, levels = elevs) ~ species)
    } else {
      p <- p + facet_grid(factor(elev.lab, levels = elevs) ~ year)
    }
    
    ggplotly(p, tooltip = c("Mean season GDDs", "year", "Cumulative GDDs", "Development index", "Day of year")) %>%
      layout(legend = list(orientation = "h", x = -0.1, y = -0.1))
  })
  
  #set up plot height for secondPlot
  height_all <- function(){
    if(identical(elevs, input$sites.sel2)) return (800)
      else return (500)
  }

  output$secondPlot <- renderPlot({
    colors <- c("Aeropedellus clavatus" = '#b35806', 
                "Melanoplus boulderensis" = '#f1a340', 
                "Chloealtis abdominalis" = '#fee0b6', 
                "Camnula pellucida" = '#d8daeb', 
                "Melanoplus dawsoni" = '#998ec3', 
                "Melanoplus sanguinipes" = '#542788')

    p1 <- ggplot(data = dataset2(), aes(x = cdd_seas, y = doy_adult, color = species)) +
      geom_smooth(method = "lm", se = F, aes(linetype = sig.doy)) +
      ylab("Day of year") +
      ggtitle("Day of year when grasshoppers reach adulthood")
    
    #GDD
    p2 <- ggplot(data = dataset2(), aes(x = cdd_seas, y = gdd_adult, color = species)) +
      geom_smooth(method = "lm", se = F, aes(linetype = sig.gdd)) +
      ylab("Cummulative growing degree days") +
      ggtitle("Cumulative GDDs when grasshoppers reach adulthood") +
      labs(linetype = "significance")
    
    default <- function(p) {
      p <- p +
        geom_point(aes(shape = period, fill = species, alpha = period, stroke = 1), size = 3) +
        geom_point(aes(shape = period, fill = NULL, stroke = 1), size = 3) +
        facet_wrap( ~ factor(elev.lab, levels = elevs), ncol = 1, scales = "free") +
        scale_color_manual(values = colors) +
        scale_shape_manual(values = c(21, 22, 23)) +
        scale_alpha_manual(values = c(0.2, 0.9)) + 
        xlab("Season growing degree days (°C)") +
        theme_bw() +
        theme(strip.text = element_text(size = 11), plot.title = element_text(size = 14), 
              axis.text = element_text(size = 11), axis.title = element_text(size = 12), 
              legend.text = element_text(size = 12), legend.title = element_text(size = 12))
    }
    
    p1 <- default(p1) + theme(legend.position = "none")
    p2 <- default(p2)
    plot_grid(p1, p2, nrow = 1, rel_widths = c(1, 1.5))

  }, height = height_all)
  
})
