#
# Part of trench project (Grasshoppers)
# author Aji John https://github.com/ajijohn
# adapted from Shiny 
# Server
#

library(shiny)
library(cowplot)

#
rgb.palette <- colorRampPalette(c("red", "orange", "blue"), space = "rgb")

# Do house  keeping
absM.all=read.csv(paste(getwd(),"/gh-all.csv",sep = ""))
absM.all.ssy=read.csv(paste(getwd(),"/gh-all.ssy.csv",sep = ""))

# Define server logic to do filtering
shinyServer(function(input, output) {
  
  dataset <- reactive({
   #restrict years
    x <- strsplit(as.character(input$year), "\\s+")
    print(x)
    from <- as.numeric(x[1])
    to <-   as.numeric(x[2])
    print(from)
    print(to)
    absM.all %>% filter(year >=  from & year <= to)
  
    #restrict species
    ## NOT WORKING?
    absM.all %>% filter(species %in% input$species.sel)
    print(input$species.sel)
    
    #restrict sites
    absM.all %>% filter(elev.lab %in% input$sites.sel)
    })
  
  dataset2 <- reactive({

    absM.all.ssy
    
    #restrict species
    ## NOT WORKING?
    absM.all.ssy %>% filter(species %in% input$species.sel2)
    
    #restrict sites
    absM.all.ssy %>% filter(elev.lab %in% input$sites.sel2)
    
  })
  print(getwd())
  
  
  output$trendPlot <- renderPlot({
    
    #TODO Make Y Label dynamic
    
    # trend plot with #add trendlines
    # ggplot(data=dataset(), aes_string(x=input$x, y = input$y, color=input$color)) +
    #   geom_point(alpha=0.8) +
    #   geom_smooth(se = FALSE, method = lm) +
    #   theme_classic()+ xlab(input$x) +
    #   #theme(legend.position="none")+
    #   scale_color_gradientn(colours = rev(heat.colors(5)))+ 
    #   theme(legend.key.width=unit(1,"cm"))+
    #   #labs(color="Developmental Temperature (°C)") +labs(tag="(a)") +
    #   geom_abline(aes(slope=syear.slope,intercept=syear.int))+
    #   facet_wrap(~region.lab)
    
    #set up x lab
    xlab.title= "Day of year"
    if(input$x=="cdd_sum") xlab.title= "Cumulative growing degree days (GDDs)"
    
    ggplot(data=dataset(), aes_string(x=input$x, y = 'DI', color='Cdd_siteave', 
      group='siteyear', linetype='period'))+
      facet_grid(elev.lab~species) +
      theme_bw()+
      geom_point()+geom_line(aes(alpha=0.5))+ #+geom_smooth(se=FALSE, aes(alpha=0.5), span=2)+
      scale_colour_gradientn(colours =rgb.palette(10))+
      ylab("Development Index")+
      xlab(xlab.title)+labs(color="Mean season gdds")+
      theme(legend.position = "bottom") + guides(alpha=FALSE)
    
  })
  
  output$secondPlot <- renderPlot({
    
    p1=ggplot(data=dataset2(), aes(x=cdd_seas, y = doy_adult, color=species))+
      geom_point(aes(shape=period, fill=species, alpha=period, stroke=1), size=3)+
      geom_point(aes(shape=period, fill=NULL, stroke=1), size=3)+
      geom_smooth(method="lm",se=F, aes(linetype=sig.doy))+
      facet_wrap(~elev.lab, ncol=1, scales="free") +
      theme_bw()+ylab("day of year")+xlab("season growing degree days (C)")+
      scale_shape_manual(values = c(21, 22, 23))+
      scale_alpha_manual(values = c(0.2,0.9))+theme(legend.position="none")
    
   
    
    #GDD
    p2=ggplot(data=dataset2(), aes(x=cdd_seas, y = gdd_adult, color=species))+
      geom_point(aes(shape=period, fill=species, alpha=period, stroke=1), size=3)+
      geom_point(aes(shape=period, fill=NULL, stroke=1), size=3)+
      geom_smooth(method="lm",se=F, aes(linetype=sig.gdd))+
      facet_wrap(~elev.lab, ncol=1, scales="free") +
      theme_bw()+ylab("cummulative growing degree days")+xlab("season growing degree days (C)")+
      labs(linetype="significance")+
      scale_shape_manual(values = c(21, 22, 23))+
      scale_alpha_manual(values = c(0.2,0.9))
    

    plot_grid(p1, p2, nrow=1, rel_widths=c(1,1.5) )
    
  })
  
})
