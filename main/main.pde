ArrayList<Color> colors = new ArrayList<Color>();
int selectedColor;

void setup() {

  size(400, 600);


  colors.add(new Color(width/2, height/2, 0, 30, #f3e500)); 
  colors.add(new Color(width/2, height/2, 30, 60, #fdc50c));
  colors.add(new Color(width/2, height/2, 60, 90, #f28f1a));

  colors.add(new Color(width/2, height/2, 90, 120, #e96220));
  colors.add(new Color(width/2, height/2, 120, 150, #e32322));
  colors.add(new Color(width/2, height/2, 150, 180, #c5037d));

  colors.add(new Color(width/2, height/2, 180, 210, #6d398b));
  colors.add(new Color(width/2, height/2, 210, 240, #454e99));
  colors.add(new Color(width/2, height/2, 240, 270, #2a71af));

  colors.add(new Color(width/2, height/2, 270, 300, #0696bb));
  colors.add(new Color(width/2, height/2, 300, 330, #008f5a));
  colors.add(new Color(width/2, height/2, 330, 360, #8dbb25));
}


void draw() {
  background(255);
  selectedColor = #ffffff;

  for (Color part : colors) {
    part.display();
  }


  fill(255);
  ellipse(width/2, height/2, 160, 160);

  fill(selectedColor);
  ellipse(width/2, height/2, 40, 40);

  println(selectedColor);
  
  fill(0);
  if (selectedColor == -1) {
    text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
  } else {
    text("Farve: "+hex(selectedColor), width*1/4-30, height*4/5);
  }
}
