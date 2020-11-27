guide1 <- Cicerone$
  new()$
  step(
    el = "viz-wrapper",
    title = "Visualization",
    description = HTML("Welcome to the visualization tour.
                       First, let's take a closer look at what the plots are showing. Hit next."),
    position = "top"
  )$
  step(
    el = "trendPlot",
    title = "Plot",
    description = HTML("The x axis is <b>Day of year</b> and y axis is <b>Development index</b>.
                       <br>We see elevations on the right and species name on the top in grey, so there are 4 plots stacked here. Let's focus on the bottom plot, which shows the data for <em>Melanoplus sanguinipes</em> at 1752m.
                       <br>There are two lines, each representing a year colored based on the year's mean season GDD. As you can see in the legend on the right, warmer color corresponds to higher mean GDD.
                       Each point represents a data recording in that year.
                       <br>Try hovering over the left tip of the red line. We can learn that this line represents 1960, this year's mean season GDD was 332.04, and at day 159 (early June), the development index of <em>M. sanguinipes</em> was 2.70."),
    
  )$
  step(
    el = "facet-wrapper",
    title = "Variables for columns",
    description = HTML("This dictates how the plots are organized. Being at <b>Species</b>, we had plots separated by species and each line corresponded to a different a year.
                       This is good when you want to see how season GDD affects the development.
                       <br>Now, let's switch to <b>Year</b> and hit next.")
  )$
  step(
    el = "spec-wrapper",
    title = "Species",
    description = HTML("Here, you can choose which species to plot. Try <b>Select All</b>."),
    position = "left"
  )$
  step(
    el = "trendPlot",
    title = "New plot",
    description = HTML("Now the plots are seperated by year and lines are colored by species. 
                       Separating by year is useful to compare how development indexes change between species.
                       <br>For example, we can see that the orange line tends to be above other lines in most plots, which indicates that <em>M. boulderernsis</em> develops earlier than other species.")
  )$
  step(
    el = "period-wrapper",
    title = "Years",
    description = HTML("There are data for other years as well. If you open the tab, you can see that there are initial years and resurvey years.
                       "),
    position = "left"
  )$
  step(
    el = "elev-wrapper",
    title = "Sites",
    description = HTML("Selecting fewer elevations increases the plot size."),
    position = "left"
  )$
  step(
    el = "x-wrapper",
    title = "X axis",
    description = HTML("Selecting <b>Cumulative GDDs</b> will be helpful to know how many degree days are needed to reach full development.")
  )

guide2 <- Cicerone$
  new()$
  step(
    el = "secondPlot",
    title = "Plots",
    description = HTML("This visualization has two sets of plots. The plots on the left have the day of the year that the grasshoppers reach adulthood, and those on the right have the cumulative GDD when they reach adulthood as the y axis.")
  )$
  step(
    el = "elev2-wrapper",
    title = "Sites",
    description = HTML("To simplify the plots, select just <b>1752m</b> and hit next."),
    position = "left"
  )$
  step(
    el = "secondPlot",
    title = "Plot",
    description = HTML("The trendline in the left plot has a negative slope. This implies that <em>M. sanguinipes</em> reaches adulthood earlier in the year when the year has more growing degree days.
                       However, the legend on the right tells that solid lines are nonsignificant. It is likely that the data size was not large enough.
                       The plot on the right indicates that the number of degree days in a given year don't make a big influence on how much degree days <em>M. sanguinipes</em> needs to reach adulthood.")
  )$
  step(
    el = "spec2-wrapper",
    title = "Species",
    description = HTML("You can visualize multiple species at the same time as well."),
    position = "right"
  )
  # step(
  #   el = "",
  #   title = "",
  #   description = HTML("")
  # )$
  # step(
  #   el = "",
  #   title = "",
  #   description = HTML("")
  # )