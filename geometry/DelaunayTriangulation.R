
#----------------------------------------------------
#   Geometry for Spatial Analysis and GIS Mapping
#   By: Idelphonse SODE, Geospatial Data Scientist 
#   University of Abomey-Calavi, Benin
#----------------------------------------------------

library(sp)
library(rgeos)
library(sf)
library(ggplot2)


## Why use the Delaunay Triangulation ?

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


## Build a mesh (constrained refined Delaunay triangulation) with INLA library

library(INLA)

# Observed locations
coo <- st_coordinates(meuse.sf)[, c("X","Y")]

# Define the ConvexHull around the observed locations
bnd  <- inla.nonconvex.hull(coo)  

# Build the mesh (you can vary max.edge & offset and see the result)
mesh <- inla.mesh.2d(loc = coo, boundary = bnd, offset = c(300, 600), 
                     cutoff = 10,  max.edge = c(200, 300))      

# Number of mesh nodes
mesh$n

# Save the mesh in the specified directory
png(file = "geometry/mesh.png", width = 600, height = 600)
plot(mesh)
points(coo, col = "red", cex = 1)
axis(1)
axis(2)
dev.off()
