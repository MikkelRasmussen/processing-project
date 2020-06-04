class Mode {

  /*
  Mode knapperne oprettet som et objekt.
   */

  PVector location, size;

  int modeNumber;

  Mode(float x, float y, float w, float h, int mt) {

    location = new PVector(x, y);
    size = new PVector(w, h);

    modeNumber = mt;
  }

  void display() {
    fill(0);
    textSize(20);
    text("Mode" + modeNumber, location.x+size.x*1/4, 45);



    /* fill(110);
     rect(location.x,location.y,size.x,size.y);*/
  }
}
