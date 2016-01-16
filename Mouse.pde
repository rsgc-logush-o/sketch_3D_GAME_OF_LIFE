class Mouse
{
  void menu()
  {
    if (mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > (height/3) * 2 && mouseY < (height/3) * 2 + 200)
    {
      cellCount = (int)map(mouseY, (height/3) * 2 + 200, (height/3) * 2, 0, 202);
      cellCount = constrain(cellCount, 20, 201);
    } else if (mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > (height/3) * 2 && mouseY < (height/3) * 2 + 200)
    {
      cellSize = (int)map(mouseY, (height/3) * 2 + 200, (height/3) * 2, 0, 21);
      cellSize = constrain(cellSize, 2, 20);
    } else if (mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > height/6 && mouseY < height/6 + 200)
    {
      framesPerSecond = (int)map(mouseY, height/6 + 200, height/6, 1, 61);
    } else if (mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > height/6 && mouseY < height/6 + 200)
    {
      probabilityAtStart = map(mouseY, height/6 + 200, height/6, 0.001, 1);
    } else if (mouseX < height && mouseY < height)
    {
      ruleSet[whichRule] = false;
      whichRule = (int)map(mouseX, 0, height, 0, 3) + (int)map(mouseY, 0, height, 0, 3) * 3;
      ruleSet[whichRule] = true;
    } else if (mouseX > height + 50 && mouseX < height + 50 + width - (height + 50) - width/8 - 50 && mouseY > 50 && mouseY < 50 + height/6)
    {
      game.start();
    }
  }

  void game()
  {
    if (mouseX > 0 && mouseX < width/20 && mouseY > 0 && mouseY < height/20)
    {
      frameRate(60);
      showMenu = true;
    } else if (mouseX > 0 && mouseX < width/20 && mouseY > height/20 && mouseY < height/10)
    {
      game.start();
    }
  }
}