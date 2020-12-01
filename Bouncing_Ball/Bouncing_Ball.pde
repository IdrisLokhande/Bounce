//****
//Bouncing Ball v1.7.0 by Idris Lokhande
//Subscribe to my channel Shining Times on YouTube
//****
import controlP5.*;

ControlP5 MyController;

//****
// MyController is an object for ControlP5 class
// ControlP5 is for sliders
//****

PVector v, v2, v3, v4, v5, v6, v7, v8;

//****
// PVector v is for the x and y coordinates of the ball
// PVector v2-v6 are for the x and y coordinates of the letters E N T E R at the menu
// PVector v7 is for the string "Bouncing Ball" at the menu
// PVector v8 is for the x and y coordinates of the ellipse at the loading screen
//****

float z = 0, x1 = -20, x2 = 1365, easing = 1, ry=697, speed, speeda, speedb, za = -0.8, yl = 340, load1 = 25, load2 = 0, s = 15;

float xl[] = {692.5,692.5}, gravity[] = {0.1,0.1}, breaker[] = {0,0}, animatedEllipse[] = {0.1, -0.8, 37};

//****
// breaker[] is for faces
// gravity[] is for thr gravity of the letters (gravity[0]) at the start and for the ball (gravity[1])
// xl[] is for the line at the menu under the ENTER text
// animatedEllipse[] is for the ellipse at the loading screen (animatedEllipse[0] for gravity, animatedEllipse[1] for the bounce and animatedEllipse[2] for the radius)
//****

color c = 255, n = 25, Red = 0, Blue = 0, Green = 0;

//****
// color c and n are for the colors of the ball and other miscellaneous purposes
// color Red, Green and Blue are for the background
//****

String string[] = {"", "BOUNCING BALL", "v1.7.0", "LOADING...", "SUCCESS!", "Press e to exit the game"};
String loadScreen[] = {"Once upon a time, a wise old man said, \"Gotta kick some balls\".", "Bored in lockdown? Play with this bAlL.", "Fun fact: Balls are always round.", "Now you can customize the ball!", "You can play around with the ball with your mouse!"};

//****
// string[] is for miscellaneous purposes
// loadScreen[] is for the random appearing texts at the loading screen
//****

char h[] = {'E', 'N', 'T', 'E', 'R'};

boolean correct[]={true, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false};

//****
// corrrect[0 - 8] : colors and GUI
// correct[9] : starts the game and loading screen
// correct[10] : checks if the mouse is dragged
// correct[11] : checks if the loading screen is 100% successful
// correct [12] : maintains the loading screen and helps in loading all the variables and clearing the menu before starting

//**
 // correct[13]: checks if the 'e' key is pressed
 // correct[14] and correct[15]: for the options 'yes' and 'no' and checks which of these conditions are true
 // correct[13 - 15] are for keyPressed1() function
//** 

//**
 // correct[16]: checks if the 'e' key is pressed
 // correct[17] and correct[18]: for the options 'yes' and 'no' and checks which of these conditions are true
 // correct[16 - 18] are for keyPressed2() function
//** 
//****

void setup() {
  fullScreen(); 
  
  keyPressed=false;
  
  smooth(2);
  noStroke();  
  ellipseMode(RADIUS);
  
  frameRate(120);
  
  v = new PVector(680,500);
  
  v2 = new PVector(408,100);
  v3 = new PVector(544,90);
  v4 = new PVector(680,80);
  v5 = new PVector(816,90);
  v6 = new PVector(952,100);
  
  v7 = new PVector(536,450);
  
  v8 = new PVector((1366/2)-14, 300);
  
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
  correct[15]=true;
  if(correct[15]==true){
  stroke(255);
  strokeWeight(5);
  textSize(40);
  
  text(h[0],v2.x,v2.y);
  
  text(h[1],v3.x,v3.y);
  
  text(h[2],v4.x,v4.y);
  
  text(h[3],v5.x,v5.y);
  
  text(h[4],v6.x,v6.y);
  
  v2.y+=speeda;
  v3.y+=speeda;
  v4.y+=speeda;
  v5.y+=speeda;
  v6.y+=speeda;
  
  speeda+=gravity[0]/2;

  if(v2.y>=330||v3.y>=330||v4.y>=330||v5.y>=330||v6.y>=330){
  if(v2.y>=100){  
  speeda*=za;
  v2.y=abs(330);
  }
  if(v3.y>=100){  
  speeda*=za;
  v3.y=abs(330);
  }
  if(v4.y>=100){  
  speeda*=za;
  v4.y=abs(330);
  }
  if(v5.y>=100){  
  speeda*=za;
  v5.y=abs(330);
  }
  if(v6.y>=100){  
  speeda*=za;
  v6.y=abs(330);
  }
  }
  za+=0.0001;
  if(za>=-0.78){
   v2.x+=3;
   v3.x+=2.5;
   v5.x-=2.5;
   v6.x-=3;
   
   if(v2.x>=625){
    v2.x-=3;
   }
   if(v3.x>=650){
    v3.x-=2.5;
   }
   if(v5.x<=710){
    v5.x+=2.5;
   }
   if(v6.x<=735){
    v6.x+=3;
   }
  }
  
  if(v6.x<=736){
  stroke(n-55);
  strokeWeight(2);
  line(xl[0],yl,xl[1],yl);
  
   xl[0]-=3;
   xl[1]+=3;
  }
  if(xl[0]<=618){
   xl[0]+=3;
  text(string[1],v7.x,v7.y);
  textSize(20);
  text(string[2],660,480);
  
  pushMatrix();
  textSize(20);
  text(string[5],578,530);
  popMatrix();
  
  v7.x = random(535,539);
  }
  if(xl[1]>=766){
   xl[1]-=3;
  }
  
  if(v6.x<=760){
   textSize(40);
   string[0]="PRESS";
   text(string[0],635,280);
  }
  keyPressed2();
  }
  if(keyCode==ENTER && correct[16]==true){
  key=0;
  }else if(keyCode == ENTER && correct[16]==false){ 
   correct[12]=true; 
  }
   if(correct[12]){  
   h[0]=' ';
   h[1]=' ';
   h[2]=' ';
   h[3]=' ';
   h[4]=' ';
   
   string[5]="";
   string[2]="";
   string[1]="";
   string[0]="";
   
   v2.x=0;
   v3.x=0;
   v4.x=0;
   v5.x=0;
   v6.x=0;
   v7.x=0;
   
   v2.y=0;
   v3.y=0;
   v4.y=0;
   v5.y=0;
   v6.y=0;
   v7.y=0;
   
   clear();
   
   stroke(255); 
   fill(255);
   
   ellipse(v8.x, v8.y, animatedEllipse[2], animatedEllipse[2]);
   
   stroke(0);
   fill(0);
   
   pushMatrix();
   strokeWeight(8);
   point((v8.x)-17, (v8.y)-13);
   point((v8.x)+17, (v8.y)-13);
   popMatrix();
   
   pushMatrix();
   strokeWeight(4);
   line((v8.x)-10, (v8.y)+12, (v8.x), (v8.y)+15);
   line((v8.x)+10, (v8.y)+12, (v8.x), (v8.y)+15);
   popMatrix();
   
   stroke(255); 
   fill(255);

   pushMatrix();
   stroke(128);
   strokeWeight(4);
   line((1366/2)-54, 385, (1366/2)+27, 385);
   popMatrix();
 
   v8.y+=speedb;
   speedb+=animatedEllipse[0];
  
   if(v8.y>=400){
   speedb*= animatedEllipse[1];
   }
   if(speedb>=3){
   speedb = 3.75;
   speedb*=animatedEllipse[1];
   }
   
   stroke(51);
   noFill();
   strokeWeight(5);
   
   line(25,730,1341,730);
   
   stroke(255);
    
   textSize(20); 
    
   line(25,730,load1,730);
 
   load1+=random(1,1.5);
  
   text(string[3],25,720);
    
   textSize(15);
  
   if(frameCount >= 0){  
   text(loadScreen[0],460,705);
   }
   if(frameCount >= 300){
   loadScreen[0]="";
   }
   if(frameCount >= 301){
   text(loadScreen[1],530,705);
   }
   if(frameCount >= 600){
   loadScreen[1]="";
   }
   if(frameCount >= 601){
   text(loadScreen[2],550,705);
   }
   if(frameCount >= 900){
   loadScreen[2]="";
   }
   if(frameCount >= 901){
   text(loadScreen[3],550,705);
   }
   if(frameCount >= 1200){
   loadScreen[3]="";
   }
   if(frameCount >=1201){
   text(loadScreen[4],490,705);
   }
   if(frameCount >= 1500){
   loadScreen[4]="";
   }
   if(frameCount >= 1501){
   loadScreen[0] = "Once upon a time, a wise old man said, \"Gotta kick some balls\".";
   loadScreen[1] = "Bored in lockdown? Play with this bAlL.";
   loadScreen[2] = "Fun fact: Balls are always round.";
   loadScreen[3] = "Now you can customize the ball!";
   loadScreen[4] = "You can play around with the ball with your mouse!";
   
   frameCount=0;
   } 
    
   textSize(20); 
    
   if(load1>=1341){
    load1=1341;
    text(string[4], 135, 720);
    load2+=0.6;
   }
   
   if(load2>=25){
    correct[11] = true;
    load2 = 26;
   }
   
   n = 55;
   
   if(correct[11]==true){
   v8.y=0;
   animatedEllipse[0]=0;
   animatedEllipse[1]=0;
  
   clear();
   correct[9] = true;
   correct[11] = true;
   }
   }
  if(correct[9]){
  MyController.show();

  background(Red,Green,Blue);
 
  noStroke();
  noFill();
  line (mouseX, mouseY, v.x, v.y);
  
  n = 55;
  
  fill(c);
  stroke(c);
  strokeWeight(5);
  ellipse(v.x, v.y, s, s);

  v.y+=speed;
  speed+=gravity[1];
  
  fill(255,100);
  noStroke();
  rect(2.5,ry,132.5,18.5);
  
  if(breaker[0]>=1){
  strokeWeight(3);
  stroke(0);
  point(v.x-6,v.y-6);
  point(v.x+6,v.y-6);
  line(v.x-5,v.y+5,v.x,v.y+7);
  line(v.x+5,v.y+5,v.x,v.y+7);
  ry=717.5;
  if(ry>=737||ry<=697){
    breaker[0]=0;
  }
  }
  if(breaker[1]>=1){
  strokeWeight(3);
  stroke(0);
  point(v.x-6,v.y-6);
  point(v.x+6,v.y-6);
  line(v.x-4,v.y+7,v.x,v.y+5);
  line(v.x+4,v.y+7,v.x,v.y+5);
  ry=737;
  if(ry<737){
    breaker[1]=0;
  }
  }
  
  if(v.y>=500){
   speed *= z;
   v.y=abs(500);
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
  text("x: "+v.x+"\ny: "+v.y+"\nspeed:"+speed, 2.5,11);
  
  text("Press RIGHT key to move the ball to right",1122,11);
  text("Press LEFT key to move the ball to left",1140,25);
  text("Press TAB key to set y as 75",1200,38);
  text("Press SPACE BAR to jump",1215,52);
  
  text("Made by: Idris Lokhande",1215,762.5);
  
  text("WHITE (Press w)",17,540);
  text("RED (Press r)",17,560);
  text("BLUE (Press b)",17,580);
  text("GREEN (Press g)",17,600);
  text("YELLOW (Press y)",17,620);
  text("PINK (Press p)",17,640);
  text("ORANGE (Press o)",17,660);
  text("CYAN (Press c)",17,680);
  
  text("HAPPY FACE (Press h)",6,732);
  text("SAD FACE (Press s)",6,751);
  text("NO FACE (Press n)",6,711);
  
  textSize(150);
  text("{",1280,660);
  
  textSize(190);
  text("}",140,692);
  
  textSize(15);
  text("Change Background \n          Colour",1122,610);
  text("Customize\n     Ball",210,627);
  
  string[5]="Press e to exit the game";
  
  pushMatrix();
  textSize(20);
  text(string[5],578,550);
  popMatrix();
  
  noStroke();
  fill(255,50);
  rect(1210,748,200,45);
  
  fill(255,100);
  if(correct[0]){
  correct[8]=false;  
  rect(2.5,525.75,132.5,18.5);
  }else if(correct[8]){
  rect(2.5,525.75,132.5,18.5);
  }
  if(correct[1]){
  correct[8]=false;
  rect(2.5,545.75,132.5,18.5);
  }else if(correct[2]){
  correct[8]=false;  
  rect(2.5,565.75,132.5,18.5);
  }else if(correct[3]){
  correct[8]=false;  
  rect(2.5,585.75,132.5,18.5);
  }else if(correct[4]){
  correct[8]=false;  
  rect(2.5,605.75,132.5,18.5);
  }else if(correct[5]){
  correct[8]=false;  
  rect(2.5,625.75,132.5,18.5);
  }else if(correct[6]){
  correct[8]=false;  
  rect(2.5,645.75,132.5,18.5);
  }else if(correct[7]){
  correct[8]=false;  
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
  
  keyPressed1();
  }
}

void mousePressed(){
  if(correct[9]){
  detected();
  mousePressed=true;
  if(mouseX<=v.x+23&&mouseX>=v.x-23&&mouseY<=v.y+23&&mouseY>=v.y-23){ 
  gravity[1] = 0;
  speed = 0;
  c = 140;
  correct[10]=true;
  if(correct[0]){
   c=140;
  }else if(correct[1]){
   c=#C90216;
  }else if(correct[2]){
   c=#0224B4;
  }else if(correct[3]){
   c=#05A008;
  }else if(correct[4]){
   c=#B9B107;
  }else if(correct[5]){
   c=#C1049F;
  }else if(correct[6]){
   c=#D3940B;
  }else if(correct[7]){
   c=#07CEE3;
  }
  }else{
   correct[10]=false;
  }
  }
}

void mouseDragged(){
  if(correct[9]){ 
  mousePressed=true;
  if(correct[10]==true){
  if(mouseX<=v.x+23&&mouseX>=v.x-23&&mouseY<=v.y+23&&mouseY>=v.y-23){ 
  gravity[1] = 0;
  speed = 0;
  c = 140;
  if(correct[0]){
   c=140;
  }else if(correct[1]){
   c=#C90216;
  }else if(correct[2]){
   c=#0224B4;
  }else if(correct[3]){
   c=#05A008;
  }else if(correct[4]){
   c=#B9B107;
  }else if(correct[5]){
   c=#C1049F;
  }else if(correct[6]){
   c=#D3940B;
  }else if(correct[7]){
   c=#07CEE3;
  }
  }  
  float targetX = mouseX;
  float dx = targetX - v.x;
  v.x += dx * abs(easing);
  
  float targetY = mouseY;
  float dy = targetY - v.y;
  v.y += dy * abs(0.5);
  
  if(v.y<=75){
   v.y -= dy * 0.5;
  }
  if(v.x<0){
   v.x -= dx * 0.05;
  }
  if(v.x>1360){
   v.x -= dx * 0.05;
  }
  if(v.y>=500){
   v.y -= dy * easing;
   v.y=500;
  }
  }else{
   correct[10]=false;
  }
  }
  }

void mouseReleased(){
  if(correct[9]){  
  c=255;
  
  if(correct[0]){
   c=255;
  }else if(correct[1]){
   c=#FF0015;
  }else if(correct[2]){
   c=#0024FF;
  }else if(correct[3]){
   c=#00FF0E;
  }else if(correct[4]){
   c=#FFF300;
  }else if(correct[5]){
   c=#FF00D1;
  }else if(correct[6]){
   c=#FFAF00;
  }else if(correct[7]){
   c=#00E8FF;
  }
  
  cursor(ARROW);

  if(v.y<=100&&v.y>=0){
  z=-0.7;
  z+=0.0005;
  }else if(v.y<=200&&v.y>=100){
  z=-0.66;
  z+=0.0005;
  }else if(v.y>=200&&v.y<=300){
  z=-0.63;
  z+=0.0005;
  }else if(v.y>=300&&v.y<=400){
  z=-0.6;
  z+=0.0005;
  }else if(v.y>=400&&v.y<=440){
  z=-0.575;
  z+=0.0005;
  }else if(v.y>=440&&v.y<=450){
  z=-0.56;
  z+=0.0005;
  }else if(v.y>=450&&v.y<=480){
  z=-0.545;
  z+=0.0005;
  }else if(v.y>=480&&v.y<=495){
  z=-0.52;
  z+=0.0005;
  }else if(v.y>=495&&v.y<=499){
  z=-0.504;
  z+=0.0005;
  }else if(v.y<=500){
  z=-2.5125628E-6;
  }
  
  v.y+=speed;
  speed+=gravity[1];
  gravity[1] = 0.1;
  
  if(v.y>=500){
   speed *= z;
   v.y=abs(500);
  }
  }
}

void keyPressed(){
if(correct[9]){  
if(keyCode==TAB){
  if(z>-2.5125628E-6){
    v.y=75;
    z=-0.7;
  }
  if(mousePressed==true&&correct[10]==true){
   v.y=round(mouseY);
  }
}else if(key==' '){
  if(z>-2.5125628E-6){
    v.y-=speed;
    speed-=6; 
    z=-0.63;
  }
  if(mousePressed==true&&correct[10]==true){
   gravity[1] = 0;
   speed = 0;
  }
}else if(keyCode==RIGHT){
  v.x+=5;
 
  if(mousePressed==true){
   v.x-=5;
  }
  
  if(v.x>1360){
   v.x -= 5;
  }
}else if(keyCode==LEFT){
  v.x-=5;
 
  if(mousePressed==true){
   v.x+=5;
  }
  
  if(v.x<0){
   v.x += 5;
  }
}else if(key=='w'){
   c=255;
   correct[0]=true;
   correct[1]=false;
   correct[2]=false;
   correct[3]=false;
   correct[4]=false;
   correct[5]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='r'){
   c=#FF0015;
   correct[1]=true;
   correct[0]=false;
   correct[2]=false;
   correct[3]=false;
   correct[4]=false;
   correct[5]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='b'){
   c=#0024FF;
   correct[2]=true;
   correct[0]=false;
   correct[1]=false;
   correct[3]=false;
   correct[4]=false;
   correct[5]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='g'){
   c=#00FF0E;
   correct[3]=true;
   correct[0]=false;
   correct[1]=false;
   correct[2]=false;
   correct[4]=false;
   correct[5]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='y'){
   c=#FFF300;
   correct[4]=true;
   correct[0]=false;
   correct[1]=false;
   correct[2]=false;
   correct[3]=false;
   correct[5]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='p'){
   c=#FF00D1;
   correct[5]=true;
   correct[0]=false;
   correct[1]=false;
   correct[2]=false;
   correct[3]=false;
   correct[4]=false;
   correct[6]=false;
   correct[7]=false;
  }else if(key=='o'){
   c=#FFAF00;
   correct[6]=true;
   correct[0]=false;
   correct[1]=false;
   correct[2]=false;
   correct[3]=false;
   correct[4]=false;
   correct[5]=false;
   correct[7]=false;
  }else if(key=='c'){
   c=#00E8FF;
   correct[7]=true;
   correct[0]=false;
   correct[1]=false;
   correct[2]=false;
   correct[3]=false;
   correct[4]=false;
   correct[5]=false;
   correct[6]=false;
  }else if (key=='n'){
  ry=697;
  breaker[0]=0;
  breaker[1]=0;
  }else if (key=='h'){
  breaker[0]=2;
  breaker[1]=0;
  }else if (key=='s'){
  breaker[1]=2;
  breaker[0]=0;
  }
}
if (keyCode == ESC) 
  {
    key = 0;
  }
}

void detected(){
 if(mouseX<=v.x+23&&mouseX>=v.x-23&&mouseY<=v.y+23&&mouseY>=v.y-23){
   cursor(HAND);
  }else{
   cursor(ARROW);
  }
}

void confirm(){
 noStroke();
 fill(255,100);
 rect(545,365,277,55);
 
 pushMatrix();
 stroke(0);
 strokeWeight(2);
 fill(200,100);
 rect(545,395,138.5,25);
 rect((138.5+545.0),395,138.5,25);
 popMatrix();
  
 stroke(255);
 fill(255);
 textSize(20);
 text("Do you really want to exit?", 555, 385);
 
 pushMatrix();
 textSize(15);
 stroke(0);
 text("YES (Press y)",566,413);
 text("NO (Press n)",706,413);
 popMatrix();
}

void keyPressed1(){
if(key=='e'){
  correct[13]=true;
}
if(correct[13]==true){
 correct[9]=false;
 correct[10]=false;
 
 clear();
 background(0);
 
 confirm();
 
 MyController.hide();
 
  if (key=='n'){
   correct[14]=true;
  }else{
   correct[14]=false;
  }
  if(correct[14]==true){
   correct[13]=false;
  }
 if(key=='y'){ 
   correct[15]=true;
 }else{
  correct[15]=false;
 }
 if(correct[15]==true){
  super.stop();
  exit();
 }
}
}

void keyPressed2(){
if(key=='e'){
  correct[16]=true;
}
if(correct[16]==true){
 clear();
 confirm();
 
 MyController.hide();
 
  if (key=='n'){
   correct[17]=true;
  }else{
   correct[17]=false;
  }
  if(correct[17]==true){
   correct[16]=false;
  }
 if(key=='y'){ 
   correct[18]=true;
 }else{
  correct[18]=false;
 }
 if(correct[18]==true){
  clear(); 
  super.stop();
  exit();
 }
}
}
//****
//END OF THE CODE
//****
