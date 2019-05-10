---
title: "include.md"
author: “Meera Lee Sethi"
date: "4/8/2019"
output: html**document
---
## Phenological Responses to Climate Change: A Case Study

### Temperature and Phenology

For many organisms, temperature has a major influence on **phenology**—the timing of important life events such as when birds migrate or when plants flower—and scientists across the world have been documenting **phenological shifts** in response to climate change, like deciduous trees producing new leaves [earlier in the year](https://www.usanpn.org/files/LeafOutHighlightChange**Arnoldia**.pdf) because spring-like temperatures are arriving sooner. This kind of research often relies heavily on historic records of phenology, which allow us to track changes in the average timing of events of interest across many decades, and compare them to climate data collected over the corresponding period of time.

Temperature is an especially influential factor in the lives of **ectotherms**, animals whose body temperatures aren’t controlled internally but are strongly dependent on their surrounding environments. (For example, insects tend to be sluggish in cool conditions and active when it’s warmer, because temperatures drive their  **metabolic rates**: the chemical reactions that take place in cells to sustain life, including the conversion of food to energy.) Insects that inhabit seasonal environments like mountains, where climatic conditions range from frigid and snowy to hot and sunny over the course of the year, face a unique challenge. Montane grasshoppers, for instance, spend months in a state of dormancy called **diapause**, and can only feed and grow during the summer. They begin the growing season as eggs that were laid the previous year and spent the winter buried beneath the snow, and they must pass through five juvenile **instars** (stages) to reach adulthood. If they don’t do this before autumn’s chill, they won’t be able to reproduce. In this context, summer temperatures act as a powerful signal driving **developmental phenology**: when these insects hatch and how fast they mature. 

<p>
<style= "display: block; margin-left: auto; margin-right: auto;">
<img src="https://upload.wikimedia.org/wikipedia/commons/0/07/Grasshoppermetasnodgrass.jpg"/, height="600 px">
<figcaption>Grasshopper developmental stages, image: Wikimedia</figcaption>
</style>
</p>

### Colorado Grasshoppers: Then and Now
	
Every week in the summers of 1958-1960, entomologists Gordon Alexander and John Hilliard led a field crew that collected grasshoppers along an **elevational transect**—a series of survey sites located at different elevations—in the Rocky Mountains of Colorado. Because each grasshopper instar is recognizably different, as you can see in the figure above, the pair were able to accurately identify the developmental age of each individual they collected. 

<p>
<div style="display: flex; justify-content: center;">
![Field site in Boulder, CO, 1960, photo: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/3005-2-mis-Bureau-stdsCLEAN.jpg) ![John Hilliard & Gordon Alexander's wife at Guanella Pass, 1959, photo: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/2676-J-Hilliard-Mrs-A.jpg)
![John Hilliard & Gordon Alexander, 1958, photo: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/2056-Hilliard-and-Alexander-1958.jpg)
</div>
</p>

Nearly fifty years later, César Nufio realized that by conducting a resurvey of the same sites using the same protocols, he could assess how these grasshoppers had responded both to year-to-year variation in temperature at these locations, and to the larger trend of climate warming. A team led by Nufio did this work during 2006-2016. 

![César gets ready to sweep for grasshoppers, image: César Nufio](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/Cesar.jpg)

The phenology of a given grasshopper species or population may be more or less sensitive to summer temperatures depending on whether it tends to emerge from diapause early or late in the season, how far it is able to disperse, and where on the mountain it lives. This is because seasonality affects the amount of time available for development, and species that have a lower ability to disperse (e.g. wingless species) may be more **locally adapted**, or more genetically well-suited to the specific environmental conditions where it is found. Finally, at higher elevations, summers are both shorter and cooler than at lower elevations, placing even greater constraints on insect development. The table below shows the traits of six grasshopper species that were surveyed by both the historic and the contemporary researchers.

```{r table2, echo=FALSE, message=FALSE, warnings=FALSE, results='asis'}
| Grasshopper Species       | Seasonality    | Dispersal  | Distribution  |
|---------------------------|:--------------:|-----------:|--------------:|
| Aeropedellus clavatus      |**************| ********** |*************|
| Camnula pellucida            |**************| ********** |*************|
| Chloealtis abdominalis     |**************| ********** |*************|
| Melanoplus boulderensis |**************| ********** |*************|
| Melanoplus dawsoni         |**************| ********** |*************|
| Melanoplus sanguinipes   |**************| ********** |*************|
```

![_Melanoplus sanguinipes_, image: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/1995-Melanoplus-mexicanus-sanguinipes.jpg)![_Chloealtis addominalis_, image: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/2054-Chloealtis-addominalis.jpg)

### This App

In this interactive app, you’ll be able to visualize data from the initial grasshopper survey and the resurvey project, as well as temperature data from both periods taken from nearby weather stations. By selecting which variables to plot against each other, you can ask questions and test hypotheses about climate change and insect development, and about how different grasshopper species and populations respond to temperature. 

Before you begin, it’s important to be comfortable with two key terms you’ll see below. The first is **growing degree days** (GDDs). This is a unit used to measure heat that takes into account the fact that insects have a “threshold” temperature below which they cannot grow. In the case of these montane grasshoppers, that threshold is about 12° C. When you see “Season growing degree days”, or “Season GDDs”, think of it as the total amount of time during each summer season when air temperatures were above 12° C, and therefore there was enough heat available for grasshoppers to grow. When you see “cumulative growing degree days”, think of it as as the total amount of time above 12° C that have accumulated up to that particular day in the season. 

The second term is **development index**. This has values that range from 1 to 6, and is a way of translating the developmental age of many individual grasshoppers into an average age for a whole population. For instance, a development index of 1 for _Aeropedellus clavatus_ (the clubhorned grasshopper) at 1752 m on day 150 in 2006 would mean that at that time point, the entire population at that elevation consisted of individuals in their first instar. A development index of 5.5 for the same population (presumably measured later in the year) would mean that most individual clubhorned grasshoppers found at that elevation were at or very near to adulthood.  

![_Aeropedellus clavatus_, image: Don Van Horn](http://faculty.washington.edu/lbuckley/wordpress/wp-content/uploads/2019/05/2017-Aeropedellus-clavatus-F.jpg)


### Exploring development index data

In this first exercise, you can generate figures that all have the same general structure. On the y-axis, you’ll see values for development index. On the x-axis, you can select between Season GDDs or Day of Year (in Day of Year units, Jan 1=1, and Dec 31=365). Finally, you can select one or more grasshopper species and one or more sites (elevations) to plot. The resulting lines will be in the shape of an upward trajectory that eventually levels off. Each line represents one population of grasshoppers (one species living at a particular elevation in a particular year). The line slopes upwards because the population as a whole matures over the course of the season, so its development index increases. Finally, when all individuals are adults, the line levels out. Dashed lines represent historical data and solid lines represent resurvey data, while bluer colors indicate cooler years and redder colors indicate warmer years. 

Try to answer some of the following questions by changing the data you plot:

In general, how does phenology differ between cool and warm years? What about between low and high elevations?
How does phenology differ between historic and resurvey years for A. clavatus? (Hint: The closer a line is to the left of the panel, the earlier in the season development begins, and vice versa.) Why might this be?
How does phenology differ for high vs. low-elevation populations of M. sanguinipes? (Hint: The steeper the line, the faster development occurs.) Why might this be?
How does phenology for M. boulderensis differ in 2010 vs. 2007? What about M. dawsoni? Why might this be?

