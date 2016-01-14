//MAKE AN ARRAY FOR THE AMOUNT SURROUNDING EACH THING



int surroundingCells[][][];
int cellCount = 20;
int cellSize = 5;
boolean cells[][][];
boolean cellsBuffer[][][];
float probabilityAtStart = .009;
int coloursForCell[][][][];
int zoom = cellCount * cellSize;
int xRotation;
int yRotation;
int zRotation;
String rules[];
boolean showMenu = true;
boolean ruleSet[];
int whichRule;
int rulesBorn[];
int rulesAliveMin[];
int rulesAliveMax[];
void setup()
{
 // size(500, 500, P3D);
  //frameRate(3);
  fullScreen(P3D);
  rules = new String[9];
  ruleSet = new boolean[9];
  rulesBorn = new int[9];
  rulesAliveMin = new int[9];
  rulesAliveMax = new int[9];
  
  rulesBorn[0] = 4;
  rulesBorn[1] = 4;
  rulesBorn[2] = 4;
  rulesBorn[3] = 4;
  rulesBorn[4] = 4;
  rulesBorn[5] = 4;
  rulesBorn[6] = 4;
  rulesBorn[7] = 3;
  rulesBorn[8] = 4;
  
  rulesAliveMin[0] = 3;
  rulesAliveMin[1] = 5;
  rulesAliveMin[2] = 4;
  rulesAliveMin[3] = 4;
  rulesAliveMin[4] = 6;
  rulesAliveMin[5] = 5;
  rulesAliveMin[6] = 6;
  rulesAliveMin[7] = 1;
  rulesAliveMin[8] = 26;
  
  rulesAliveMax[0] = 3;
  rulesAliveMax[1] = 5;
  rulesAliveMax[2] = 4;
  rulesAliveMax[3] = 5;
  rulesAliveMax[4] = 7;
  rulesAliveMax[5] = 6;
  rulesAliveMax[6] = 6;
  rulesAliveMax[7] = 1;
  rulesAliveMax[8] = 26;
  
  rules[0] = "B4A3";
  rules[1] = "B4A5";
  rules[2] = "B4A4";
  rules[3] = "B4A4A5";
  rules[4] = "B4A6A7";
  rules[5] = "B4A5A6";
  rules[6] = "B4A6";
  rules[7] = "B3A1";
  rules[8] = "B4A26";
  
  
  
  cellsBuffer = new boolean[cellCount][cellCount][cellCount];
  
  
  
  
}

void draw()
{
  if(showMenu)
  {
   displayMenu(); 
  }
  else
  {
  displayGame();
  countSurrounding();
  setSquares();
  }
    
  
  
  
}


int surroundingSquares(int cellX, int cellY, int cellZ, int edgeXZero, int edgeYZero, int edgeZZero, int edgeXEnd, int edgeYEnd, int edgeZEnd)
{
  int cellsSurrounding = 0;
 
  
  
  for(int i = -1 + edgeXZero; i < 2 - edgeXEnd; i++)
  {
   
   for(int j = -1 + edgeYZero; j < 2 - edgeYEnd; j++)
   {
     
    for(int l = -1 + edgeZZero; l < 2 - edgeZEnd; l++)
    {
      if(l == 0 && i == 0 && j == 0);
      else if(cellsBuffer[cellX + i][cellY + j][cellZ + l] == true)cellsSurrounding++;
    }
   }
  }
  
  return cellsSurrounding;
}


boolean rndm(float probability)
{
  if(random(0, 1) < probability)return true;
  else return false;
}

void mouseWheel(MouseEvent event)
{
  zoom += event.getCount();
}

void countSurrounding()
{
  int x;
  int y;
  int z;
 for(int i = 0; i < cellCount; i++)
 {
   
   if(i == 0)x = 1;
   else x = 0;
  for(int j = 0; j < cellCount; j++)
  {
    
    if(j == 0) y = 1;
    else y = 0;
   for(int k = 0; k < cellCount; k++)
   {
     
     if(k == 0)z = 1;
     else z = 0;
    if(cells[i][j][k] == true)
    {
     for(int l = -1 + x; l < 2 - i/(cellCount-1); l++)
     {
      for(int m = -1 + y; m < 2 - j/(cellCount-1); m++)
      {
       for(int n = -1 + z; n < 2 - k/(cellCount-1); n++)
       {
         if(l == 0 && m == 0 && n == 0);
         else surroundingCells[i + l][j + m][k + n]++; 
       }
      }
     }
    }
   }
  }
 }
}

void keyPressed()
{
  if(key == 'w')xRotation+=100;
  if(key == 's')xRotation-=100;
  if(key == 'a')yRotation-=100;
  if(key == 'd')yRotation+=100;
  if(key == 'q')zRotation+=100;
  if(key == 'e')zRotation-=100;
  println(1);
}


void displayMenu()
{
  stroke(0);
  background(0);
  fill(255);
  rect(width - width/8, 0, width/8, height);
  
  textSize(20);
  
  fill(155);
  rect(width - width/24, height/3, 20, 200);
  fill(255);
  rect(width - width/24 - 10, height/3 + 210, 50, 25);
  stroke(0);
  line(width - width/24 - 10, height/3 + 200 - cellCount, width - width/24 + 30, height/3 + 200 - cellCount);
  fill(0);
  text(cellCount, width - width/24, height/3 + 230);
  
  
  
  fill(155);
  rect(width - width/24 * 2, height/3, 20, 200);
  fill(255);
  rect(width - width/24 * 2 - 10, height/3 + 210, 50, 25);
  stroke(0);
  line(width - width/24 * 2 - 10, height/3 + 200 - cellSize * 10, width - width/24 * 2 + 30, height/3 + 200 - cellSize * 10);
  fill(0);
  text(cellSize, width - width/24 * 2, height/3 + 230);
  
  stroke(255);
  //strokeWeight(50);
  rect(0, 0, height, height);
  
  rect(height + 50, 50, width - (height + 50) - width/8 - 50, height/6);
  fill(255);
  textSize(75);
  text("Begin!", height + 50, 130);
  
  stroke(255);
  fill(0);
  textSize(50);
  for(int i = 0; i < 3; i++)
  {
   for(int j = 0; j < 3; j++)
   {
     if(ruleSet[3 * i + j])
     {
       fill(255);
       rect(j * (height/3), i * height/3, height/3, height/3);
       fill(0);
       text(rules[3 * i + j], j * height/3 + 50, i * height/3 + 150);
     }else
     {
      fill(0);
      rect(j * (height/3), i * height/3, height/3, height/3);
      fill(255);
      text(rules[3 * i + j], j * height/3 + 50, i * height/3 + 150);
     }
     
     
   }
  }
}

void displayGame()
{
  background(255);
  translate(width/2, height/2, 0);
  rotateX(xRotation);
  rotateY(yRotation);
  rotateZ(zRotation);
  for(int i = 0 - cellCount/2; i < cellCount/2; i++)
  {
   for(int j = 0 - cellCount/2; j < cellCount/2; j++)
   {
    for(int l = 0 - cellCount/2; l < cellCount/2; l++)
    {
   
     if(cells[i + cellCount/2][j + cellCount/2][l + cellCount/2] == true)
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


void setSquares()
{
   for(int i = 0; i < cellCount; i++)
     {
      for(int j = 0; j < cellCount; j++)
      {
       for(int k = 0; k < cellCount; k++)
       {
         if(surroundingCells[i][j][k] < rulesAliveMin[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;
         
         else if(surroundingCells[i][j][k] > rulesAliveMax[whichRule] && cells[i][j][k] == true)cells[i][j][k] = false;
         
         else if(surroundingCells[i][j][k] == rulesBorn[whichRule] && cells[i][j][k] == false)cells[i][j][k] = true;
         
         surroundingCells[i][j][k] = 0;
       }
      }
     }
}

void mouseDragged()
{
  if(mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > height/3 && mouseY < height - height/3 && showMenu)
  {
   cellCount = (int)map(mouseY, height/3 + 200, height/3, 0, 202);
   cellCount = constrain(cellCount, 20, 200);
  }else if(mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > height/3 && mouseY < height - height/3 && showMenu)
  {
   cellSize = (int)map(mouseY, height/3 + 200, height/3, 0, 21);
   cellSize = constrain(cellSize, 2, 20);
  }
}

void mousePressed()
{
  if(mouseX > width - width/24 && mouseX < width - width/24 + 20 && mouseY > height/3 && mouseY < height - height/3 && showMenu)
  {
   cellCount = (int)map(mouseY, height/3 + 200, height/3, 0, 202);
   cellCount = constrain(cellCount, 20, 201);
  }else if(mouseX > width - width/24 * 2 && mouseX < width - width/24 * 2 + 20 && mouseY > height/3 && mouseY < height - height/3 && showMenu)
  {
   cellSize = (int)map(mouseY, height/3 + 200, height/3, 0, 21);
   cellSize = constrain(cellSize, 2, 20);
  }else if(mouseX < height && mouseY < height)
  {
    ruleSet[whichRule] = false;
    whichRule = (int)map(mouseX, 0, height, 0, 3) + (int)map(mouseY, 0, height, 0, 3) * 3;
    ruleSet[whichRule] = true;
  }else if(mouseX > height + 50 && mouseX < height + 50 + width - (height + 50) - width/8 - 50 && mouseY > 50 && mouseY < 50 + height/6)
  {
   cells = new boolean[cellCount][cellCount][cellCount];
   surroundingCells = new int[cellCount][cellCount][cellCount];
   coloursForCell = new int[cellCount][cellCount][cellCount][3];
   for(int i = 0; i < cellCount; i++)
  {
   for(int j = 0; j < cellCount; j++)
   {
    for(int l = 0; l < cellCount; l++)
    {
     cells[i][j][l] = rndm(probabilityAtStart);
     
     for(int k = 0; k < 3; k++)
     {
      coloursForCell[i][j][l][k] = (int)random(0, 255);
     }
    }
   }
  }
   showMenu = false; 
  }
  
  
}