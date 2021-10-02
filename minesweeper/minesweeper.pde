int w=400;
int h=400;
int scl=20;
boolean lost;
Cell [][] board;
boolean generated;
int revealed;
void settings()
{
  size(w,h);
}
void setup()
{
  revealed=0;
  lost=false;
  board= new Cell [h/scl][w/scl];
  for(int y=0;y<h/scl;y++)
  {
    for(int x=0;x<w/scl;x++)
    {
      board [y][x]= new Cell(x*scl,y*scl,scl,scl);
    }
  }
}
void draw()
{
  if(revealed==((w*h/scl)/scl)-150)
  {
    println("won");
    noLoop();
  }
  else
  {
    if(lost)
    {
      noLoop();
      println("lost");
    }
    background(255);
    for(int y=0;y<h/scl;y++)
    {
      for(int x=0;x<w/scl;x++)
      {
        board [y][x].draw();
      }
    }
  }
}

void mousePressed()
{
  if(mouseButton==RIGHT)
  {
    board[floor(mouseY/float(scl))][floor(mouseX/float(scl))].flag();
  }
  if(mouseButton==LEFT)
  {
    int y=floor(mouseY/float(scl));
    int x=floor(mouseX/float(scl));
    if(!generated)
      generate(x,y);
    if(!board[y][x].revealed)
      revealed++;
    lost=board[y][x].reveal();
  }
}

 void generate(int x, int y)
  {
    generated=true;
    int count=100;
    while(count>0)
    {
      int newX=int(random(0,w/scl));
      int newY=int(random(0,w/scl));
      if(abs(x-newX)>1 && abs(y-newY)>1 && !board[newY][newX].bomb)
      {
        count--;
        board[newY][newX].bomb=true;
        for(int i=-1;i<2;i++)
        {
          for(int j=-1;j<2;j++)
          {
            if(j!=0 || i!=0)
            {
              if(newY+j>=0 && newY+j<w/scl && newX+i>=0 && newX+i < h/scl)
                board[newY+j][newX+i].bombNeighbours++;
            }
          }
        }
      }
    }
  }
