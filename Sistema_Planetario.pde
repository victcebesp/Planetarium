import peasy.*;

CelestialBody sun;
PeasyCam cam;
PImage sunTexture;
PShape destructor;
PImage[] textures;
float xDestructorCoordinate;
float yDestructorCoordinate;
float zDestructorCoordinate;

void setup() {
  size(600, 600, P3D);
  sunTexture = loadImage("data/sun.jpg");
  destructor = loadShape("data/star_destroyer.obj");
  textures = new PImage[7];
  textures[0] = loadImage("data/earth.jpg");
  textures[1] = loadImage("data/venus.jpg");
  textures[2] = loadImage("data/mars.jpg");
  textures[3] = loadImage("data/jupiter.jpg");
  textures[4] = loadImage("data/uranus.jpg");
  textures[5] = loadImage("data/moon.jpg");
  cam = new PeasyCam(this, 500);
  sun = new CelestialBody(50, 0, 0, sunTexture, "Sun");
  sun.spawnMoons();
  xDestructorCoordinate = 1000;
  yDestructorCoordinate = 0;
  zDestructorCoordinate = 0;
}

void draw() {
  background(0);
  lights();
  sun.show();
  sun.orbit();
  showDestructor();
  showInstructions();
}

void showDestructor() {
  pushMatrix();
  scale(0.17);
  rotateX(PI);
  updateDestructorCoordinates();
  rotateY(zDestructorCoordinate);
  translate(xDestructorCoordinate, yDestructorCoordinate, 0);
  shape(destructor);
  popMatrix();
}

void updateDestructorCoordinates() {
  if (keyPressed) {
    if (key == 'w') {
      xDestructorCoordinate += 10;
    } else if (key == 's') {
      xDestructorCoordinate -= 10;
    } else if (key == 'd') {
      zDestructorCoordinate += 0.05;
    } else if (key == 'a') {
      zDestructorCoordinate -= 0.05;
    } else if (key == ' ') {
      yDestructorCoordinate += 10;
    } else if (key == 'x') {
      yDestructorCoordinate -= 10;
    }
  }
}

void showInstructions() {
  text("You can move the camera with the mouse", -100, 100, 0);
  text("You can zoom in/out with the mouse wheel", -100, 120, 0);
  text("To move forward/backward press w/s", -100, 140, 0);
  text("To move up/down press SPACE/x", -100, 160, 0);
  text("To move right/left press d/a", -100, 180, 0);
}
