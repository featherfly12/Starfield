int a;
color[] colors;

class Oddball extends Particle {
  Oddball() {
    myX = 250;
    myY = 250;
    myAngle = Math.random() * (2 * Math.PI);
    mySpeed = Math.random() * 2 + 0.5;
    mySize = 20;
    myColor = colors[(int)(Math.random() * colors.length)];
  }

  void walk() {
    if (mousePressed) {
      myX = mouseX;
      myY = mouseY;
    }
      if (mouseX>myX){
      myX = myX + (int)(Math.random() *5 - 1);
    }
    else{
      myX = myX + (int)(Math.random() * 5 -3);
    }
    if (mouseY>myY){
      myY = myY + (int)(Math.random() * 5 - 1);
    }
    else{
      myY = myY + (int)(Math.random() * 5 -3);
    }
    myX = myX + (int)(Math.random() * 5 - 3);
    myY = myY + (int)(Math.random() * 5 - 3);
    myColor = colors[(int)(Math.random() * colors.length)];
  }
}

class Particle {
  double myX, myY, mySpeed, myAngle, mySize;
  color myColor;

  Particle() {
    myX = 250;
    myY = 250;
    myAngle = Math.random() * (2 * Math.PI);
    mySpeed = Math.random() * 2 + 0.5;
    mySize = 5;
    myColor = colors[(int)(Math.random() * colors.length)];
  }

  void walk() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if (mousePressed) {
      myX = mouseX;
      myY = mouseY;
      myAngle = Math.random() * (2 * Math.PI);
      mySpeed = Math.random() * 2;
      mySize=5;
    }
  }

  void show() {
    fill(myColor);
    ellipse((float) myX, (float) myY, (float) mySize, (float) mySize);
  }
}

Particle[] thing;
Oddball thing2;

void setup() {
  size(500, 500);
  thing = new Particle[1000];
  setColorTheme(); // Initialize the color theme
  for (int i = 0; i < thing.length; i++) {
    thing[i] = new Particle();
  }
  thing2 = new Oddball(); // Initialize the Oddball instance
}

void draw() {
  background(0);
  for (int i = 0; i < thing.length; i++) {
    thing[i].walk();
    thing[i].show();
  }
  thing2.walk();
  thing2.show();
}

void mousePressed() {
  setColorTheme(); // Change color theme on mouse press
  for (int i = 0; i < thing.length; i++) {
    thing[i].myColor = colors[(int)(Math.random() * colors.length)];
  }
  thing2.myColor = colors[(int)(Math.random() * colors.length)];
}

void setColorTheme() {
  colors = new color[3];
  colors[0] = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  colors[1] = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  colors[2] = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
}
