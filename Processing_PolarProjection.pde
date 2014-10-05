
// - - - - - - - - - - - - - - - - - - - - - - - 
// MAP PROJECTIONS 092014 V:1.0
// - - - - - - - - - - - - - - - - - - - - - - - 

// FEATURES
// - Parse & Render Mapfile
// - Parse & Render Points

// - - - - - - - - - - - - - - - - - - - - - - - 
// VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 

// Global
boolean polar = true;
int canvasWidth = 800;
int canvasHeight = 800;

// Data
XML kml_data;
String marker_data[];
String markers[][];

// Map
MapShape myMapShape[];
MapMarker myMapMarker[];

// Draw
int markerSize = 4;


// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 

void setup() {
  size(canvasWidth, canvasHeight);
  smooth();
  parseKML();
  parsePoints();
}


// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW
// - - - - - - - - - - - - - - - - - - - - - - - 

void draw() {
  background(50);
  // Draw Map
  for (int i=0; i<myMapShape.length; i++) {
    if (myMapShape[i] != null) {
      myMapShape[i].display();
    }
  }
  // Draw Points
  for (int i=0; i<myMapMarker.length; i++) {
    myMapMarker[i].display();
  }
}

