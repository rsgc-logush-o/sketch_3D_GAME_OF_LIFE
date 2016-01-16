//This is the menu class
//It is responsible for displaying the menu

class Menu
{
  //This updates the display of the menu
  void update()
  {
    stroke(0);
    background(0);
    
    //This draws the rectangle on the right which has all of the menu sliders
    fill(255);
    rect(width - width/8, 0, width/8, height);

    //This displays the FPS slider along with the text that displays it's value, the text box, and it's label
    textSize(20);
    fill(155);
    rect(width - width/24, height/6, 20, 200);
    fill(255);
    rect(width - width/24 - 10, height/6 + 210, 50, 25);
    stroke(0);
    line(width - width/24 - 10, height/6 + 200 - framesPerSecond * 3.3, width - width/24 + 30, height/6 + 200 - framesPerSecond * 3.3);
    fill(0);
    text(framesPerSecond, width - width/24, height/6 + 230);
    textSize(25);
    text("FPS", width - width/20, height/7);

    //This displays the probability slider along with the text that displays it's value, the text box, and it's label
    textSize(20);
    fill(155);
    rect(width - width/24 * 2, height/6, 20, 200);
    fill(255);
    rect(width - width/20 * 2 - 10, height/6 + 210, 75, 25);
    stroke(0);
    line(width - width/24 * 2 - 10, height/6 + 200 - probabilityAtStart * 200, width - width/24 * 2 + 30, height/6 + 200 - probabilityAtStart * 200);
    fill(0);
    text(probabilityAtStart, width - width/20 * 2, height/6 + 230);
    textSize(25);
    text("%", width - width/12, height/7);

    //This displays the cellCount slider along with the text that displays it's value, the text box, and it's label
    textSize(20);
    fill(155);
    rect(width - width/24, (height/3) * 2, 20, 200);
    fill(255);
    rect(width - width/24 - 10, (height/3) * 2 + 210, 50, 25);
    stroke(0);
    line(width - width/24 - 10, (height/3) * 2 + 200 - cellCount, width - width/24 + 30, (height/3) * 2 + 200 - cellCount);
    fill(0);
    text(cellCount, width - width/24, (height/3) * 2 + 230);
    textSize(25);
    text("#", width - width/22, (height/3) * 1.8);
    text("of", width - width/22, (height/3) * 1.87);
    text("Cells", width - width/20, (height/3) * 1.97);

    //This displays the cellSize slider along with the text that displays it's value, the text box, and it's label
    textSize(20);
    fill(155);
    rect(width - width/24 * 2, (height/3) * 2, 20, 200);
    fill(255);
    rect(width - width/24 * 2 - 10, (height/3) * 2 + 210, 50, 25);
    stroke(0);
    line(width - width/24 * 2 - 10, (height/3) * 2 + 200 - cellSize * 10, width - width/24 * 2 + 30,(height/3) * 2 + 200 - cellSize * 10);
    fill(0);
    text(cellSize, width - width/24 * 2, (height/3) * 2 + 230);
    textSize(25);
    text("Cell", width - width/10, (height/3) * 1.87);
    text("Size", width - width/10, (height/3) * 1.97);

    //This is the rectangle and text for the begin button
    stroke(255);
    rect(height + height/21.6, height/21.6, width/4, height/6);
    fill(255);
    textSize(width*height/16588.8);
    text("Begin!", height + height/21.6 * 2, height/8.3 + height/21.6);

    //This sets the text size for the strings displaying the different rules
    textSize(width * height / 27648);
    
    //These loops display the rule selection buttons and the text in them to say what the rule is
    for (int i = 0; i < 3; i++)
    {
      for (int j = 0; j < 3; j++)
      {
        //This checks if this is the rule that is selected and if so then it will display the square as white and the text as black
        if (ruleSet[3 * i + j])
        {
          //Draws the box for the button and the text saying the rule in the box
          fill(255);
          rect(j * (height/3), i * height/3, height/3, height/3);
          fill(0);
          text(rules[3 * i + j], j * height/3 + height/6 - rules[3 * i + j].length() * (width * height / 27648)/3, i * height/3 + height/5.4);
        } else
        {
          //If this is the rule that is not selected than it sets the box to black and the text to white
          fill(0);
          rect(j * (height/3), i * height/3, height/3, height/3);
          fill(255);
          text(rules[3 * i + j],j * height/3 + height/6 - rules[3 * i + j].length() * (width * height / 27648)/3, i * height/3 + height/5.4);
        }
      }
    }
  }
}