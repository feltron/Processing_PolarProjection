
// - - - - - - - - - - - - - - - - - - - - - - - 
// MAPMARKER CLASS
// - - - - - - - - - - - - - - - - - - - - - - - 

class MapMarker {
  String markerLabel;
  float markerLat;
  float markerLong; 

  MapMarker(String markerLabel_, float markerLat_, float markerLong_) {
    markerLabel = markerLabel_;
    markerLat = markerLat_;
    markerLong = markerLong_;
  }

  void display() {
    fill(200);
    noStroke();
    if (polar) {
      float theta = map(-1*map(markerLong, -180, 180, 0, width), 0, width, PI, TWO_PI+PI);
      float radius = map(map(markerLat, 90, -90, 0, height), 0, height, 0, width/2.0);
      float polar_x = cos(theta) * radius + width/2.0;
      float polar_y = sin(theta) * radius + height/2.0;
      ellipse(polar_x, polar_y, markerSize, markerSize);
      text(markerLabel, polar_x+6, polar_y+4);
    } else {
      float cartesian_x = map(markerLong, -180, 180, 0, width);
      float cartesian_y = map(markerLat, 90, -90, 0, height);
      ellipse(cartesian_x, cartesian_y, markerSize, markerSize);
      text(markerLabel, cartesian_x+6, cartesian_y+4);
    }
  }
}

