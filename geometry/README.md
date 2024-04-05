# Computational geometry for geospatial analysis 
This folder presents some key geometric structures and their applications for geospatial analysis and GIS mapping. In case, your are interested in the algorithmic aspects and other applications of these geometric structures, the book on [Computational Geometry](https://books.google.bj/books?id=9nhHUZpKzeEC) can be useful for you.

- **Convex hull**: The convex hull or convex envelope of a shape is the smallest set that contains it. Convex hulls have wide applications in mathematics, statistics, combinatorial optimization, economics, geometric modeling, and ethology.
  
In geostatistics or point process modeling for instance, the convex hull is used to find the minimum convex polygon around the observed data points to avoid wasting the computational resources in area without observed data.
  
- **Delaunay triangulation**: The Delaunay triangulation of a set S of points of the plane is a triangulation DT(S) such that no point of S is inside the circumcircle of one of the triangles of DT(S). The *Delaunay condition* states that a network of triangles is a Delaunay triangulation if all the circumcircles of the triangles in the network are empty. By replacing the circles with circumscribed spheres, it is possible to extend the definition from 2D to 3D.
  
Delaunay triangulations are often used to construct the meshes of the *finite element method (FEM)* because of the guarantee on the angles and thanks to the speed of the algorithms. It is the *dual graph* of *Voronoi diagram*.

- **Voronoi diagram**: A Voronoi diagram is a partition of a plane into regions close to each of a given set of objects. The Voronoi diagram of a set of points is dual to that set's Delaunay triangulation.The vertices of the Voronoi diagram are the centers of the circumscribed circles of the triangles of the Delaunay triangulation.

Voronoi diagrams have wide applications including natural sciences (biology, hydrology, ecology, ethology, etc.), humanities and social sciences, engineering, health, and informatics.

## References 
- [Convex hull](https://en.wikipedia.org/w/index.php?title=Convex_hull&oldid=1214307526)
- [Delaunay triangulation](https://fr.wikipedia.org/w/index.php?title=Triangulation_de_Delaunay&oldid=208519853)
- [Voronoi diagram](https://fr.wikipedia.org/w/index.php?title=Triangulation_de_Delaunay&oldid=208519853)
