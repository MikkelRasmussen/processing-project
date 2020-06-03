/* Indtil videre er det kun mode 1 der virker hvor man kan se farvehjulet og se den
 speciffike farves farvekode, nu mangler jeg kun og få lavet de to ekstra modes 
 hvor man kan få nogle kontrast og tertiære farver ud fra ens valgte farve */



ArrayList<Color> colors = new ArrayList<Color>();
ArrayList<Mode> modes = new ArrayList<Mode>();

int selectedColor;
int[] contrastColors = new int[2];
int Case = 1;

float m1x = 0, m1y = 0, m1w = width*1/3, m1h = 75;


void setup() {

  size(400, 600);


  colors.add(new Color(width/2, 325/2+100, 0, 30, #f3e500, 1)); 
  colors.add(new Color(width/2, 325/2+100, 30, 60, #fdc50c, 2));
  colors.add(new Color(width/2, 325/2+100, 60, 90, #f28f1a, 3));

  colors.add(new Color(width/2, 325/2+100, 90, 120, #e96220, 4));
  colors.add(new Color(width/2, 325/2+100, 120, 150, #e32322, 5));
  colors.add(new Color(width/2, 325/2+100, 150, 180, #c5037d, 6));

  colors.add(new Color(width/2, 325/2+100, 180, 210, #6d398b, 7));
  colors.add(new Color(width/2, 325/2+100, 210, 240, #454e99, 8));
  colors.add(new Color(width/2, 325/2+100, 240, 270, #2a71af, 9));

  colors.add(new Color(width/2, 325/2+100, 270, 300, #0696bb, 10));
  colors.add(new Color(width/2, 325/2+100, 300, 330, #008f5a, 11));
  colors.add(new Color(width/2, 325/2+100, 330, 360, #8dbb25, 12));

  for (int i = 0; i < 3; i++) {

    modes.add(new Mode(i*width*1/3, 0, width*1/3, 75, i+1));
  }
}


void draw() {
  background(255);


  fill(222);
  rect(0, 0, width, 75);
  rect(0, height*2/3+50, width, height*1/3);
  line(width*1/3, 0, width*1/3, 75);
  line(width*2/3, 0, width*2/3, 75);

  for (Mode mode : modes) {
    mode.display();
  } 

  selectedColor = #ffffff;

  for (Color part : colors) {
    part.display();
  }

  switch(Case) {
  case 1:


    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);



    if (selectedColor == -1) {
      fill(0);
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
    } else {
      fill(selectedColor);
      text("Farve: "+hex(selectedColor), width*1/4-30, height*4/5);
    }
    break;

  case 2:

    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);

    if (selectedColor == -1) {
      fill(0);
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
      text("Komplementær Farve: NA", width*1/4-30, height*4/5+30);
    } else {
      fill(selectedColor);
      text("Farve: "+hex(selectedColor), width*1/4-30, height*4/5);
      fill(contrastColors[0]);
      text("Komplementær Farve: "+hex(contrastColors[0]), width*1/4-30, height*4/5+30);
    }
    break;

  case 3:
    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);



    if (selectedColor == -1) {
      fill(0);
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
      text("Tertiære Farve 1: NA", width*1/4-30, height*4/5+30);
      text("Tertiære Farve 1: NA", width*1/4-30, height*4/5+60);
    } else {
      fill(selectedColor);
      text("Farve: "+hex(selectedColor), width*1/4-30, height*4/5);
      fill(contrastColors[0]);
      text("Tertiære Farve 1: "+hex(contrastColors[0]), width*1/4-30, height*4/5+30);
      fill(contrastColors[1]);
      text("Tertiære Farve 1: "+hex(contrastColors[1]), width*1/4-30, height*4/5+60);
    }
    break;
  }
}

void mouseClicked() {

  println("dddd");

  for (int i = 0; i < 3; i++) {

    Mode currentMode = modes.get(i);

    println(Case);

    boolean mc = modeClicked(currentMode.location.x, currentMode.location.y, currentMode.size.x, currentMode.size.y); 

    if (mc) {
      Case = i+1;
      println(i+1);

      mc = false;
    }
  }
}

boolean modeClicked(float locationX, float locationY, float sizeX, float sizeY) {

  if (mouseX >= locationX && mouseX <= locationX+sizeX && mouseY >= locationY && mouseY <= locationY+sizeY) {  
    return true;
  }
  return false;
}
