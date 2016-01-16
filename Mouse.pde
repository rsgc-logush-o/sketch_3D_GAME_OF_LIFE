//This is the mouse class
//It is responsible for handling the mouse clicks in the menu and in the game

class Mouse
{
  //This is the menu function, it is called if the menu is enabled when the mouse is pressed/dragged
  void menu()
  {
    //This checks if the mouse is over the cellCount slider
    if (mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > (height/3) * 2 && mouseY < (height/3) * 2 + 200)
    {
      //This maps the cellCount value to the mouseY along the slider to 0, 202 and doesn't let it get less than 20 or more than 201
      cellCount = (int)map(mouseY, (height/3) * 2 + 200, (height/3) * 2, 0, 202);
      cellCount = constrain(cellCount, 20, 201);
    } 
    
    //This checks if the mouse is over the cellSize slider
    else if (mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > (height/3) * 2 && mouseY < (height/3) * 2 + 200)
    {
      //This maps the cellSize value to the mouseY along the slider to 0, 21 and doesn't let it get less than 2 or more than 20
      cellSize = (int)map(mouseY, (height/3) * 2 + 200, (height/3) * 2, 0, 21);
      cellSize = constrain(cellSize, 2, 20);
    } 
    
    //This checks if the mouse is over the FPS slider
    else if (mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > height/6 && mouseY < height/6 + 200)
    {
      //This maps the framesPerSecond value to the mouseY along the slider to 1, 61
      framesPerSecond = (int)map(mouseY, height/6 + 200, height/6, 1, 61);
    } 
    
    //This checks if the mouse is over the probability slider
    else if (mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > height/6 && mouseY < height/6 + 200)
    {
      //This maps the probabilityAtStart value to the mouseY along the slider to .001, 1
      probabilityAtStart = map(mouseY, height/6 + 200, height/6, 0.001, 1);
    } 
    
    //This checks if the mouse is over the area which the rules are selected in
    else if (mouseX < height && mouseY < height)
    {
      //Sets the currently selected rule false
      ruleSet[whichRule] = false;
      //Maps the mouseX and mouseY value to find out which square it was over
      whichRule = (int)map(mouseX, 0, height, 0, 3) + (int)map(mouseY, 0, height, 0, 3) * 3;
      ruleSet[whichRule] = true;
    } 
    
    //This checks if the mouse is over the begin button
    else if (mouseX > height + 50 && mouseX < height + 50 + width - (height + 50) - width/8 - 50 && mouseY > 50 && mouseY < 50 + height/6)
    {
      //Calls the start function in the game class to initialize the game
      game.start();
    }
  }

  //This is the game function it handles the mouse presses when the game screen is on
  void game()
  {
    //This checks if the mouse is over the menu button
    if (mouseX > 0 && mouseX < width/20 && mouseY > 0 && mouseY < height/20)
    {
      //Sets the framerate to 60 so that navigating the menu is not choppy
      frameRate(60);
      
      //Sets the showMenu to true so that the menu screen will show
      showMenu = true;
    } 
    
    //This checks if the mouse is over the reset button
    else if (mouseX > 0 && mouseX < width/20 && mouseY > height/20 && mouseY < height/10)
    {
      //Calls the start function in the game class to restart the game
      game.start();
    }
  }
}