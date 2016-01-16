/* Created by Oliver Logush, February 16, 2016
Feel free to tweak and modify this code*/

Mouse mouse;//Creating a new instance of the mouse class which handles the mouse clicks
Game game;//Creating a new instance of the game class which handles displaying the game and checking and changing the cubes
Menu menu;//Creating a new instance of the menu class which handles displaying the menu

//This keeps track of how far zoomed in/out of the game you are
int zoom;

//These variables keep track of the rotation of the cube along each axis
float xRotation;
float yRotation;
float zRotation;

//This is set to what rule set the user selects at the start of the game (0 - 8)
int whichRule;

//This holds the dimensions of the area for the cells (area = cellCount^3)
int cellCount = 20;

//This holds the size (int pixels) of each cell
int cellSize = 5;

//This holds the fps for the game screen it is adjustable because at a lower framerate you can see the formations gradually evolve
int framesPerSecond = 2;

//This holds the probability of the cells being alive when the game starts
float probabilityAtStart = .009;

//This holds all of the rules so that they can be displayed in the menu screen
String rules[];

//This is what lets the program know whether to be on the menu screen or not
boolean showMenu = true;

//These arrays hold the rules for the program in numbers so that they can be fed to the if statements deciding what to do with the cells
int rulesBorn[];
int rulesAliveMin[];
int rulesAliveMax[];

//This holds the amount of alive cells surrounding each cell
int surroundingCells[][][];

//This holds the colours (R, G, B) for each cell
int coloursForCell[][][][];

//This holds which rule set is selected
boolean ruleSet[];

//This array holds the state of each cell
boolean cells[][][];

void setup()
{ 
  //Setting the game to fullscreen and enabling P3D for 3D graphics
  fullScreen(P3D);

  //Initializing all of the classes
  menu = new Menu();
  game = new Game();
  mouse = new Mouse();

  //Initializing the rule arrays for min, max, born, and the string to display the rules on the menu screen
  rules = new String[9];
  ruleSet = new boolean[9];
  rulesBorn = new int[9];
  rulesAliveMin = new int[9];
  rulesAliveMax = new int[9];

  //Setting each part of the rulesBorn array to what the rule is
  rulesBorn[0] = 4;
  rulesBorn[1] = 4;
  rulesBorn[2] = 4;
  rulesBorn[3] = 4;
  rulesBorn[4] = 4;
  rulesBorn[5] = 4;
  rulesBorn[6] = 4;
  rulesBorn[7] = 3;
  rulesBorn[8] = 4;

  //Setting each part of the rulesAliveMin array to what the rule is
  rulesAliveMin[0] = 3;
  rulesAliveMin[1] = 5;
  rulesAliveMin[2] = 4;
  rulesAliveMin[3] = 4;
  rulesAliveMin[4] = 6;
  rulesAliveMin[5] = 5;
  rulesAliveMin[6] = 6;
  rulesAliveMin[7] = 1;
  rulesAliveMin[8] = 26;

  //Setting each part of the rulesAliveMax array to what the rule is
  rulesAliveMax[0] = 3;
  rulesAliveMax[1] = 5;
  rulesAliveMax[2] = 4;
  rulesAliveMax[3] = 5;
  rulesAliveMax[4] = 7;
  rulesAliveMax[5] = 6;
  rulesAliveMax[6] = 6;
  rulesAliveMax[7] = 1;
  rulesAliveMax[8] = 26;

  //Setting each part of the rules array to what the rule is in a string to display in the menu
  rules[0] = "B4A3";
  rules[1] = "B4A5";
  rules[2] = "B4A4";
  rules[3] = "B4A4A5";
  rules[4] = "B4A6A7";
  rules[5] = "B4A5A6";
  rules[6] = "B4A6";
  rules[7] = "B3A1";
  rules[8] = "B4A26";
}

void draw()
{
  //If showMenu is true then go to the menu screen
  if (showMenu)
  {
    menu.update();
  } else
  {
    //if showMenu is not true it displays the game, counts the surrounding cells, and updates the state of the cells
    game.updateDisplay();
    game.countSurrounding();
    game.updateCells();
  }
}

//This function is used to randomly generate true or false cells based on the probability
boolean rndm(float probability)
{
  if (random(0, 1) < probability)return true;
  else return false;
}

//This adjusts the zoom when the mousewheel is scrolled
void mouseWheel(MouseEvent event)
{
  zoom += event.getCount();
}

//This function handles setting the rotation of the cube when different keys are pressed
void keyPressed()
{
  //These increment and decrement the rotation along the axis depending on what key is pressed
  if (key == 'w')xRotation+=.1;
  if (key == 's')xRotation-=.1;
  if (key == 'a')yRotation-=.1;
  if (key == 'd')yRotation+=.1;
  if (key == 'q')zRotation+=.1;
  if (key == 'e')zRotation-=.1;
}

//This is called when the mouse is dragged
void mouseDragged()
{
  //This checks if the menu is showing and calls the menu function in the mouse class
  if (showMenu)
  {
    mouse.menu();
  } else
  {
    //If the menu is not showing and the game is then call the game function in the game class
    mouse.game();
  }
}

//This is called when the mouse is dragged
void mousePressed()
{
  //This checks if the menu is showing and calls the menu function in the mouse class
  if (showMenu)
  {
    mouse.menu();
  } else
  {
    //If the menu is not showing and the game is then call the game function in the game class
    mouse.game();
  }
}