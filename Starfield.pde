Particle [] Leo = new Particle[1000]; //setting the # of particles in explosion
int despawnTimer = 0; //timer that despawns the fireworks
int x = 0; //firework coordinates
int y = 0;
boolean respawn = false; //resets the firework

void setup()
{
  size(500, 500);
  background(0);
  despawnTimer = 0;
  respawn = true;
  for (int i = 0; i < Leo.length; i++) { //intializing the explosion
    Leo[i] = new Particle();
  }
  for (int j = 0; j < 10; j++) {
    Leo[j] = new Blimp();
  }
}
void draw()
{  
  fill(0, 64, 234); //scene background
  rect(0, 0, 500, 500);
  fill(0, 64, 0);
  rect(0, 400, 500, 500);
  Firework(); //calling the firework function
  if (y <= -450) {
    for (int i = 0; i < Leo.length; i++) { //drawing the explosion
      Leo[i].show();
      Leo[i].move();
    }
    for (int j = 0; j < Leo.length; j++) {
      Leo[j].show();
      Leo[j].move();
    }
    if (despawnTimer > 145000) {
      despawnTimer = 0;
    }
  }
}

void mousePressed () {
  redraw();
  respawn = true;
}

class Particle
{
  double myX, myY, myAngle, mySize, mySpeed;
  int myColor;
  Particle () {
     myX = Math.random()+x+250; //initalizing variables
     myY = Math.random()+y+100;
     myAngle = Math.random()*Math.PI;
     mySpeed = Math.random()*40;
     myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move () {
    if (respawn == true) {
      //if (despawnTimer < 140000) {
        myX += cos((float)(Math.random()*2)*(float)myAngle + (float)mySpeed*2); //firework explosion
        myY += sin((float)(Math.random()*2)*(float)myAngle + (float)mySpeed*2);
      //}
    }
    despawnTimer += 1;
  }
  void show () {
    if (respawn == true) {
      //if (despawnTimer < 140000) {
        fill(myColor); //drawing the explosion
        ellipse((float)myX, (float)myY, 5, 5);
      //}
    }
  }
}

class Blimp extends Particle
{
  int myWidth, myHeight, myOpacity;
  Blimp() {
    myX = -300;
    myY = (int)(Math.random()*30)+50;
    myWidth = (int)(Math.random()*80)+160;
    myHeight = (int)(Math.random()*40)+40;
    mySpeed = 2;
    myColor = (int)(Math.random()*20)+80;
    myOpacity = (int)(Math.random()*60)+100;
  }
  void move () {
    if (despawnTimer >= 5000) {
      myX += mySpeed;
      if (myX > 950)
        myX = -100; 
    }
  }
  void show () {
    fill(myColor, myOpacity);
    ellipse((float)myX, (float)myY, myWidth, myHeight);
  }
}

void Firework () {
  fill(245, 10, 0); //firework middle
  rect(x+250, y+400, 20, 35); 
  fill(0, 255, 255);
  triangle(x+245, y+400, x+260, y+380, x+275, y+400);
  fill(245, 10, 0); //firework left
  rect(x+150, y+400, 20, 35);
  fill(0, 255, 255);
  triangle(x+145, y+400, x+160, y+380, x+175, y+400);
  fill(245, 10, 0); //firework right
  rect(x+350, y+400, 20, 35);
  fill(0, 255, 255);
  triangle(x+345, y+400, x+360, y+380, x+375, y+400);
  if (mousePressed) {
    x+=(int)(random(-10, 10));
    y-=30;
  }
}
