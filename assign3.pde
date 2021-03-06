final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);
final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int groundhogX = 320, groundhogY = 80;
int Y=0, lifeY, distance, distanceY, distanceX;
int moveSpeed = 5, downSpeed = 5;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage life, title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil0, soil1, soil2, soil3, soil4, soil5, stone1, stone2;
PImage groundhogIdle, groundhogDown, groundhogLeft, groundhogRight;

boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean groundhogAppear = true;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;


void setup() {
  size(640, 480, P2D);
  // Enter your setup code here (please put loadImage() here or your game will lag like crazy)
  bg = loadImage("img/bg.jpg");
  life = loadImage("img/life.png");
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");

  playerHealth = 2;
  lifeY=10;

  distance = Y-80;
  distanceX = groundhogX;
  distanceY = groundhogY+80;
  groundhogY=80;
}

void draw() {


  /* ------ Debug Function ------ 
   
   Please DO NOT edit the code here.
   It's for reviewing other requirements when you fail to complete the camera moving requirement.
   
   */
  if (debugMode) {
    pushMatrix();
    translate(0, cameraOffsetY);
  }
  /* ------ End of Debug Function ------ */


  switch (gameState) {

  case GAME_START: // Start Screen
    image(title, 0, 0);
    Y = 0;
    
    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {

      image(startNormal, START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAME_RUN: // In-Game

    // Background
    image(bg, 0, 0);

    // Sun
    stroke(255, 255, 0);
    strokeWeight(5);
    fill(253, 184, 19);
    ellipse(590, 50, 120, 120);

    pushMatrix();
    translate(0, Y); 

    // Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

    // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    for (int i=0; i<8; i++) {
      for (int j=0; j<4; j++) {
        image(soil0, i*80, j*80+160);
        image(soil1, i*80, j*80+480);
        image(soil2, i*80, j*80+800);
        image(soil3, i*80, j*80+1120);
        image(soil4, i*80, j*80+1440);
        image(soil5, i*80, j*80+1760);
      }
    }
    for (int i=0; i<8; i++) {
      image(stone1, i*80, i*80+160);
    }  
    for (int i=0; i<8; i++) {
      for (int j=0; j<4; j+=2) {
        image(stone1, i*80-480+j*320, i*80+800);
        image(stone1, i*80-160+j*320, i*80+800);
        image(stone1, i*80-480+j*320, -i*80+1360);
        image(stone1, i*80-160+j*320, -i*80+1360);
      }
    }     
    for (int i=0; i<8; i++) {
      for (int j=0; j<10; j+=2) {
        image(stone1, i*80-480+j*120, -i*80+2000);
        image(stone1, i*80-400+j*120, -i*80+2000);
        image(stone2, i*80-400+j*120, -i*80+2000);
      }
    } 

    popMatrix();
    
    
    // Player
    if (groundhogAppear) {
      image(groundhogIdle, groundhogX, groundhogY);
    }

    // Health UI
    for (int i=0; i<playerHealth; i++) {
      image(life, 10+i*70, 10+lifeY);
    }
    if (playerHealth>5)playerHealth = 5;
    if (playerHealth<0)playerHealth = 0;

    //Pressed
    if (downPressed) {

      Y-=downSpeed;

      groundhogAppear = false;
      image(groundhogDown, groundhogX, groundhogY);

      if (Y<distance)distance=distance-80;

      if (Y<=-1600) {
        Y = -1600;
        downSpeed = 0;

        groundhogY+=moveSpeed;
        if (groundhogY>=distanceY)distanceY=distanceY+80;
        if (groundhogY+80>height)groundhogY=height-80;
      }
    }

    if (leftPressed) {
      groundhogAppear = false;
      image(groundhogLeft, groundhogX, groundhogY);

      groundhogX-=moveSpeed;
      if (groundhogX<=distanceX)distanceX=distanceX-80;
      if (groundhogX<0)groundhogX=0;
    }

    if (rightPressed) {
      groundhogAppear = false;
      image(groundhogRight, groundhogX, groundhogY);

      groundhogX+=moveSpeed;
      if (groundhogX>=distanceX)distanceX=distanceX+80;
      if (groundhogX+80>width)groundhogX=width-80;
    }
    if (groundhogX+80>width)groundhogX=width-80;
    if (groundhogX<0)groundhogX=0;
    
    break;

  case GAME_OVER: // Gameover Screen
    image(gameover, 0, 0);

    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
        // Remember to initialize the game here!
      }
    } else {

      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
    }
    break;
  } 



  // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
  if (debugMode) {
    popMatrix();
  }
}

void keyPressed() {
  // Add your moving input code here
  if (key == CODED) { // det[ect special keys       
    switch (keyCode) {
    case DOWN:
      if(!leftPressed && !rightPressed)downPressed = true;
      break;
    case LEFT:
      if(!downPressed && !rightPressed)leftPressed = true;
      break;
    case RIGHT:
      if(!downPressed && !leftPressed)rightPressed = true;
      break;
    }
  }

  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  switch(key) {
  case 'w':
    debugMode = true;
    cameraOffsetY += 25;
    break;

  case 's':
    debugMode = true;
    cameraOffsetY -= 25;
    break;

  case 'a':
    if (playerHealth > 0) playerHealth --;
    break;

  case 'd':
    if (playerHealth < 5) playerHealth ++;
    break;
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
    case DOWN:
      downPressed = false;
      groundhogAppear = true;
      Y=distance;
      if (Y<-1600) {
        Y = -1600;
        groundhogY = distanceY;
        if (groundhogY+80>height)groundhogY=height-80;
      }
      break;
    case LEFT:
      leftPressed = false;
      groundhogAppear = true;
      groundhogX=distanceX;
      break;
    case RIGHT:
      rightPressed = false;
      groundhogX=distanceX;
      groundhogAppear = true;
      break;
    }
  }
}
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		image(soil8x24, 0, 160);

		// Player

		// Health UI

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
