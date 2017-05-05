/* @pjs font="co2-48.ttf"; 
 preload="fono.jpg"; 
 */

ArrayList pexens, oxels, stringers, belgas, lotes;
float[] loteX = new float[50];
float[] loteY = new float[50];
int conty, contclic, contarr, conttecla = 0;
float limpiarX = 1;
boolean limpio = false;
PImage fono;
PFont fuente;
String[] pexenString, belgaString, oxelString, stringerString;

void setup() {
  size(700, 525);
  frameRate(50);
  noCursor();
  pexens = new ArrayList();
  oxels = new ArrayList();
  stringers = new ArrayList();
  belgas = new ArrayList();
  lotes = new ArrayList();
  fono = loadImage("fono.jpg");
  fuente = createFont("co2-48.ttf", 48);
  pexens.add(new Pexen(-8000, -8000, 0)); //Trampa
  belgas.add(new Belga(-8000, -8000, 0)); //Trampa
  oxels.add(new Oxel(-8000, -8000, 0)); //Trampa
  stringers.add(new Stringer(-8000, -8000, 0, 0)); //Trampa
  lotes.add(new Lote (-8000, -8000, 600)); //Trampa
}
void draw() {
  image(fono, 0, 0);
  mousy();
  for (int i = pexens.size()-1; i >= 1; i--) { 
    Pexen pexen = (Pexen) pexens.get(i);
    pexen.mover();
    pexen.display();
    if (pexen.finished()) {
      pexens.remove(i);
    }
  }
  for (int i = oxels.size()-1; i >= 1; i--) { 
    Oxel oxel = (Oxel) oxels.get(i);
    oxel.mover();
    oxel.mostrar();
    if (oxel.finished()) {
      oxels.remove(i);
    }
  }
  for (int i = stringers.size()-1; i >= 1; i--) { 
    Stringer stringer = (Stringer) stringers.get(i);
    stringer.mover();
    stringer.mostrar();
    if (stringer.finished()) {
      stringers.remove(i);
    }
  }
  for (int i = belgas.size()-1; i >= 1; i--) { 
    Belga belga = (Belga) belgas.get(i);
    belga.mover();
    belga.display();
    if (belga.finished()) {
      belgas.remove(i);
    }
  }
  for (int i = lotes.size()-1; i >= 1; i--) { 
    Lote lote = (Lote) lotes.get(i);
    lote.mover();
    lote.mostrar();
    if (lote.finished()) {
      lotes.remove(i);
      conty--;//Remover items para liberar espacio de memoria
    }
  }
  if (limpio == true) {
    limpiar();
  }
  else {
  }
  strokeWeight(10);
  noFill();
  stroke(0, 110);
  rectMode(CORNER);
  noSmooth();
  rect(0, 0, width, height);
  strokeWeight(5);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    if (contclic < 5) {
      int randow = int(random(0, 100));
      if (randow > 0 && randow < 50) {
        int a = int(random(0, 90));
        pexens.add(new Pexen(mouseX, mouseY, a));
        contclic++;
      }
      else if (randow > 50) {
        int a = int(random(0, 90));
        belgas.add(new Belga(mouseX, mouseY, a));
        contclic++;
      }
    }
  }
  else if (mouseButton == RIGHT) {
    if (conty < 5) {
      loteX[conty] = mouseX;
      loteY[conty] = mouseY;
      lotes.add(new Lote (loteX[conty], loteY[conty], conty));
      conty++;
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN || keyCode == RIGHT || keyCode == LEFT) {
      if (contarr < 4) {
        int x = int(random(-140, 440));
        int y = int(random(300, 400));
        int a = int(random(0, 90));
        oxels.add(new Oxel(x, y, a));
        contarr++;
      }
    }
  }
  else if (key == ENTER) {
    saveFrame("capture-####.jpg");
  }
  else if (key == ' ') {
    limpio = true;
  }
  else {
    if (conttecla < 3) {
      int x = int(random(-200, 400));
      int y = int(random(300, 400));
      int n = int(random(6, 20));
      int a = int(random(0, 90));
      stringers.add(new Stringer(x, y, n, a));
      conttecla++;
    }
  }
}

class Belga {
  float x, y, ax, ay;
  float px, py, contra, a = 0;
  int alfa, nuy = 0;
  int sumar = 5;
  int fade = 255;
  int life = 0;
  int ronda = int(random(1000, 3000));

  Belga(float mX, float mY, int num) {
    x = mX;
    y = mY;
    ax = mX;
    ay = mY;
    nuy = num;
  }
  void mover() {
    a += 0.2;
    contra = x + 80; //Variable de control del Lienzo
    px-=sumar;
    if (px < -contra) {
      px = 700;
      y = random(50, 450);
    }
    life++;
    if (life > ronda) {
      fade-=5;
    }
  }
  boolean finished() {
    if (fade < 0) {
      contclic--;
      return true;
    }
    else {
      return false;
    }
  }
  void display() {
    if (limpio == true) {
      fade-=5;
    }
    if (loteX[0] > (x-px)-50 && loteX[0] < (x+px)+50 && 
      loteY[0] > y+(sin(a)*2)-50 && loteY[0] < y+(sin(a)*2)+50) {
      if (ronda > 1000 && ronda < 3000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 3000 && ronda < 3000) {
        sumar = 0;
        y-=2;
      }
    }
    else if (loteX[1] > (x-px)-50 && loteX[1] < (x+px)+50 && 
      loteY[1] > y+sin(a)*2-50 && loteY[1] < y+sin(a)*2+50) {
      if (ronda > 1000 && ronda < 3000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 3000 && ronda < 3000) {
        sumar = 0;
        y-=2;
      }
    }
    else if (loteX[2] > (x+px)-50 && loteX[2] < (x+px)+50 && 
      loteY[2] > y+(sin(a)*2)-50 && loteY[2] < y+(sin(a)*2)+50) {
      if (ronda > 1000 && ronda < 3000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 3000 && ronda < 3000) {
        sumar = 0;
        y-=2;
      }
    }
    else if (loteX[3] > (x+px)-50 && loteX[3] < (x+px)+50 && 
      loteY[3] > y+(sin(a)*2)-50 && loteY[3] < y+(sin(a)*2)+50) {
      if (ronda > 1000 && ronda < 2000) {
        sumar = -5;
        fade-=10;
      }
      else if (ronda > 2000 && ronda < 3000) {
        sumar = -5;
      }
    }
    else if (loteX[4] > (x+px)-50 && loteX[4] < (x+px)+50 && 
      loteY[4] > y+(sin(a)*2)-50 && loteY[4] < y+(sin(a)*2)+50) {
      if (ronda > 1000 && ronda < 2000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 2000 && ronda < 3000) {
        sumar = 0;
        y-=2;
      }
    }
    else {
      sumar = 5;
    }
    if (mouseX > (x+px)-50 && mouseX < (x+px)+50 && 
      mouseY > y+(sin(a)*2)-50 && mouseY < y+(sin(a)*2)+50) {
      sumar = 0; //Detener Criatura
      alfa = 255;
    }
    else {
      alfa = 0;
    }
    if (fade < 255) {
      fade-=10;
    }
    smooth();
    textFont(fuente, 18);
    noFill();
    stroke(15, fade);
    pushMatrix();
    noFill();
    strokeWeight(5);
    ellipse(x+px, y+sin(a)*2, 50, 50);
    strokeWeight(4);
    ellipse((x+40)+px, y+sin(a)*-1, 30, 30);
    ellipse((x+65)+px, y+sin(a)*1, 20, 20);
    strokeWeight(3);
    ellipse((x+80)+px, y+sin(a)*1, 10, 10);
    fill(10, alfa);
    text("Belga_"+int(ax/100)+int(ay/100)+nuy, (x+px)-20, y+45);
    popMatrix();
  }
}

void mousy() {
  pushMatrix();
  smooth();
  noStroke();
  fill(40, 140);
  triangle(mouseX, mouseY, mouseX+25, mouseY+ 20, mouseX+10, mouseY+30);
  for (int i=1; i < 40; i+=5) {
    stroke(30, 60-i);
    noFill();
    strokeWeight(5);
    ellipse(mouseX, mouseY, i, i);
  }
  popMatrix();
}

void limpiar() {
  smooth();
  noFill();
  strokeWeight(2);
  stroke(40, 160);
  ellipse(width/2, height/2, limpiarX/3, limpiarX/3);
  strokeWeight(3);
  ellipse(width/2, height/2, limpiarX/2, limpiarX/2);
  strokeWeight(4);
  ellipse(width/2, height/2, limpiarX, limpiarX);
  limpiarX*=1.5;
  if (limpiarX > 800) {
    limpio = false;
  }
  if (limpio == false) {
    limpiarX = 1;
  }
}
class Lote {
  float x, y, r1, r2, r3;
  int cont = 0;
  int c;
  int fade = 255;
  float sumi = -28;

  Lote(float mX, float mY, int conty) {
    x = mX;
    y = mY;
    c = conty;
  }
  boolean finished() {
    //Fade-out
    cont++;
    if (cont > 200) {
      fade-=30;
    }
    if (fade < 0) {
      loteX[c] = -80000000;
      loteY[c] = -80000000;
      cont = 0;
      return true;
    }
    else {
      return false;
    }
  }
  void mover() {
    //Fade-out
    r1 = random(-7, 7);
    r2 = random(-3, 5);
    r3 = random(-6, 3);
    sumi+=0.2;
  }
  void mostrar() {
    if(limpio == true){
      fade-=20;
    }
    smooth();
    stroke(15, fade);
    strokeWeight(3);
    noStroke();
    fill(15, fade);
    pushMatrix();
    ellipse(x+r1, y+r2, 5-sumi, 5-sumi);
    ellipse(x+r3, y+r1-2, 10-sumi, 10-sumi);
    ellipse(x+r2-1, y+r3, 7-sumi, 7-sumi);
    ellipse(x+r1+3, y+r2+3, 15-sumi, 15-sumi);
    ellipse(x+r2+8, y+r3-8, 10-sumi, 10-sumi);
    ellipse(x+r2+6, y+r1+6, 20-sumi, 20-sumi);
    popMatrix();
  }
}

class Oxel {
  float f, a, px, py, ax, ay = 0;
  float v = 0.5;
  int sumar = 2;
  int alfa, nuy = 0;
  int fade = 255;
  int multi = 8;
  int life = 0;
  int ronda = int(random(900, 1800));

  Oxel(float x, float y, int num) {
    px = x;
    py = y;
    ax = x;
    ay = y;
    nuy = num;
  }
  void mover() {
    a += v;
    f = random(-3, 3);
    f = constrain(f, -3, 3);
    py-=sumar;
    if (py < -300) {
      py = 630;
      px = random(-170, 480);
    }
    life++;
    if (life > ronda) {
      fade-=5;
    }
  }
  boolean finished() {
    if (fade < 0) {
      contarr--;
      return true;
    }
    else {
      return false;
    }
  }
  void mostrar() {
    if(limpio == true){
      fade-=5;
    }
    if (ax < 0) {
      ax = ax*-1;
    }
    if (loteX[0] > (206+(sin(a + PI)*2)+px)-40 && loteX[0] < (206+(sin(a + PI)*2)+px)+40 && 
      loteY[0] > (141+py)-40 && loteY[0] < (141+py)+40) {
      if (ronda > 900 && ronda < 1300) {
        sumar = -5;
      }
      else if (ronda > 1300) {
        sumar = 0;
        px-=2;
      }
    }
    else if (loteX[1] > (206+(sin(a + PI)*2)+px)-40 && loteX[1] < (206+(sin(a + PI)*2)+px)+40 && 
      loteY[1] > (141+py)-40 && loteY[1] < (141+py)+40) {
      if (ronda > 900 && ronda < 1300) {
        sumar = -5;
      }
      else if (ronda > 1300) {
        sumar = 0;
        px-=2;
      }
    }
    else if (loteX[2] > (206+(sin(a + PI)*2)+px)-40 && loteX[2] < (206+(sin(a + PI)*2)+px)+40 && 
      loteY[2] > (141+py)-40 && loteY[2] < (141+py)+40) {
      sumar = -5;
    }
    else if (loteX[3] > (206+(sin(a + PI)*2)+px)-40 && loteX[3] < (206+(sin(a + PI)*2)+px)+40 && 
      loteY[3] > (141+py)-40 && loteY[3] < (141+py)+40) {
      if (ronda > 900 && ronda < 1300) {
        sumar = -5;
      }
      else if (ronda > 1300) {
        sumar = -5;
        fade-=10;
      }
    }
    else if (loteX[4] > (206+(sin(a + PI)*2)+px)-40 && loteX[4] < (206+(sin(a + PI)*2)+px)+40 && 
      loteY[4] > (141+py)-40 && loteY[4] < (141+py)+40) {
      if (ronda > 900 && ronda < 1300) {
        sumar = 0;
        px+=2;
      }
      else if (ronda > 1300) {
        sumar = 0;
        px-=2;
      }
    }
    else {
      sumar = 2;
    }
    if (mouseX > (206+(sin(a + PI)*2)+px)-40 && mouseX < (206+(sin(a + PI)*2)+px)+40 && 
      mouseY > (141+py)-40 && mouseY < (141+py)+40) {
      sumar = 0; //Detener Criatura
      multi = 0;
      alfa = 255;
    }
    else {
      multi = 8;
      alfa = 0;
    }
    if (fade < 255) {
      fade-=10;
    }
    textFont(fuente, 18);
    noFill();
    smooth();
    pushMatrix();
    strokeWeight(6);
    stroke(15, fade);
    ellipse(206+(sin(a + PI)*2)+px, 141+py, 40, 40);
    noStroke();
    fill(15, fade);
    ellipse((206+f)+px, 137+py, 20, 20);
    stroke(15, fade);
    noFill();
    strokeWeight(4);
    beginShape();
    vertex(206.0+px, 161.0+py);
    bezierVertex(206.0+(sin(a + PI)*multi)+px, 161.0+py, 182.0+(sin(a + PI)*-multi)+px, 184.0+py, 217.0+(sin(a + PI)*-multi+1+px), 213.0+py);
    bezierVertex(252.0+(sin(a + PI)*multi)+px, 242.0+py, 203.0+(sin(a + PI)*multi)+px, 273.0+py, 200.0+(sin(a + PI)*multi+1)+px, 272.0+py);
    endShape();
    noSmooth();
    fill(10, alfa);
    text("Oxel_"+int(ax/100)+int(ay/100)+nuy, 170.0+(sin(a + PI)*multi)+px, 290.0+py);
    popMatrix();
  }
}

class Pexen {
  float x, y, ax, ay, n;
  float px, py, contra = 0;
  int alfa, nuy = 0;
  int sumar = 5;
  int fade = 255;
  int life = 0;
  int ronda = int(random(2000, 4000));

  Pexen(float mX, float mY, int num) {
    x = mX;
    y = mY;
    ax = mX;
    ay = mY;
    nuy = num;
  }
  void mover() {
    contra = 800 - x; //Variable de control del Lienzo
    n+= random(-8, 8);
    n = constrain(n, -8, 8);
    px+=sumar;
    if (px > contra) {
      px = contra - 800;
      y = random(50, 450);
    }
    life++;
    if (life > ronda) {
      fade-=5;
    }
  }
  boolean finished() {
    if (fade < 0) {
      contclic--;
      return true;
    }
    else {
      return false;
    }
  }
  void display() {
    if (limpio == true) {
      fade-=5;
    }
    if (loteX[0] > (x+px)-50 && loteX[0] < (x+px)+50 && 
      loteY[0] > y+(n*0.9)-50 && loteY[0] < y+(n*0.9)+50) {
      if (ronda > 2000 && ronda < 3000) {
        sumar = -5;
      }
      else if (ronda > 3000 && ronda < 4000) {
        sumar = 0;
        y+=2;
      }
    }
    else if (loteX[1] > (x+px)-50 && loteX[1] < (x+px)+50 && 
      loteY[1] > y+(n*0.9)-50 && loteY[1] < y+(n*0.9)+50) {
      if (ronda > 2000 && ronda < 3000) {
        sumar = -5;
      }
      else if (ronda > 3000 && ronda < 4000) {
        sumar = 0;
        y+=2;
      }
    }
    else if (loteX[2] > (x+px)-50 && loteX[2] < (x+px)+50 && 
      loteY[2] > y+(n*0.9)-50 && loteY[2] < y+(n*0.9)+50) {
      if (ronda > 2000 && ronda < 3000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 3000 && ronda < 4000) {
        sumar = 0;
        y-=2;
      }
    }
    else if (loteX[3] > (x+px)-50 && loteX[3] < (x+px)+50 && 
      loteY[3] > y+(n*0.9)-50 && loteY[3] < y+(n*0.9)+50) {
      if (ronda > 2000 && ronda < 3000) {
        sumar = -5;
        fade-=10;
      }
      else if (ronda > 3000 && ronda < 4000) {
        sumar = -5;
      }
    }
    else if (loteX[4] > (x+px)-50 && loteX[4] < (x+px)+50 && 
      loteY[4] > y+(n*0.9)-50 && loteY[4] < y+(n*0.9)+50) {
      if (ronda > 2000 && ronda < 3000) {
        sumar = 0;
        y+=2;
      }
      else if (ronda > 3000 && ronda < 4000) {
        sumar = 0;
        y-=2;
      }
    }
    else {
      sumar = 5;
    }
    if (mouseX > (x+px)-50 && mouseX < (x+px)+50 && 
      mouseY > y+(n*0.9)-50 && mouseY < y+(n*0.9)+50) {
      sumar = 0; //Detener Criatura
      alfa = 255;
    }
    else {
      alfa = 0;
    }
    if (fade < 255) {
      fade-=10;
    }
    textFont(fuente, 18);
    noFill();
    stroke(15, fade);
    rectMode(CENTER);
    strokeWeight(5);
    pushMatrix();
    rect(x+px, y+(n*0.9), 50, 50);
    rect((x-40)+px, y+n, 30, 30);
    rect((x-65)+px, y+n/2, 20, 20);
    rect((x-80)+px, y+n/3, 10, 10);
    noSmooth();
    fill(10, alfa);
    text("Pexen_"+int(ax/100)+int(ay/100)+nuy, (x+px)-65, y+50);
    popMatrix();
  }
}

class Stringer {
  float f, a = 0;
  float v = 0.15;
  float px, py, ax, ay, dor;
  int alfa, nuy = 0;
  int sumar = 3;
  int fade = 255;
  int life = 0;
  int ronda = int(random(2000, 3000));

  Stringer(int x, int y, int por, int num) {
    px = x;
    py = y;
    ax = x;
    ay = y;
    dor = por;
    nuy = num;
  }
  void mover() {
    a += v;
    f = constrain(random(-5, 5), -5, 5);
    px-=(sin(a + PI)*dor);
    if (py < -300) {
      py = 630;
      px = random(-170, 480);
    }
    life++;
    if(life > ronda){
      fade-=5;
    }
  }
  boolean finished() {
    if (fade < 0) {
      conttecla--;
      return true;
    }
    else {
      return false;
    }
  }
  void mostrar() {
    if(limpio == true){
      fade-=20;
    }
    if(ax < 0){
      ax = ax*-1;
    }
    textFont(fuente, 48);
    fill(15, fade);
    stroke(15, 255);
    strokeWeight(7);
    noSmooth();
    pushMatrix();
    translate(px, py-=sumar);
    textFont(fuente, 18);
    fill(15, alfa);
    text("Stringer_"+int(ax/100)+int(ay/100)+nuy, 160, 280);
    pushMatrix();
    stroke(15, fade);
    line(215, 188, 215, 233);
    popMatrix();
    pushMatrix();
    noFill();
    noStroke();
    fill(15, fade);
    textFont(fuente, 58);
    translate(width/2-150, height/2-60);
    rotate(31);
    scale(1.0, 1.0);
    fill(15, fade);
    text("F", 15+f, 40);
    popMatrix();
    pushMatrix();
    fill(15, fade);
    textFont(fuente, 58);
    translate(width/2-150, height/2-60);
    rotate(-31);
    scale(-1.0, 1.0);
    fill(15, fade);
    text("F", -15+f*-1, 29);
    popMatrix();
    pushMatrix();
    fill(15, fade);
    textFont(fuente, 48);
    scale(1.0, -1.0);
    text("Y", 200, -220);
    popMatrix();
    pushMatrix();
    fill(15, fade);
    textFont(fuente, 48);
    scale(1.0, 1.0);
    translate(width/2-150, height/2-60);
    rotate(HALF_PI);
    text("8", -33, 3);
    popMatrix();
    if (mouseX > (210+px)-40 && mouseX < (210+px)+40 && 
      mouseY > (210+py)-50 && mouseY < (210+py)+50) {
      sumar = 0; //Detener Criatura
      dor = 0;
      alfa = 255;
    }else{
      sumar = 3;
      dor = random(6, 20);
      alfa = 0;
    }
    popMatrix();
  }
}