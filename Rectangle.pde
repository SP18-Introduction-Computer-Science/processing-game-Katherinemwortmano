class Rectangle {
    int xPos1;  // Uper Left corner 
    int yPos1;
    int yPos2;   // Lower right corner
    int xPos2;
    int xIncrement;
    int yIncrement;
    int radianCount;
    int currentDeg;  // Holds the current degree of the object
    boolean applyRotate;
    int delta;
    boolean atEnd;
    
    
    // Constructor function -- instantiates an object of that class type
    Rectangle(int x, int y, int width, int height) {
      
      // Upper left of the rectangle
      xPos1 = x;
      yPos1 = y;
      
      
      xPos2 = x + width;
      yPos2 = y + height;
      
      radianCount = 0;
      currentDeg = 0;
      
      // This defines the speed of our object
      xIncrement = 1;
      yIncrement = 1;
      
      delta = 0;
      radianCount = 0;
      applyRotate = true;
      atEnd = false;
    }   
    
    
    void setSpeed(int xPos, int yPos) {
       xIncrement = xPos; 
       yIncrement = yPos;
    }
  
    void doDraw() {
        findBound();
        if (atEnd == false ) {
           xPos1 = xIncrement + xPos1;
           xPos2 = xIncrement + xPos2;
           yPos1 = yIncrement + yPos1;
           yPos2 = yIncrement + yPos2;
        } else {
           xPos1 = xIncrement - xPos1;
           xPos2 = xIncrement - xPos2;
           yPos1 = yIncrement - yPos1;
           yPos2 = yIncrement - yPos2;
          
        }
        rectMode(CORNERS); 
        rect(xPos1, yPos1, xPos2, yPos2);
        
        /*
        if (applyRotate == true) {
           applyRotation(); 
        }*/
    }
    
    // This property of the rectangle bounces off the edges of the window
    void findBound() {
      if (xPos2 > 720 || yPos2 > 450) {
       atEnd = true; // switch direction, go up to the left
       return;
      }
  
     if ( xPos1 < 0 || yPos1 < 0 ) {
       atEnd = false;  // switch directions to down to the right
       return;
     }
  
    }
    
    
    void applyRotation() {
       int centerX = (xPos1 + xPos2) / 2;
       int centerY = ( yPos1 + yPos2) / 2;
       delta = radianCount % 360;
       radianCount += 1;
       pushMatrix();
       translate(centerX,centerY);  // Move to the world coordinate
       rotate(radians(delta));
       translate(-centerX,-centerY);  // Move back to its original local coord
       rect(xPos1, yPos1, xPos2, yPos2);
       popMatrix(); 
    }
  
  
}