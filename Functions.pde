
// - - - - - - - - - - - - - - - - - - - - - - - 
// FUNCTIONS
// - - - - - - - - - - - - - - - - - - - - - - - 

void parseKML() {
  kml_data = loadXML("Robert_Russell_Natural_Earth_Countries.kml");
  XML document = kml_data.getChild("Document");
  XML[] placemarks = document.getChildren("Placemark");
  myMapShape = new MapShape[10000];
  int iteration = 0;
  for (int i=0; i<placemarks.length; i++) {
    XML[] polygons = placemarks[i].getChildren("MultiGeometry/Polygon");
    for (int n=0; n<polygons.length; n++) {
      myMapShape[iteration] = new MapShape(polygons[n]);
      iteration++;
    }
  }
}


void parsePoints() {
  marker_data = loadStrings("Countries.txt");
  markers = new String[marker_data.length][3];
  myMapMarker = new MapMarker[marker_data.length];
  for (int i=0; i < marker_data.length; i++) {
    markers[i] = marker_data[i].split(", ");
    myMapMarker[i] = new MapMarker(markers[i][0], float(markers[i][1]), float(markers[i][2]));
    println(i + ": " + markers[i][0] + " / " + markers[i][1] + " / " + markers[i][2]);
  }
}


void mouseClicked() {
  polar = !polar;
}

