//This is the game class
//It is responsible for updating the game, for counting the amount of live surrounding cells, and updating the cells

class Game
{
  //This function updates the display
  void updateDisplay()
  {
    background(255);
    
    //This displays the menu and reset button on the top left corner of the screen
    pushMatrix();
    fill(0);
    rect(0, 0, width/20, height/20);
    fill(255);
    textSize(20);
    text("Menu", width/20/10, height/20/2);
    fill(0);
    rect(0, height/20, width/20, height/20);
    fill(255);
    text("Reset", width/20/10, (height/20) * 1.5);
    popMatrix();
    
    //This sets the rotation point to the center of the screen, and for the cells to show in the center of the screen
    translate(width/2, height/2, zoom);
    
    //This rotates the area that the cells show in to the rotation controlled by the user
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);
    
    //These for loops go through the cells and display them
    //The reason it starts as the cell count /-2 is because this allows them to show around the center of the screen
    for (int i = cellCount/(-2); i < cellCount/2; i++)
    {
      for (int j = cellCount/(-2); j < cellCount/2; j++)
      {
        for (int l = cellCount/(-2); l < cellCount/2; l++)
        {

          //This checks if the current cell in the loop is true and if it is it will display it
          if (cells[i + cellCount/2][j + cellCount/2][l + cellCount/2])
          {
            pushMatrix();
            
            //Sets the cell to display where it needs to be located on the screen
            translate(i * cellSize, j * cellSize, l * cellSize);

            //Fill the cell with the colour set at the start
            fill(coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][0], coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][1], coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][2]);

            //Display the cell with the size that was determined at the menu
            box(cellSize);

            popMatrix();
          }
        }
      }
    }
  }

  //This function counts the amount of live cells around each cell
  void countSurrounding()
  {
    //These are for keeping track if the cell is at the corner or one of the edges
    int x;
    int y;
    int z;
    
    //These loops loop through all of hte cells
    for (int i = 0; i < cellCount; i++)
    {
      
      //If i is zero it will set x to one which will modify the loop that checks the surrounding squares
      if (i == 0)x = 1;
      else x = 0;
      
      for (int j = 0; j < cellCount; j++)
      {
        
        //If j is zero it will set y to one which will modify the loop that checks the surrounding squares
        if (j == 0) y = 1;
        else y = 0;
        
        for (int k = 0; k < cellCount; k++)
        {
          
          //If k is zero it will set z to one which will modify the loop that checks the surrounding squares
          if (k == 0)z = 1;
          else z = 0;
          
          //This checks if the current cell is true. If it is it will add one to each of the 26 cells surrounding it for their surroundingCells (less than 26 if at an edge or a corner)
          if (cells[i][j][k] == true)
          {
            //These for loops loops through the cells surrounding the current one to add to their surroundingCells
            for (int l = -1 + x; l < 2 - i/(cellCount-1); l++)
            {
              for (int m = -1 + y; m < 2 - j/(cellCount-1); m++)
              {
                for (int n = -1 + z; n < 2 - k/(cellCount-1); n++)
                {
                  //This check makes sure that it does not add one to it's own surroundingCells variable
                  if (l == 0 && m == 0 && n == 0);
                  
                  else surroundingCells[i + l][j + m][k + n]++;
                }
              }
            }
          }
        }
      }
    }
  }

  //This function is responsible for updating the state of each cell depending on it's amount of live neighbours, it is called after the countSurrounding function
  void updateCells()
  {
    //These for loops cycle through each of the cells
    for (int i = 0; i < cellCount; i++)
    {
      for (int j = 0; j < cellCount; j++)
      {
        for (int k = 0; k < cellCount; k++)
        {
          //These if statements change the state of the cell depending on it's current state and the amount of live neighbours it has
          
          //This checks if the cell is under the minimum amount of live neighbours to live and it is true, if so it will set it to false
          if (surroundingCells[i][j][k] < rulesAliveMin[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;
          
          //This checks if the cell is over the maximum amount of live neighbours to live and it is true, if so it will set it to false
          else if (surroundingCells[i][j][k] > rulesAliveMax[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;

          //This checks if the cell is dead and has the right amount of live neighbours to be "born", if so it will set it to true
          else if (surroundingCells[i][j][k] == rulesBorn[whichRule] && cells[i][j][k] == false)cells[i][j][k] = true;

          //This resets the amount of surrounding cells for that cell because the countSurrounding would just keep adding to the current value
          surroundingCells[i][j][k] = 0;
        }
      }
    }
  }

  //This function is called when the begin button in the menu is pressed and it sets up everything that the game needs. It is also called by the reset button because this will reset the game as well
  void start()
  {
    //This initializes the arrays that hold the information for each cell
    cells = new boolean[cellCount][cellCount][cellCount];
    surroundingCells = new int[cellCount][cellCount][cellCount];
    coloursForCell = new int[cellCount][cellCount][cellCount][3];
    
    //These for loops are responsible for setting the colour randomly for each cell and deciding whether a cell will start as alive or dead
    for (int i = 0; i < cellCount; i++)
    {
      for (int j = 0; j < cellCount; j++)
      {
        for (int l = 0; l < cellCount; l++)
        {
          //This sets the cell the the boolean that rndm returns. It inputs the probability set by the slider in the menu
          cells[i][j][l] = rndm(probabilityAtStart);

          //This loop sets a random R, G, and B value for each cell
          for (int k = 0; k < 3; k++)
          {
            coloursForCell[i][j][l][k] = (int)random(0, 255);
          }
        }
      }
    }
    
    //This sets the framerate to the framerate selected at the menu
    frameRate(framesPerSecond);
    
    //This sets the showMenu boolean to false so that the game will displayed
    showMenu = false;
  }
}