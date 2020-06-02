class Color {

  PVector location;
  float startAngle, endAngle;

  int red, blue, green;

  int size = 200;

  int cc;

  Color(float x, float y, float a1, float a2, int c) {

    location = new PVector(x, y);

    startAngle = a1*PI/180;
    endAngle = a2*PI/180;

    cc = c;
  }

  void display() {
    color c = cc;

    fill(c);


    if (IsPointInsideArc(mouseX, mouseY, location.x, location.y, size, startAngle, endAngle) ) {
      selectedColor = cc;
      arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
    } else {
      arc(location.x, location.y, size, size, startAngle, endAngle);
    }
  }

  float normalizeAngle(float angle)
  {

    float na = angle % (2 * PI);
    if (na < 0) na = 2*PI + na;
    return na;
  }
  boolean IsPointInsideArc(float pointX, float pointY, 
    float centerX, float centerY, float s, float angle1, float angle2)
  {
    boolean nearCenter = sqrt(sq(pointX - centerX) + sq(pointY - centerY)) <= s /2;
    if (!nearCenter)
      return false;

    float na1 = normalizeAngle(angle1);
    float na2 = normalizeAngle(angle2);
    float a = normalizeAngle(atan2(pointY - centerY, pointX - centerX));

    boolean between;
    if (na1 < na2)
    {
      between = na1 <= a && a <= na2;
    } else
    {
      between = !(na2 <= a && a <= na1);
    }
    return between;
  }
}
