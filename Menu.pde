class Menu
{
  void update()
  {
    stroke(0);
    background(0);
    fill(255);
    rect(width - width/8, 0, width/8, height);

    textSize(20);

    fill(155);
    rect(width - width/24, height/6, 20, 200);
    fill(255);
    rect(width - width/24 - 10, height/6 + 210, 50, 25);
    stroke(0);
    line(width - width/24 - 10, height/6 + 200 - framesPerSecond * 3.3, width - width/24 + 30, height/6 + 200 - framesPerSecond * 3.3);
    fill(0);
    text(framesPerSecond, width - width/24, height/6 + 230);

    fill(155);
    rect(width - width/24 * 2, height/6, 20, 200);
    fill(255);
    rect(width - width/20 * 2 - 10, height/6 + 210, 75, 25);
    stroke(0);
    line(width - width/24 * 2 - 10, height/6 + 200 - probabilityAtStart * 200, width - width/24 * 2 + 30, height/6 + 200 - probabilityAtStart * 200);
    fill(0);
    text(probabilityAtStart, width - width/20 * 2, height/6 + 230);

    fill(155);
    rect(width - width/24, height/2, 20, 200);
    fill(255);
    rect(width - width/24 - 10, height/2 + 210, 50, 25);
    stroke(0);
    line(width - width/24 - 10, height/2 + 200 - cellCount, width - width/24 + 30, height/2 + 200 - cellCount);
    fill(0);
    text(cellCount, width - width/24, height/2 + 230);



    fill(155);
    rect(width - width/24 * 2, height/2, 20, 200);
    fill(255);
    rect(width - width/24 * 2 - 10, height/2 + 210, 50, 25);
    stroke(0);
    line(width - width/24 * 2 - 10, height/2 + 200 - cellSize * 10, width - width/24 * 2 + 30, height/2 + 200 - cellSize * 10);
    fill(0);
    text(cellSize, width - width/24 * 2, height/2 + 230);

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
    for (int i = 0; i < 3; i++)
    {
      for (int j = 0; j < 3; j++)
      {
        if (ruleSet[3 * i + j])
        {
          fill(255);
          rect(j * (height/3), i * height/3, height/3, height/3);
          fill(0);
          text(rules[3 * i + j], j * height/3 + 50, i * height/3 + 150);
        } else
        {
          fill(0);
          rect(j * (height/3), i * height/3, height/3, height/3);
          fill(255);
          text(rules[3 * i + j], j * height/3 + 50, i * height/3 + 150);
        }
      }
    }
  }
}