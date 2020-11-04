float x = 320;
float y = 75;
float z = -0.7;
float s = 15;

float x1 = -20;
float x2 = 660;

float easing = 1;

float gravity = 0.1;
float speed;

boolean yes = true;

color c = 255;

void setup() {
  size(640, 640); 
  
  smooth(2);
  noStroke();  
  ellipseMode(RADIUS);
  frameRate(90);
  
  cursor(ARROW);
}

void draw() { 
  background(51);
  
  fill(c);
  stroke(c);
  
  ellipse(x, y, s, s);
  
  if(yes){
  y+=speed;
  speed+=gravity;
  }
  if(y>=500){
   speed *= z;
   y=abs(500);
  }
   z+=0.0005;
   if(z>-0.495){
   z*=0.005;
 }
  stroke(255);
  
  strokeWeight(3);
  line(x1,518,x2,518);
  
  strokeWeight(6);
  line(0,58,640,58);
  
  stroke(255);
  fill(255);
  textSize(12);
  text("x: "+x+"\ny: "+y+"\nz:"+z, 0,11);
  text("Press TAB to set y as 0"+"\nspeed:"+speed,505,11);
  text("Made by: Idris Lokhande",495,631);
}
void mousePressed(){
  gravity = 0;
  speed = 0;
  c = 140;
  cursor(HAND);
}
void mouseDragged(){
  gravity = 0;
  speed = 0;
  c = 140;
  cursor(HAND);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * abs(easing);
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * abs(easing);
  
  if(y<=75){
   y -= dy * easing;
  }
  if(x<0){
   x -= dx * easing;
  }
  if(x>640){
   x -= dx * easing;
  }
  if(y>=500){
   y -= dy * easing;
   y=500;
  }
}
void mouseReleased(){
  c = 255;
  
  cursor(ARROW);
  
  if(y<=100&&y>=0){
  z=-0.7;
  z+=0.0005;
  }else if(y<=200&&y>=100){
  z=-0.66;
  z+=0.0005;
  }else if(y>=200&&y<=300){
  z=-0.63;
  z+=0.0005;
  }else if(y>=300&&y<=400){
  z=-0.6;
  z+=0.0005;
  }else if(y>=400&&y<=440){
  z=-0.575;
  z+=0.0005;
  }else if(y>=440&&y<=450){
  z=-0.56;
  z+=0.0005;
  }else if(y>=450&&y<=480){
  z=-0.545;
  z+=0.0005;
  }else if(y>=480&&y<=495){
  z=-0.52;
  z+=0.0005;
  }else if(y>=495&&y<=499){
  z=-0.504;
  z+=0.0005;
  }else if(y<=500){
  z=-2.5125628E-6;
  }
  
  y+=speed;
  speed+=gravity;
  gravity = 0.1;
  
  if(y>=500){
   speed *= z;
   y=abs(500);
  }
}
void keyPressed(){
if(keyCode==TAB){
  if(z>-2.5125628E-6){
    y=75;
    z=-0.7;
  }
}
}
