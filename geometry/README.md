# Computational geometry for geospatial analysis 
This folder presents some key concepts and basic applications of the *computational geometry* for geospatial analysis and GIS mapping. In case, your are interested in the algorithmic aspects and other applications of these geometric structures, the book on [Computational Geometry](https://books.google.bj/books?id=9nhHUZpKzeEC) can be useful for you.

- **Convex hull**: The convex hull or convex envelope of a shape is the smallest set that contains it. Convex hulls have wide applications in mathematics, statistics, combinatorial optimization, economics, geometric modeling, and ethology. 
In geostatistics or point process modeling for instance, the convex hull is used to find the minimum convex polygon around the observed data points to avoid wasting the computational resources in area without observed data.
  
- **Delaunay triangulation**: The Delaunay triangulation of a set P of points of the plane is a triangulation DT(P) such that no point of P is inside the circumcircle of one of the triangles of DT(P). The *Delaunay condition* states that a network of triangles is a Delaunay triangulation if all the circumcircles of the triangles in the network are empty. By replacing the circles with circumscribed spheres, it is possible to extend the definition from 2D to 3D.
Delaunay triangulations are often used to construct the meshes of the *finite element method* because of the guarantee on the angles and thanks to the speed of the algorithms. Delaunay triangulation is the *dual graph* of *Voronoi diagram*.
