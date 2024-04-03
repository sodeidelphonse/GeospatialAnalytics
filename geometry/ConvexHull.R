
#--------------------------------------------------
#  Geometry for Spatial Analysis
#  By: Idelphonse SODE, Geosptail Data Scientsit,
#  University of Abomey-calavi, Benin
#--------------------------------------------------

library(rgeos)

#----------------------------------------------
#-- What is Envelope, Boundary & ConvexHull ?
#----------------------------------------------

# These concepts have many applications in spatial analysis and GIS mapping
# In geostatistics for instance, the ConvexHull help find the minimum convex polygon
# around the observed data points to reduce computation time in area without data
# The boundary of a geometry generally serves as the basis for building a map.


# Create the data
x  <- readWKT(paste("POLYGON((0 40,10 50,0 60,40 60,40 100,50 90,60 100,60",
                  "60,100 60,90 50,100 40,60 40,60 0,50 10,40 0,40 40,0 40))"))

# Envelope
env <- gEnvelope(x)

# boundary
b <-  gBoundary(x)

# ConvexHull
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

#---------------------------
#-- Boundary of a real map
#---------------------------

library(sp)
library(sf)
data(meuse)
