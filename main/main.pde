/* 
 Indtil videre er det kun mode 1 der virker hvor man kan se farvehjulet og se den
 speciffike farves farvekode, nu mangler jeg kun og få lavet de to ekstra modes 
 hvor man kan få komplementær og tertiære farver ud fra ens valgte farve
 */

/*
  Definerer de 2 Arraylister, som indenholder farverne samt mode knapperne
 */

ArrayList<Color> colors = new ArrayList<Color>();
ArrayList<Mode> modes = new ArrayList<Mode>();

/* 
 Variabler til de givne farver man for når man vælger en farve.
 */
int selectedColor;
int[] contrastColors = new int[2];

/*
  Variable til hvilken case/mode der er aktiv
 */
int Case = 1;

void setup() {


  /* 
   Størrelsen på programmet
   */
  size(400, 600);

  /* 
   Tilføjer de forskellige farver til farvehjulet. 
   */

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

  /*
  Tilføjer de 3 knapper som styrer hvilken mode man befinder sig i til en arrayList
   */
  for (int i = 0; i < 3; i++) {
    modes.add(new Mode(i*width*1/3, 0, width*1/3, 75, i+1));
  }
}


void draw() {
  background(255);

  /*
  Tegner rammen til mode knapperne
   */
  fill(222);
  rect(0, 0, width, 75);
  rect(0, height*2/3+50, width, height*1/3);
  line(width*1/3, 0, width*1/3, 75);
  line(width*2/3, 0, width*2/3, 75);


  /*
  For loop til at display alle min knapper
   */
  for (Mode mode : modes) {
    mode.display();
  } 


  /* 
   Ligesom ovenover er det et for loop som displayer alle farverne af farvehjulet.
   */
  selectedColor = #ffffff;
  for (Color part : colors) {
    part.display();
  }

  /*
   Switch(Case) er det jeg bruger til at styre hvilken mode der er aktiv, da den kun kører det kode
   som befinder sig inde for den aktive case.
   */
  switch(Case) {
  case 1: //Case 1 = Kun valgte farve

    /* 
     Tegner den lille cirkel som highlighter hvilken farve du har markeret. 
     */
    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);

    /*
     Teksten som viser den vagte farve, if statementent bliver brugt til at se om der er blevet valgt en farve,
     og hvis der er valgt en farve, vil farvekoden blive vist.
     */
    fill(0);
    if (selectedColor == -1) {
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
    } else {
      text("Farve: #"+hex(selectedColor, 6), width*1/4-30, height*4/5);
    }
    break;

  case 2: //Case 2 = Valgte farve og komplementær farven.

    /* 
     Tegner den lille cirkel som highlighter hvilken farve du har markeret. 
     */
    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);

    /*
     Teksten som viser den vagte farve, if statementent bliver brugt til at se om der er blevet valgt en farve,
     og hvis der er valgt en farve, vil farvekoden blive vist tiil både farven og komplementær farven.
     */
    fill(0);
    if (selectedColor == -1) {
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
      text("Komplementær Farve: NA", width*1/4-30, height*4/5+30);
    } else {
      text("Farve: #s"+hex(selectedColor, 6), width*1/4-30, height*4/5);
      text("Komplementær Farve: #"+hex(contrastColors[0], 6), width*1/4-30, height*4/5+30);
    }
    break;

  case 3: //Case 3 = Farve og de 2 tertiære farver

    /* 
     Tegner den lille cirkel som highlighter hvilken farve du har markeret. 
     */
    fill(selectedColor);
    ellipse(width/2, 325/2+100, 40, 40);

    /*
     Teksten som viser den vagte farve, if statementent bliver brugt til at se om der er blevet valgt en farve,
     og hvis der er valgt en farve, vil farvekoden blive vist tiil både farven og de tærtiære farver.
     */
    fill(0);
    if (selectedColor == -1) {
      text("Farve: Ikke Valgt", width*1/4-30, height*4/5);
      text("Tertiære Farve 1: NA", width*1/4-30, height*4/5+30);
      text("Tertiære Farve 1: NA", width*1/4-30, height*4/5+60);
    } else {
      text("Farve: #"+hex(selectedColor, 6), width*1/4-30, height*4/5);
      text("Tertiære Farve 1: #"+hex(contrastColors[0], 6), width*1/4-30, height*4/5+30);
      text("Tertiære Farve 1: #"+hex(contrastColors[1], 6), width*1/4-30, height*4/5+60);
    }
    break;
  }
}

/* 
 Funktion som checker hver gang musen bliver kliket om musen er inden for en knap.
 */
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

/* 
 Min måde at checke om musen er inden for en specifik firkant.
 */

boolean modeClicked(float locationX, float locationY, float sizeX, float sizeY) {

  if (mouseX >= locationX && mouseX <= locationX+sizeX && mouseY >= locationY && mouseY <= locationY+sizeY) {  
    return true;
  }
  return false;
}
