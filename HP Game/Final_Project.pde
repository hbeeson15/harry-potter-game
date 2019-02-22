/*
  *Holly Morrison
  *This is a Harry Potter game. The objective is 
  to collect as many of the golden snitches as you can, 
  while letting as few as possible get past you.
  Move the mouse around to catch the snitches. 
*/

int[] x;
int[] y;
int number = 5;
int score;
int lives;
boolean gameOver; 
int speed;
PImage harry;
PImage snitch;
PImage field;

void setup()
{
  size(800, 800);
  x = new int[12];
  y = new int[12];
  score = 0;
  lives = 5; 
  gameOver = false;
  speed = 7;
  harry = loadImage("harry potter.png");
  harry.resize(120, 150);
  imageMode(CENTER);
  snitch = loadImage("snitch.png");
  snitch.resize(90, 80);
  field = loadImage("quidditch.jpg");
  field.resize(800, 800);

  for (int i = 0; i < number; i++)
  {
    x[i] = (int)random(15, 800);
    y[i] = (int)random(-2000, -10);
  }
}

void draw()
{
  if (gameOver == false)
  {
    image(field, 400, 400);    

    image(harry, mouseX, mouseY);

    fill(0, 50, 250);
    move();
    
    for (int i = 0; i < number; i++)
    {
      if (x[i] > mouseX-60 && x[i] < (mouseX+60) && y[i] > mouseY-75 && y[i] < mouseY+75)
      {
        x[i] = (int)random(15, 800);
        y[i] = (int)random(-2000, -10);
        score++;
      }
    }
  }

  textSize(30);
  fill(0);
  text("Score: " + score, 50, 50);
  text("Lives: " + lives, 50, 100);

  if (lives == 0)
  {
    gameOver = true;
    background(200);
    textSize(50);
    fill(255, 0, 0);
    text("GAME OVER", 280, 400);
  }
  
  if(score == 20)
  {
    number = 8;
    speed = 8;
  }
  if(score == 40)
  {
    number = 12;
    speed = 8;
  }
  if(score == 60)
  {
    gameOver = true;
    background(0);
    fill(255, 0, 0);
    text("YOU WIN!", 300, 400);
  }
}

void move()
{
  for (int i = 0; i < number; i++)
  {
    if (y[i] > 800)
    {
      y[i] = (int)random(-1000, -10);
      lives--;
    }
    image(snitch, x[i], y[i]);
    y[i] += speed;
  }
}