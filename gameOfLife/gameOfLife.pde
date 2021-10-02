boolean [][] game;
int [][]gameCount;
int size;
int rectSize;
void setup() {
  size(1000,1000);
  size=250;
  rectSize=1000/size;
  game = new boolean [size][size]; 
  for(int i=0;i<size;i++) {
    for (int j=0;j<size;j++) {
      if(random(1)>0.9)
        game[i][j]=true;
      else
        game[i][j]=false;
    }
  }
  gameCount = new int [size][size];
}
void draw() {
  background(255);
  fill(0);
  for(int i=0;i<size;i++) {
    //line(4*i,0,4*i,size*4);
    for(int j=0;j<size;j++) {
      //line(0,4*j,size*4,4*j);
      if(game[i][j])
        rect(rectSize*i,rectSize*j,rectSize,rectSize);
    }
  }
  for(int i=0;i<size;i++) {
    for(int j=0;j<size;j++) {
      int count=0;
      for(int k=max(i-1,0);k<=min(i+1,size-1);k++) {
        for (int l=max(j-1,0);l<=min(j+1,size-1);l++) {
          if(game[k][l] && (k!=i || l!=j))
            count++;
        }
      }
      gameCount[i][j]=count;
    }
  }
  for(int i=0;i<size;i++) {
    for(int j=0;j<size;j++) {
      if(gameCount[i][j]==3) {
        game[i][j]=true;
      }
      else if(gameCount[i][j]!=2) {
        game[i][j]=false;
      }
    }
  }
}
