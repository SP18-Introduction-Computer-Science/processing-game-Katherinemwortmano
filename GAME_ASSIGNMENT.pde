int xPos;                      
int speed=1;                 
int xDir=1; 
int score=0;                  
int lives=16;                  
boolean lost=false;            


ArrayList<GameObject> objectList;


void setup()  {
  size (400,400);
  smooth();
  xPos=200;               
  fill(0,250,500);               
  textSize(12);    
    
     objectList = new ArrayList<GameObject>();
        for (int i = 0; i < 10; i++ ) {
            int yInit = 0;
    int xInit = (int) random(700);
    int xWidth = 7 + (int) random(6);
    int yWidth = 7 + (int) random(6);
    
    GameObject gameObject = new GameObject(xInit,yInit,xWidth,yWidth);
    
    int xSpeed = (int) random(2);
    int ySpeed = (int) random(2);
    gameObject.setSpeed(xSpeed,ySpeed);
    
    objectList.add(gameObject);
        }
}
  


void draw()  {                         

  background (0);                                
  rectMode(CENTER);
    {rect(xPos,height/2,25,80);
    ellipse(xPos,height/3,60,60);
    ellipse(xPos-15,height/3,16,32);
    ellipse(xPos+15,height/3,16,32);  
    }
  xPos=xPos+(speed*xDir);                        
  if (xPos > width-20 || xPos<20)               
  {
    xDir=-xDir;                                  
  }
  text("score = "+score,10,10);                  
  text("lives = "+lives,width-80,10);            
  if (lives<=0)                                 
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    
    lost=true;
    textSize(13);
  }
  
  for ( int i = 0; i < objectList.size(); i++) {
     
      GameObject gameObject = objectList.get(i);
      
      gameObject.doDraw();
  }
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      
  {
    score=score+speed;                           
    speed=speed+1;                               
  }
  else                                           
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                               
  }
  if (lost==true)                                 
  {
    speed=1;                                     
    lives=15;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                     
  }
  
}