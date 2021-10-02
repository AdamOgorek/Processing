class Cell 
{
  int x; 
  int y; 
  int w; 
  int h;
  boolean bomb;
  int bombNeighbours;
  boolean flagged;
  boolean revealed;
  Cell(int x, int y, int w, int h)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    bomb=false;
    bombNeighbours=0;
    flagged=false;
    revealed=false;
  }
  void draw()
  {
    fill(255);
    stroke(0);
    strokeWeight(1);
    if(revealed && bombNeighbours==0)
      strokeWeight(2);
    rect(x,y,w,h);
    if(!revealed && flagged)
    {
      fill(255,0,0);
      triangle(x,y,x+w,y,x+w/2,y+h);
    }
    else if(revealed)
    {
      if(bomb)
      {
        fill(0);
        ellipse(x+w/2,y+h/2,w/2,h/2);
      }
      else
      {
        if(bombNeighbours!=0)
        {
          fill(0);
          textAlign(CENTER);
          text(bombNeighbours,x+w/2,y+h/w+15);
        }
      }
    }
  }
  
  boolean reveal()
  {
    if(!flagged && !revealed)
    {
      revealed=true;
      if(!bomb && bombNeighbours==0)
      {
        println("revealing");
        for(int i=-1;i<2;i++)
        {
          for(int j=-1;j<2;j++)
          {
              if(y/scl+j>=0 && y/scl+j<board.length && x/scl+i>=0 && x/scl+i <board[y/scl+j].length)
              {
                board[y/scl+j][x/scl+i].reveal();
              }
          }
        }
      }
      return bomb;
    }
    return false;
  }
  
  void flag()
  {
    flagged^=true;
  }
}
