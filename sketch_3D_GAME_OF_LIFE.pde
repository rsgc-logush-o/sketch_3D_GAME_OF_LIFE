int cellCount = 20;
boolean cells[][][];
float probabilityAtStart = .3;

void setup()
{
 // size(500, 500, P3D);
  fullScreen(P3D);
  cells = new boolean[cellCount][cellCount][cellCount];
  
  for(int i = 0; i < cellCount; i++)
  {
   for(int j = 0; j < cellCount; j++)
   {
    for(int l = 0; l < cellCount; l++)
    {
     cells[i][j][l] = rndm(probabilityAtStart);
    }
   }
  }
}

void draw()
{
  background(255);
  translate(640, 400, 0);
    noFill();
    stroke(100);
    
    box(400);
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
     
     if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) < 2 && cells[i][j][l] == true)cells[i][j][l] = false;
     
     else if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) > 3 && cells[i][j][l] == true)cells[i][j][l] = false;
     
     else if(surroundingSquares(i, j, l, x, y, z, i/(cellCount - 1), j/(cellCount - 1), l/(cellCount - 1)) == 3 && cells[i][j][l] == false)cells[i][j][l] = true;
    }
   }
  }
  
  for(int i = 0; i < cellCount/2; i++)
  {
   for(int j = 0; j < cellCount/2; j++)
   {
    for(int l = 0; l < cellCount/2; l++)
    {
      pushMatrix();
     if(cells[i][j][l] == true)fill(0);
     else fill(255);
     
     translate(i * 25, j * 25, l * 25);
     
     box(25);
     
     popMatrix();
     
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
      
      if(cells[cellX + i][cellY + j][cellZ + l] == true)cellsSurrounding++;
    }
   }
  }
  
  return cellsSurrounding;
}


boolean rndm(float probability)
{
  if(random(1) < probability)return true;
  else return false;
}