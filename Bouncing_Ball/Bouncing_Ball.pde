import controlP5.*;

float x = 680, y = 75, z = -0.7, s = 15, x1 = -20, x2 = 1365, spx = 536, spy = 450, easing = 1, ry=687, ae=0, af=0, gravity = 0.1, speed;
float speeda, za = -0.8, xa = 408, xb = 544, xc=680, xd = 816, xe = 952, ya = 100, yb = 90, yc = 80, yd = 90, ye = 100, gravitya=0.1, xla = 692.5, xlb = 692.5, yl = 340;

color c = 255, n = 255;
color Red = 0;
color Blue = 0;
color Green = 0;

ControlP5 MyController;

String string = "", sp = "BOUNCING BALL", sc="v1.5.0";
char h = 'E', i = 'N', j = 'T', k = 'E', l = 'R';

boolean a=false, b=false, d=false, e=false, f=false, g=false, m=false, o=false, yes=true, no=false, isDragged=false;

void setup() {
  size(1366,768); 
  keyPressed=false;
  smooth(2);
  noStroke();  
  ellipseMode(RADIUS);
  frameRate(90);
  
  MyController = new ControlP5(this);  
  MyController.addSlider("Red",0,75,0,1335,525,10,40);
  MyController.addSlider("Green",0,75,0,1335,590,10,40);
  MyController.addSlider("Blue",0,75,0,1335,655,10,40);
  MyController.setColorForeground(#032AFF);
  MyController.setColorActive(#0638C9);
 
  MyController.hide();
  
  cursor(ARROW);
}

void draw() { 
  background(0,0,45,50);
  stroke(255);
  strokeWeight(5);
  textSize(40);
  
  text(h,xa,ya);
  
  text(i,xb,yb);
  
  text(j,xc,yc);
  
  text(k,xd,yd);
  
  text(l,xe,ye);
  
  ya+=speeda;
  yb+=speeda;
  yc+=speeda;
  yd+=speeda;
  ye+=speeda;
  speeda+=gravitya/2;

  if(ya>=330||yb>=330||yc>=330||yd>=330||ye>=330){
  if(ya>=100){  
  speeda*=za;
  ya=abs(330);
  }
  if(yb>=100){  
  speeda*=za;
  yb=abs(330);
  }
  if(yc>=100){  
  speeda*=za;
  yc=abs(330);
  }
  if(yd>=100){  
  speeda*=za;
  yd=abs(330);
  }
  if(ye>=100){  
  speeda*=za;
  ye=abs(330);
  }
  }
  za+=0.0001;
  if(za>=-0.78){
   xa+=3;
   xb+=2.5;
   xd-=2.5;
   xe-=3;
   
   if(xa>=625){
    xa-=3;
   }
   if(xb>=650){
    xb-=2.5;
   }
   if(xd<=710){
    xd+=2.5;
   }
   if(xe<=735){
    xe+=3;
   }
  }
  
  if(xe<=736){
  stroke(n-55);
  strokeWeight(2);
  line(xla,yl,xlb,yl);
  
   xla-=3;
   xlb+=3;
  }
  if(xla<=618){
   xla+=3;
  text(sp,spx,spy);
  textSize(20);
  text(sc,660,480);
  spx = random(532,538);
  }
  if(xlb>=766){
   xlb-=3;
  }
  
  if(xe<=760){
   textSize(40);
   string="PRESS";
   text(string,635,280);
  }

  if(keyCode == ENTER){
   MyController.show();
   h=' ';
   i=' ';
   j=' ';
   k=' ';
   l=' ';
   string="";
   sp="";
   sc="";
   spx=0;
   clear();
   n = 55;
   no = true;
  }
  if(no){
  background(Red,Green,Blue);
 
  noStroke();
  noFill();
  line (mouseX, mouseY, x, y);
  
  n = 55;
  
  frameRate(90);
  fill(c);
  stroke(c);
  strokeWeight(5);
  ellipse(x, y, s, s);

  y+=speed;
  speed+=gravity;
  
  fill(255,100);
  noStroke();
  rect(2.5,ry,132.5,18.5);
  
  if(ae>=1){
  strokeWeight(3);
  stroke(0);
  point(x-6,y-6);
  point(x+6,y-6);
  line(x-5,y+5,x,y+7);
  line(x+5,y+5,x,y+7);
  ry=705.5;
  if(ry>=723||ry<=687){
    ae=0;
  }
  }
  if(af>=1){
  strokeWeight(3);
  stroke(0);
  point(x-6,y-6);
  point(x+6,y-6);
  line(x-4,y+7,x,y+5);
  line(x+4,y+7,x,y+5);
  ry=723;
  if(ry<723){
    af=0;
  }
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
  strokeWeight(4);
  line(x1,517.75,x2,517.75);
  
  strokeWeight(6);
  line(0,58,1365,58);
  
  stroke(255);
  fill(255);
  textSize(12);
  text("x: "+x+"\ny: "+y+"\nspeed:"+speed, 2.5,11);
  
  text("Press RIGHT key to move the ball to right",1122,11);
  text("Press LEFT key to move the ball to left",1140,25);
  text("Press TAB key to set y as 75",1200,38);
  text("Press SPACE BAR to jump",1215,52);
  
  text("Made by: Idris Lokhande",1215,735);
  
  text("WHITE (Press w)",17,540);
  text("RED (Press r)",17,560);
  text("BLUE (Press b)",17,580);
  text("GREEN (Press g)",17,600);
  text("YELLOW (Press y)",17,620);
  text("PINK (Press p)",17,640);
  text("ORANGE (Press o)",17,660);
  text("CYAN (Press c)",17,680);
  
  text("HAPPY FACE (Press h)",6,720);
  text("SAD FACE (Press s)",6,737);
  text("NO FACE (Press n)",6,701);
  
  stroke(255);
  
  textSize(150);
  text("{",1280,660);
  
  textSize(190);
  text("}",140,690);
  
  textSize(15);
  text("Change Background \n          Colour",1122,610);
  text("Customize\n     Ball",210,625);
  
  noStroke();
  fill(255,50);
  rect(1210,718,200,25);
  
  fill(255,100);
  if(a){
  yes=false;  
  rect(2.5,525.75,132.5,18.5);
  }else if(yes){
  rect(2.5,525.75,132.5,18.5);
  if(!yes){
  fill(30);
  }
  }
  if(b){
  yes=false;
  rect(2.5,545.75,132.5,18.5);
  }else if(d){
  yes=false;  
  rect(2.5,565.75,132.5,18.5);
  }else if(e){
  yes=false;  
  rect(2.5,585.75,132.5,18.5);
  }else if(f){
  yes=false;  
  rect(2.5,605.75,132.5,18.5);
  }else if(g){
  yes=false;  
  rect(2.5,625.75,132.5,18.5);
  }else if(m){
  yes=false;  
  rect(2.5,645.75,132.5,18.5);
  }else if(o){
  yes=false;  
  rect(2.5,665.75,132.5,18.5);
  }
  
  fill(255);
  rect(5,530,10,10);
  
  fill(#FF0015);
  rect(5,550,10,10);
  
  fill(#0024FF);
  rect(5,570,10,10);
  
  fill(#00FF0E);
  rect(5,590,10,10);
  
  fill(#FFF300);
  rect(5,610,10,10);
  
  fill(#FF00D1);
  rect(5,630,10,10);
  
  fill(#FFAF00);
  rect(5,650,10,10);
  
  fill(#00E8FF);
  rect(5,670,10,10);
  }
}

void mousePressed(){
  if(no){
  detected();
  mousePressed=true;
  if(mouseX<=x+23&&mouseX>=x-23&&mouseY<=y+23&&mouseY>=y-23){ 
  gravity = 0;
  speed = 0;
  c = 140;
  isDragged=true;
  if(a){
   c=140;
  }else if(b){
   c=#C90216;
  }else if(d){
   c=#0224B4;
  }else if(e){
   c=#05A008;
  }else if(f){
   c=#B9B107;
  }else if(g){
   c=#C1049F;
  }else if(m){
   c=#D3940B;
  }else if(o){
   c=#07CEE3;
  }
  }else{
   isDragged=false;
  }
  }
}

void mouseDragged(){
  if(no){ 
 mousePressed=true;
  if(isDragged==true){
  if(mouseX<=x+23&&mouseX>=x-23&&mouseY<=y+23&&mouseY>=y-23){ 
  gravity = 0;
  speed = 0;
  c = 140;
  if(a){
   c=140;
  }else if(b){
   c=#C90216;
  }else if(d){
   c=#0224B4;
  }else if(e){
   c=#05A008;
  }else if(f){
   c=#B9B107;
  }else if(g){
   c=#C1049F;
  }else if(m){
   c=#D3940B;
  }else if(o){
   c=#07CEE3;
  }
  }  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * abs(easing);
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * abs(0.5);
  
  if(y<=75){
   y -= dy * 0.5;
  }
  if(x<0){
   x -= dx * 0.05;
  }
  if(x>1360){
   x -= dx * 0.05;
  }
  if(y>=500){
   y -= dy * easing;
   y=500;
  }
  }else{
   isDragged=false;
  }
  if(key==' '){
   gravity = 0;
   speed = 0;
  }
  }
  }

void mouseReleased(){
  if(no){
  c=255;
  
  if(a){
   c=255;
  }else if(b){
   c=#FF0015;
  }else if(d){
   c=#0024FF;
  }else if(e){
   c=#00FF0E;
  }else if(f){
   c=#FFF300;
  }else if(g){
   c=#FF00D1;
  }else if(m){
   c=#FFAF00;
  }else if(o){
   c=#00E8FF;
  }
  
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
}

void keyPressed(){
if(no){  
if(keyCode==TAB){
  if(z>-2.5125628E-6){
    y=75;
    z=-0.7;
  }
  if(mousePressed==true&&isDragged==true){
   y=round(mouseY);
  }
}else if(key==' '){
  if(z>-2.5125628E-6){
    y-=speed;
    speed-=6; 
    z=-0.63;
  }
  if(mousePressed==true&&isDragged==true){
   gravity = 0;
   speed = 0;
  }
}else if(keyCode==RIGHT){
  x+=5;
  frameRate(120);
  
  if(mousePressed==true){
   x-=5;
  }
  
  if(x>1360){
   x -= 5;
  }
}else if(keyCode==LEFT){
  x-=5;
  frameRate(120);
  
  if(mousePressed==true){
   x+=5;
  }
  
  if(x<0){
   x += 5;
  }
}else if(key=='w'){
   c=255;
   a=true;
   b=false;
   d=false;
   e=false;
   f=false;
   g=false;
   m=false;
   o=false;
  }else if(key=='r'){
   c=#FF0015;
   b=true;
   a=false;
   d=false;
   e=false;
   f=false;
   g=false;
   m=false;
   o=false;
  }else if(key=='b'){
   c=#0024FF;
   d=true;
   b=false;
   a=false;
   e=false;
   f=false;
   g=false;
   m=false;
   o=false;
  }else if(key=='g'){
   c=#00FF0E;
   e=true;
   b=false;
   d=false;
   a=false;
   f=false;
   g=false;
   m=false;
   o=false;
  }else if(key=='y'){
   c=#FFF300;
   f=true;
   b=false;
   d=false;
   e=false;
   a=false;
   g=false;
   m=false;
   o=false;
  }else if(key=='p'){
   c=#FF00D1;
   g=true;
   f=false;
   b=false;
   d=false;
   e=false;
   a=false;
   m=false;
   o=false;
  }else if(key=='o'){
   c=#FFAF00;
   m=true;
   g=false;
   f=false;
   b=false;
   d=false;
   e=false;
   a=false;
   o=false;
  }else if(key=='c'){
   c=#00E8FF;
   o=true;
   m=false;
   g=false;
   f=false;
   b=false;
   d=false;
   e=false;
   a=false;
  }else if (key=='n'){
  ry=687;
  ae=0;
  af=0;
  }else if (key=='h'){
  ae=2;
  af=0;
  }else if (key=='s'){
  af=2;
  ae=0;
}
}
}

void detected(){
 if(mouseX<=x+23&&mouseX>=x-23&&mouseY<=y+23&&mouseY>=y-23){
   cursor(HAND);
  }else{
   cursor(ARROW);
  }
}
