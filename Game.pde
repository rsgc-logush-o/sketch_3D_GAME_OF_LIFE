class Game
{
  void updateDisplay()
  {
    background(255);
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
    translate(width/2, height/2, zoom);
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);
    for (int i = 0 - cellCount/2; i < cellCount/2; i++)
    {
      for (int j = 0 - cellCount/2; j < cellCount/2; j++)
      {
        for (int l = 0 - cellCount/2; l < cellCount/2; l++)
        {

          if (cells[i + cellCount/2][j + cellCount/2][l + cellCount/2] == true)
          {
            pushMatrix();
            fill(0);


            // translate(i * cellSize + ((width/2) - ((cellCount * cellSize/2))), j * cellSize + ((height/2) - ((cellCount * cellSize)/2)), l * -1*cellSize - zoom);
            translate(i * cellSize, j * cellSize, l * cellSize);
            //translate(i * cellSize + 390, j * cellSize + 150, l * cellSize - 1000);

            fill(coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][0], coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][1], coloursForCell[i + cellCount/2][j + cellCount/2][l + cellCount/2][2]);

            box(cellSize);

            popMatrix();
          }
        }
      }
    }
  }

  void countSurrounding()
  {
    int x;
    int y;
    int z;
    for (int i = 0; i < cellCount; i++)
    {

      if (i == 0)x = 1;
      else x = 0;
      for (int j = 0; j < cellCount; j++)
      {

        if (j == 0) y = 1;
        else y = 0;
        for (int k = 0; k < cellCount; k++)
        {

          if (k == 0)z = 1;
          else z = 0;
          if (cells[i][j][k] == true)
          {
            for (int l = -1 + x; l < 2 - i/(cellCount-1); l++)
            {
              for (int m = -1 + y; m < 2 - j/(cellCount-1); m++)
              {
                for (int n = -1 + z; n < 2 - k/(cellCount-1); n++)
                {
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

  void updateCells()
  {
    for (int i = 0; i < cellCount; i++)
    {
      for (int j = 0; j < cellCount; j++)
      {
        for (int k = 0; k < cellCount; k++)
        {
          if (surroundingCells[i][j][k] < rulesAliveMin[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;

          else if (surroundingCells[i][j][k] > rulesAliveMax[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;

          else if (surroundingCells[i][j][k] == rulesBorn[whichRule] && cells[i][j][k] == false)cells[i][j][k] = true;

          surroundingCells[i][j][k] = 0;
        }
      }
    }
  }

  void start()
  {
    cells = new boolean[cellCount][cellCount][cellCount];
    surroundingCells = new int[cellCount][cellCount][cellCount];
    coloursForCell = new int[cellCount][cellCount][cellCount][3];
    for (int i = 0; i < cellCount; i++)
    {
      for (int j = 0; j < cellCount; j++)
      {
        for (int l = 0; l < cellCount; l++)
        {
          cells[i][j][l] = rndm(probabilityAtStart);

          for (int k = 0; k < 3; k++)
          {
            coloursForCell[i][j][l][k] = (int)random(0, 255);
          }
        }
      }
    }
    frameRate(framesPerSecond);
    showMenu = false;
  }
}