
#----------------------------------------------------
#  Geometry and Topology for Spatial Analysis
#    By: Idelphonse SODE, Geospatial Data Scientist 
#      University of Abomey-Calavi, Benin
#----------------------------------------------------

library(sp)
library(sf)
library(ggplot2)


## Delaunay Triangulation

# The Delaunay triangulation (DT) plays a major role in spatial statistics (e.g. Finite Element Method)
# Its help define the mesh used in the FEM to find solution to Stochastic Partial Differential Equations 
# (SPDE) when modeling geostatistical and point patterns data using Bayesian inference.

# The meuse data
data(meuse)

## DT from sp object
coordinates(meuse) <- c("x", "y")

plot(gDelaunayTriangulation(meuse))
points(meuse, col = "blue")
title("Delaunay Triangulation")
axis(1)
axis(2)
mtext("Source: meuse data (sp library)", side = 3, cex =.8)


## DT with sf library
DT       <- as(gDelaunayTriangulation(meuse), "sf")
meuse.sf <- as(meuse, "sf")

ggplot(data = st_geometry(DT)) +
  geom_sf(fill = NA) +
  geom_sf(data = st_geometry(meuse.sf), color ="blue") +
  labs(title = "Delaunay Triangulation", 
       caption = "Source: meuse data (sp library)") +
  theme_bw()

# Save the plot
ggsave("geometry/DelaunayTriangles.png", dpi = 300, width = 24, height = 28, units = "cm")


## Exercise: Building mesh with INLA library
