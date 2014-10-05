
// - - - - - - - - - - - - - - - - - - - - - - - 
// MAPSHAPE CLASS
// - - - - - - - - - - - - - - - - - - - - - - - 

class MapShape {
  String coordinatePairs;
  String[][] MapShapePairsArray;

  MapShape(XML placemark_) {
    XML placemark = placemark_;
    XML coordinates = placemark.getChild("outerBoundaryIs/LinearRing/coordinates");
    coordinatePairs = coordinates.getContent();
    String[] MapShapePairs = split(coordinatePairs, ' ');
    MapShapePairsArray = new String[MapShapePairs.length][2];
    for (int i=0; i<MapShapePairs.length; i++) {
      String[] MapShapePairsSplit = split(MapShapePairs[i], ',');      
      MapShapePairsArray[i][0] = MapShapePairsSplit[0];
      MapShapePairsArray[i][1] = MapShapePairsSplit[1];
    }
  }

  void display() {
    fill(75);
    stroke(50);
    strokeWeight(0.25);
    beginShape();
    for (int i=0; i < MapShapePairsArray.length; i++) {     
      if (polar) {
        float theta = map(-1*map(float(MapShapePairsArray[i][0]), -180, 180, 0, width), 0, width, PI, TWO_PI+PI);
        float radius = map(map(float(MapShapePairsArray[i][1]), 90, -90, 0, height), 0, height, 0, width/2.0);  
        vertex(cos(theta) * radius + width/2.0, sin(theta) * radius + height/2.0);
      } else {
        vertex(map(float(MapShapePairsArray[i][0]), -180, 180, 0, width), map(float(MapShapePairsArray[i][1]), 90, -90, 0, height));
      }
    }
    endShape(CLOSE);
  }
}

