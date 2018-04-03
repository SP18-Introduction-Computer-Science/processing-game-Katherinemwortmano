class GameObject {
   Rectangle rectangle;
  int degreeCount = 0;
  int delta = 0;
  GameObject(int x, int y, int widthX, int heightY) {
     // Initialize object here 
     rectangle = new Rectangle(x,y,widthX,heightY);
  }
  
  void setSpeed(int xSpeed, int ySpeed) {
    rectangle.setSpeed(xSpeed, ySpeed);
  }
  
  void doDraw() {
     rectangle.doDraw();
  }
  
  
  
}