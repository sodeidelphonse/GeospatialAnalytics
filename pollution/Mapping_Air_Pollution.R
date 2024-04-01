
#------------------------------------------------------------------------------
#  Choropleth map of the air pollution level in Africa
#  Designed By: Akoeugnigan Idelphonse SODE
#  LinkedIn: https://www.linkedin.com/in/idelphonse-akoeugnigan-sode-05015672/
#-------------------------------------------------------------------------------

library(wbstats)
library(sf)
library(dplyr)
library(viridis)
library(ggplot2)
library(ggspatial)
library(rnaturalearth) 

# search an indicator via the World Bank API in Webstats
indicators <- wb_search(pattern = "pollution") 
df         <- wb_data(indicator = "EN.ATM.PM25.MC.M3", start_date = 2019, end_date = 2019)
print(df, n = 10)

# Extract the Africa map
map.afr <- ne_countries(continent = 'africa', returnclass = "sf")
head(map.afr)  # check the map attributes

# Join the target data to the map 
map.join   <-  map.afr %>% 
  select(adm0_a3, name, iso_a3)  %>% 
  left_join(df, by = c("iso_a3" = "iso3c"))  %>% 
  cbind(st_coordinates(st_point_on_surface(.))) 
head(map.join)

# Labels of countries with highest level of pollution (PM25 above 75% quantile)
q75        <- quantile(map.join$EN.ATM.PM25.MC.M3, probs = 0.75, na.rm = TRUE)
map.labels <- filter(map.join, EN.ATM.PM25.MC.M3 > q75)
dim(map.labels)

# Mapping
ggplot(map.join) + 
  geom_sf(aes(fill = EN.ATM.PM25.MC.M3)) +
  scale_fill_viridis() + 
  labs(x ="Longitude", y ="Latitude", fill = "PM2.5") + 
  theme_bw() +
  
  # map annotation
  annotation_north_arrow(location = "tl", height = unit(1,"cm"), width = unit(0.7,"cm")) +
  annotation_scale(location = "br", bar_cols = c("grey60", "white")) +
  annotate("text", x = -9, y = -35, size = 2.5, color = "darkblue",
      label = "Designed by: Idelphonse A.SODE\n Source: World Bank (https://data.worldbank.org)") +
  annotate("text", x = 26, y = 38, size = 3.5, fontface = "bold",
           label = "PM2.5 air pollution in 2019, mean annual exposure \n (micrograms per cubic meter)")+
  geom_text(data = map.labels, aes(X, Y, label = name), size =2, fontface ="bold", colour="white") +
  
  # customizing the legend position
  theme(
    legend.position = c(.05, .10),
    legend.justification = c("left", "bottom"),
    panel.background = element_blank(),
    panel.border = element_rect(color = "black", fill = NA)
  )

# Save the plot
ggsave("pollution/Air_pollution_Africa.png", dpi = 300, width = 24, height = 28, units = "cm")
