int cellCount = 100;
int cellSize = 5;
boolean cells[][][];
boolean cellsBuffer[][][];
float probabilityAtStart = .006;
int coloursForCell[][][][];
int zoom = cellCount * cellSize;
void setup()
{
 // size(500, 500, P3D);
 frameRate(1);
  fullScreen(P3D);
  cells = new boolean[cellCount][cellCount][cellCount];
  cellsBuffer = new boolean[cellCount][cellCount][cellCount];
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
  
}

void draw()
{
  background(255);
  
  text(mouseX, 10, 10);
  text(mouseY, 10, 30);
  
  for(int i = 0; i < cellCount; i++)
  {
   for(int j = 0; j < cellCount; j++)
   {
    for(int l = 0; l < cellCount; l++)
    {
   
     if(cells[i][j][l] == true)
     {
     pushMatrix();
     fill(0);
    
     
     translate(i * cellSize + ((width/2) - ((cellCount * cellSize/2))), j * cellSize + ((height/2) - ((cellCount * cellSize)/2)), l * -1*cellSize - zoom);
     
      //translate(i * cellSize + 390, j * cellSize + 150, l * cellSize - 1000);
     
     fill(coloursForCell[i][j][l][0], coloursForCell[i][j][l][1], coloursForCell[i][j][l][2]);
     
     box(cellSize);
     
     popMatrix();
     }
      cellsBuffer[i][j][l] = cells[i][j][l]; 
    }
   }
  }
   
     int z;
  int x;
  int y;
  for(int i = 0; i < cellCount; i++)
  {
     if(i == 0)x = 1;
    else x = 0;
   for(int j = 0; j < cellCount; j++)
   {
     if(j == 0)y = 1;
     else y = 0;
    for(int l = 0; l < cellCount; l++)
    {
      
     //add the if statement after calling surrounding squares here 
     if(l == 0)z = 1;
      else z = 0;
     
     if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) < 2 && cellsBuffer[i][j][l] == true)cells[i][j][l] = false;
     
     else if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) > 7 && cellsBuffer[i][j][l] == true)cells[i][j][l] = false;
     
     else if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) == 5 && cellsBuffer[i][j][l] == false)cells[i][j][l] = true;
    }
   }
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