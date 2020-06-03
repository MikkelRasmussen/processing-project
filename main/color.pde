class Color {

  PVector location;
  float startAngle, endAngle;

  int red, blue, green;

  int size = 200;

  int currentID;
  int cc;

  boolean contrast = false;


  Color(float x, float y, float a1, float a2, int c, int id) {

    location = new PVector(x, y);
    currentID = id;
    startAngle = a1*PI/180;
    endAngle = a2*PI/180;

    cc = c;
  }

  void display() { 
    color c = cc;

    fill(c);
    switch(Case) {
    case 1:
      if (IsPointInsideArc(mouseX, mouseY, location.x, location.y, size, startAngle, endAngle) ) {
        selectedColor = cc;
        arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
      } else {
        arc(location.x, location.y, size, size, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
      }
      break;
    case 2:
      if (IsPointInsideArc(mouseX, mouseY, location.x, location.y, size, startAngle, endAngle)) {
        contrastColor(currentID);
        selectedColor = cc;
        arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
        /*fill(selectedColor); Meningen var at det skulle videre udvikles til at lave  cirkelen i midten til at vise farven samt komplementær farven op af hinanden.
         arc(location.x, location.y, size/5, size/5, halfCircleStart(startAngle), halfCircleEnd(endAngle));
         println(halfCircleStart(startAngle));
         println(halfCircleEnd(endAngle)); */
      } else if (contrast) {
        contrastColors[0] = cc;
        arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
        contrast = false;
      } else {
        arc(location.x, location.y, size, size, startAngle, endAngle );
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
      }

      break;
    case 3:
      if (IsPointInsideArc(mouseX, mouseY, location.x, location.y, size, startAngle, endAngle)) {
        contrastColorDuo(currentID);
        selectedColor = cc;
        arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
        fill(selectedColor);
        ellipse(width/2, 325/2+100, 40, 40);
      } else if (contrast) {
        arc(location.x, location.y, size*1.2, size*1.2, startAngle, endAngle);
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
        contrast = false;
      } else {
        arc(location.x, location.y, size, size, startAngle, endAngle );
        fill(255);
        ellipse(width/2, 325/2+100, 160, 160);
      }
      break;
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


void contrastColor(int id) {
  int contrastID=0;
  if (id > 6) {
    contrastID = id-6;
  } else if (id <= 6) {
    contrastID = id+6;
  }

  if (contrastID > 0) {
    Color contrastColor = colors.get(contrastID-1); 
    contrastColor.contrast = true;
  }
}
void contrastColorDuo(int id) {
  int contrastID=0;
  for (int i = 1; i < 3; i++) { 

    if (id + 4*i <= 12) {
      contrastID = id+4*i;
    } else if (id + 4*i > 12) {
      contrastID = id-12+4*i;
    }
    if (contrastID > 0) {
      Color contrastColor = colors.get(contrastID-1); 
      contrastColor.contrast = true;
      contrastColors[i-1] =  contrastColor.cc; 
    }
    
    
    
  }
}

/* Skulle beregne en ny vinkel ud fra den nye, men i stedet for at være 30grader af cirklen skal den være 180 grader  (Virker ikke pt)*/

float halfCircleStart(float ang) {
  float angle;
  if (degrees(ang)-75 >= 0) {
    angle = radians(degrees(ang)-75);
    return angle;
  } else if (degrees(ang)-75 < 0) {
    angle = radians(degrees(ang)-75+360);
    return angle;
  } else {
    return 0;
  }
}
float halfCircleEnd(float ang) {
  float angle;
  if (degrees(ang)+75 <= 360) {
    angle = radians(degrees(ang)+75);
    return angle;
  } else if (degrees(ang)+75 > 360) {
    angle = radians(degrees(ang)+75-360);
    return angle;
  } else {
    return 0;
  }
}
