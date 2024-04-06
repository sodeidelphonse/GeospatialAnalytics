
#--------------------------------------------------
#  Geometry for Spatial Analysis
#  By: Idelphonse SODE, Geosptail Data Scientsit,
#  University of Abomey-calavi, Benin
#--------------------------------------------------


#-- A) What is Envelope, Boundary & ConvexHull ?

# These concepts have many applications in spatial analysis and GIS mapping
# In geostatistics for instance, the Convex Hull help find the minimum convex polygon
# around the observed data points to reduce computation time in area without data
# The boundary of a geometry generally serves as the basis for designing a map.

# Start with the rgeos package
library(rgeos)

# Create the data
x  <- readWKT(paste("POLYGON((0 40,10 50,0 60,40 60,40 100,50 90,60 100,60",
                  "60,100 60,90 50,100 40,60 40,60 0,50 10,40 0,40 40,0 40))"))

# Envelope
env <- gEnvelope(x)

# Boundary
b <-  gBoundary(x)

# Convex hull
ch <-  gConvexHull(x)

# Plot of each geometry
plot(x, col = 'blue') 
plot(env, add = TRUE, lwd = 2)
plot(b, add = TRUE, col = "red", lwd = 3)
plot(ch, border = "green", lwd = 3, add = TRUE)

title("ConvexHull vs Envelope vs Boundary")
mtext("Source: Adapted from rgeos library", side = 1, cex = .8)
legend("topright", legend = c("Boundary", "ConvexHull", "Envelope"), 
       col = c("red", "green", "black"), lwd = 1)


#-------------------------------
#-- Application to meuse data 
#-------------------------------

library(sp)
library(sf)
library(ggplot2)

data(meuse)
help(meuse)

# Create an sf object
sf.pts <- st_as_sf(meuse, coords = c( "x", "y" ), crs = "+init=epsg:28992")
plot(st_geometry(sf.pts))

# Create the convex hull polygon
hull   <- st_convex_hull(st_union(sf.pts))

# ggplot
ggplot(data = st_geometry(hull)) +
  geom_sf(fill = NA, color = "red") +
  geom_sf(data = st_geometry(sf.pts)) +
  labs(title = "Convex hull", caption = "Source: meuse data") +
  theme_bw()

# Save the plot
ggsave("geometry/ConvexHull.png", dpi = 300, width = 24, height = 28, units = "cm")


