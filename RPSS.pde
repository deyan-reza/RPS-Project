int screen = 0;
int gravity = 5; 
PImage sc;
Boolean click = false;
Boolean active = false;
PVector p1, p2;
PVector Dup = new PVector(0,-150);
PVector Ddown = new PVector(0,4);
PVector Dleft = new PVector(-4,0);
PVector Dright = new PVector(4,0);
PVector def = new PVector(0,0);
RPSchar c1, c2;
Rock r1, r2;
Scissor s1, s2;
int pvD1 = 1;
int pvD2 = -1;

void setup() {
  size(1080,720);
  frameRate(30);
  sc = loadImage("backg.png");
  background(sc);
  p1 = new PVector(150,475);
  p2 = new PVector(930,475);
  c1 = new RPSchar(225,p1);
  c2 = new RPSchar(0,p2);
  r1 = new Rock(def);
  r2 = new Rock(def);
  s1 = new Scissor(def);
  s2 = new Scissor(def);
}

  void p1SPAWN() {p1 = new PVector(150,475); c1.pos = p1; c1.health = 100; c1.shield_stock = 5; c1.shield_health = 50;}
  void p2SPAWN() {p2 = new PVector(930,475); c2.pos = p2; c2.health = 100; c2.shield_stock = 5; c2.shield_health = 50;}

void draw() {
  if (screen == 0) {
    sc = loadImage("backg.png");
    background(sc);
    if (mouseX > 170 && mouseX < 490 && mouseY > 325 && mouseY < 570 && click == true) {delay(10); screen = 2; click = false;}
    if (mouseX > 565 && mouseX < 875 && mouseY > 325 && mouseY < 570 && click == true) {delay(10); screen = 1; click = false;}
  }
  
  if (screen == 1) {
  sc = loadImage("ctrl.png");
  background(sc);
  if (mouseX > 930 && mouseX < 1075 && mouseY > 585 && mouseY < 715 && click == true) {delay(10); screen = 0;}
  }
  
  if (screen == 2) {
  sc = loadImage("maps.png");
  background(sc);
  if (mouseX > 930 && mouseX < 1075 && mouseY > 585 && mouseY < 715 && click == true) {delay(10); screen = 0;}
  if (mouseX > 120 && mouseX < 375 && mouseY > 275 && mouseY < 445 && click == true) {delay(10); screen = 3;}
  if (mouseX > 410 && mouseX < 670 && mouseY > 275 && mouseY < 445 && click == true) {delay(10); screen = 4;}
  if (mouseX > 720 && mouseX < 980 && mouseY > 275 && mouseY < 445 && click == true) {delay(10); screen = 5;}
  }
  
  if (screen == 3) { //implement gravity
  sc = loadImage("r.jpg");
  background(sc);
  fill(0,0,0);
  rect(100, 500, 880, 15);
  gravity =  2;
  update();
  }
  
  if (screen == 4) { //base map no specials
  sc = loadImage("p.jpg");
  background(sc);
  fill(0,0,0);
  rect(100, 500, 880, 15);
  update();
  }
  
  if (screen == 5) { //`platform
  sc = loadImage("s.jpg");
  background(sc);
  fill(0,0,0);
  rect(100, 500, 880, 15);
  rect(200, 425, 100, 15);
  rect(780, 425, 100, 15);
  rect(350, 350, 100, 15);
  rect(630, 350, 100, 15);
  rect(490, 425, 100, 15);
  rect(490, 275, 100, 15);
  update();
  }
  
  if (screen == 6) {
  sc = loadImage("Black.png");
  background(sc);
  if (mouseX > 930 && mouseX < 1075 && mouseY > 585 && mouseY < 715 && click == true) {delay(10); screen = 0; setup();}
  }
  
  if (screen == 7) {
  sc = loadImage("White.png");
  background(sc);
  if (mouseX > 930 && mouseX < 1075 && mouseY > 585 && mouseY < 715 && click == true) {delay(10); screen = 0; setup();}
  }
  
  click = false;
}
  
void update() {
  disp();
  if (c1.shAct == true) {actShield(1);}
  if (c1.left == true) {p1.add(Dleft);}
  if (c1.right == true) {p1.add(Dright);}
  fill(c1.colr,c1.colr,c1.colr);
  rect(p1.x,p1.y - 20,10,25);
  ellipse(p1.x + 5, p1.y - 30, 20, 20);
  rect(p1.x - 15, p1.y - 20, 15, 10);
  rect(p1.x + 10, p1.y - 20, 15, 10);
  rect(p1.x - 3, p1.y + 5, 5, 20);
  rect(p1.x + 8, p1.y + 5, 5, 20);
  
  if (c2.shAct == true) {actShield(2);}
  if (c2.left == true) {p2.add(Dleft);}
  if (c2.right == true) {p2.add(Dright);}
  fill(c2.colr,c2.colr,c2.colr);
  rect(p2.x,p2.y - 20,10,25);
  ellipse(p2.x + 5, p2.y - 30, 20, 20);
  rect(p2.x - 15, p2.y - 20, 15, 10);
  rect(p2.x + 10, p2.y - 20, 15, 10);
  rect(p2.x - 3, p2.y + 5, 5, 20);
  rect(p2.x + 8, p2.y + 5, 5, 20);
    
  if (c1.shield_health < 1) {c1.shield_stock -=1; c1.shield_health = 50;}
  if (c2.shield_health < 1) {c2.shield_stock -=1; c2.shield_health = 50;}
  if (c1.shield_stock < 1) {c1.shAct = false;}
  if (c2.shield_stock < 1) {c2.shAct = false;}
  
  PVector cent1 = new PVector(p1.x + 10, p1.y + 10);
  PVector cent2 = new PVector(p2.x + 10, p2.y + 10);
  
  if (r1.out == true) {fill(78, 78, 78); rect(r1.pos.x,r1.pos.y,3,3); r1.pos.x += r1.speed;}
  if (r2.out == true) {fill(78, 78, 78); rect(r2.pos.x,r2.pos.y,3,3); r2.pos.x += r2.speed;}
  if (r1.out == true && (r1.pos.x < 0 || r1.pos.x > 1080 || r1.pos.y > 720 || r1.pos.y < 0)) {r1.out = false;}
  if (r2.out == true && (r2.pos.x < 0 || r2.pos.x > 1080 || r2.pos.y > 720 || r2.pos.y < 0)) {r2.out = false;}
  if (r1.out == true && (cent2.dist(r1.pos) < 15) && c2.shAct == true) {c2.shield_health -= r1.damage; r1.out = false;}
  if (r1.out == true && (cent2.dist(r1.pos) < 12) && c2.shAct == false) {c2.health -= r1.damage; r1.out = false;}
  if (r2.out == true && (cent1.dist(r2.pos) < 15) && c1.shAct == true) {c1.shield_health -= r2.damage; r2.out = false;}
  if (r2.out == true && (cent1.dist(r2.pos) < 12) && c1.shAct == false) {c1.health -= r2.damage; r2.out = false;}
  
  if (c1.jump == true) {
  if (screen == 3 || screen == 4) {
    if (p1.y == 475 && p1.x > 100 && p1.x < 980) {c1.jump = false;}
  }
  if (screen == 5) {
    if ((p1.y == 475 && p1.x > 100 && p1.x < 980) || (p1.y == 400 && p1.x > 195 && p1.x < 300) || (p1.y == 400 && p1.x > 485 && p1.x < 590) || (p1.y == 400 && p1.x > 775 && p1.x < 880) || (p1.y == 325 && p1.x > 625 && p1.x < 730) || (p1.y == 325 && p1.x > 345 && p1.x < 450) || (p1.y == 250 && p1.x > 490 && p1.x < 590)) 
  {c1.jump = false;}
  }
}

if (c2.jump == true) {
  if (screen == 3 || screen == 4) {
    if ( p2.y == 475 &&  p2.x > 100 &&  p2.x < 980) {c2.jump = false;}
  }
  if (screen == 5) {
    if ((p1.y == 475 && p1.x > 100 && p1.x < 980) || (p2.y == 400 &&  p2.x > 195 &&  p2.x < 300) || ( p2.y == 400 &&  p2.x > 485 &&  p2.x < 590) || ( p2.y == 400 &&  p2.x > 775 &&  p2.x < 880) || ( p2.y == 325 &&  p2.x > 625 &&  p2.x < 730) || ( p2.y == 325 &&  p2.x > 345 &&  p2.x < 450) || ( p2.y == 250 &&  p2.x > 490 &&  p2.x < 590)) 
  {c2.jump = false;}
  }
}

  if (screen == 5) {gravCy();}
  if (screen == 3 || screen == 4) {grav();}
  death();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {jump(c1);}
  if (key == 's' || key == 'S') {if (c1.shield_stock > 0) {c1.shAct = true;}}
  if (key == 'a' || key == 'A') {c1.left = true; pvD1 = -1;}
  if (key == 'd' || key == 'D') {c1.right = true; pvD1 = 1;}
  if (key == 'q' || key == 'Q') {sci(1);}
  if (key == 'e' || key == 'E') {rok(1);}
  
  if (key == 'i' || key == 'I') {jump(c2);}
  if (key == 'k' || key == 'K') {if (c2.shield_stock > 0) {c2.shAct = true;}}
  if (key == 'j' || key == 'J') {c2.left = true; pvD2 = -1;}
  if (key == 'l' || key == 'L') {c2.right = true; pvD2 = 1;}
  if (key == 'u' || key == 'U') {sci(2);}
  if (key == 'o' || key == 'O') {rok(2);}
}

void keyReleased() {
  if (key == 'w' || key == 'W') {}
  if (key == 's' || key == 'S') {c1.shAct = false;}
  if (key == 'a' || key == 'A') {c1.left = false;}
  if (key == 'd' || key == 'D') {c1.right = false;}
  if (key == 'q' || key == 'Q') {}
  if (key == 'e' || key == 'E') {}
  
  
  if (key == 'i' || key == 'I') {}
  if (key == 'k' || key == 'K') {c2.shAct = false;}
  if (key == 'j' || key == 'J') {c2.left = false;}
  if (key == 'l' || key == 'L') {c2.right = false;}
  if (key == 'u' || key == 'U') {}
  if (key == 'o' || key == 'O') {}
}

void jump(RPSchar chr) {
  if (chr.jump == false) {
  chr.jump = true;
  int pg = gravity;
  gravity = 0;
  chr.pos.add(Dup);
  gravity = pg;}
}

void grav() {
  if (p1.y != 475 || p1.x < 100 || p1.x > 980) {p1.y += gravity;}
  if (p2.y != 475 || p2.x < 100 || p2.x > 980) {p2.y += gravity;}
}

void gravCy() {
  if ((p1.y != 475 || p1.x < 100 || p1.x > 980) && (p1.y != 400 || p1.x < 195 || p1.x > 300) && (p1.y != 400 || p1.x < 485 || p1.x > 590) && (p1.y != 400 || p1.x < 775 || p1.x > 880) && (p1.y != 325 || p1.x < 625 || p1.x > 730) && (p1.y != 325 || p1.x < 345 || p1.x > 450) && (p1.y != 250 || p1.x < 490 || p1.x > 590)) {p1.y += gravity;}
  if ((p2.y != 475 || p2.x < 100 || p2.x > 980) && (p2.y != 400 || p2.x < 195 || p2.x > 300) && (p2.y != 400 || p2.x < 485 || p2.x > 590) && (p2.y != 400 || p2.x < 775 || p2.x > 880) && (p2.y != 325 || p2.x < 625 || p2.x > 730) && (p2.y != 325 || p2.x < 345 || p2.x > 450) && (p2.y != 250 || p2.x < 490 || p2.x > 590)) {p2.y += gravity;}
}

void death() {
   if ( p1.x < 0 || p1.x > 1080 || p1.y > 720 || p1.y < 0 || c1.health < 1) {c1.stock -= 1; c1.jump = false; p1SPAWN();}
   if ( p2.x < 0 || p2.x > 1080 || p2.y > 720 || p2.y < 0 || c2.health < 1) {c2.stock -= 1; c2.jump = false; p2SPAWN();}
   if (c1.stock < 1) {win(6);}
   if (c2.stock < 1) {win(7);}
}

void disp() {
fill (225,225,225);
rect (100,550,250,65);
fill (0,0,0);
rect (740,550,250,65);
textSize(60);
fill (0,0,0);
text("White:" + c1.health, 100, 600);
fill (225,225,225);
text("Black:" + c2.health, 740, 600); 
  fill (225,225,225);
  if (c1.stock == 3) {rect(360,550,20,25); rect(390,550,20,25); rect(420,550,20,25);}
  if (c1.stock == 2) {rect(360,550,20,25); rect(390,550,20,25);}
  if (c1.stock == 1) {rect(360,550,20,25);}
  fill(0,0,200);
  if (c1.shield_stock == 5) {rect(360,585,20,25); rect(390,585,20,25); rect(420,585,20,25); rect(450,585,20,25); rect(480,585,20,25);}
  if (c1.shield_stock == 4) {rect(360,585,20,25); rect(390,585,20,25); rect(420,585,20,25); rect(450,585,20,25);}
  if (c1.shield_stock == 3) {rect(360,585,20,25); rect(390,585,20,25); rect(420,585,20,25);}
  if (c1.shield_stock == 2) {rect(360,585,20,25); rect(390,585,20,25);}
  if (c1.shield_stock == 1) {rect(360,585,20,25);}
  if (c1.shield_stock == 0) {}
  
  fill (0,0,0);
  if (c2.stock == 3) {rect(710,550,20,25); rect(680,550,20,25); rect(650,550,20,25);}
  if (c2.stock == 2) {rect(710,550,20,25); rect(680,550,20,25);}
  if (c2.stock == 1) {rect(710,550,20,25);}
  fill(0,0,200);
  if (c2.shield_stock == 5) {rect(710,585,20,25); rect(680,585,20,25); rect(650,585,20,25); rect(620,585,20,25); rect(590,585,20,25);}
  if (c2.shield_stock == 4) {rect(710,585,20,25); rect(680,585,20,25); rect(650,585,20,25); rect(620,585,20,25);}
  if (c2.shield_stock == 3) {rect(710,585,20,25); rect(680,585,20,25); rect(650,585,20,25);}
  if (c2.shield_stock == 2) {rect(710,585,20,25); rect(680,585,20,25);}
  if (c2.shield_stock == 1) {rect(710,585,20,25);}
  if (c2.shield_stock == 0) {}

}

void win(int P) {
  screen = P;
}

public void actShield(int c) {
    if (c == 1) {fill(0,0,200,30);
      rect(p1.x - 10,p1.y - 40,30, 75, 95);}
    if (c == 2) {fill(0,0,200,30);
      rect(p2.x - 10,p2.y - 40,30, 75, 95);}
    
  }

void mouseClicked() {
    if (click == true) {click = false;} 
    else {click = true;}
  }

void sci(int chr) {
if (chr == 1) {
if ((c1.left == false && c1.right == false) || (c1.left == true && c1.right == true)) {s1 = new Scissor(p1); s1.range = 40; fill(113,113,113); rect(p1.x-s1.range/4,p1.y - 18, s1.range,3);
if ((p2.dist(s1.pos) < s1.range) && (c2.shAct == false)) {c2.health -= s2.damage;}
if ((p2.dist(s1.pos) < s1.range) && (c2.shAct == true)) {c2.shield_stock -= 1;}
}
if (c1.left == true) {s1 = new Scissor(p1); s1.range = 20; fill(113,113,113); rect(p1.x-s1.range,p1.y - 18, s1.range,3);
if ((p2.dist(s1.pos) < s1.range*2) && (c2.shAct == false)) {c2.health -= s2.damage;}
if ((p2.dist(s1.pos) < s1.range*2) && (c2.shAct == true)) {c2.shield_stock -= 1;}
}
if (c1.right == true) {s1 = new Scissor(p1); s1.range = 20; fill(113,113,113); rect(p1.x+s1.range,p1.y - 18, s1.range,3);
if ((p2.dist(s1.pos) < s1.range*2) && (c2.shAct == false)) {c2.health -= s2.damage;}
if ((p2.dist(s1.pos) < s1.range*2) && (c2.shAct == true)) {c2.shield_stock -= 1;}
}
  }
  
if (chr == 2) {
if ((c2.left == false && c2.right == false) || (c2.left == true && c2.right == true)) {s2 = new Scissor(p2); s2.range = 40; fill(113,113,113); rect(p2.x-s2.range/4,p2.y - 18, s2.range,3);
if ((p1.dist(s2.pos) < s2.range) && (c1.shAct == false)) {c1.health -= s1.damage;}
if ((p1.dist(s2.pos) < s2.range) && (c1.shAct == true)) {c1.shield_stock -= 1;}

}
if (c2.left == true) {s2 = new Scissor(p2); fill(113,113,113); rect(p2.x-s2.range,p2.y - 18, s2.range,3);
if ((p1.dist(s2.pos) < s2.range*2) && (c1.shAct == false)) {c1.health -= s1.damage;}
if ((p1.dist(s2.pos) < s2.range*2) && (c1.shAct == true)) {c1.shield_stock -= 1;}
}
if (c2.right == true) {s2 = new Scissor(p2); fill(113,113,113); rect(p2.x+s2.range,p2.y - 18, s2.range,3);
if ((p1.dist(s2.pos) < s2.range*2) && (c1.shAct == false)) {c1.health -= s1.damage;}
if ((p1.dist(s2.pos) < s2.range*2) && (c1.shAct == true)) {c1.shield_stock -= 1;}
}
  }
}
void rok(int cha) {
  if (cha == 1 && r1.out == false) {PVector bar1 = new PVector(p1.x + 10,p1.y+10);
  if (pvD1 == -1) {r1 = new Rock(bar1); r1.out = true; r1.speed = r1.speed * pvD1;}
  if (pvD1 == 1) {r1 = new Rock(bar1); r1.out = true; r1.speed = r1.speed * pvD1;}
  }
  if (cha == 2 && r2.out == false) {PVector bar2 = new PVector(p2.x + 10,p2.y+10);
  if (pvD2 == -1) {r2 = new Rock(bar2); r2.out = true; r2.speed = r2.speed * pvD2;}
  if (pvD2 == 1) {r2 = new Rock(bar2); r2.out = true; r2.speed = r2.speed * pvD2;}  
}
}
  
  /*textSize(12);
    if (click == true) {
    text(mouseX + "," + mouseY, mouseX, mouseY); 
    fill(100, 80, 10);}*/
