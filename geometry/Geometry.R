
#----------------------------------------------
#  What is Envelope, Boundary & ConvexHull ?
#  By: Idelphonse SODE (adapted from rgeos)
#----------------------------------------------

library(rgeos)

# Data
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

