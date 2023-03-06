float[] rangeX = {-1,1};
float[] rangeY = {-1,1};

class Point{
  float x,y;
  int label;
  
  Point(float a,float b){
    this.x = a;
    this.y = b;
    if(this.y >= l1.f(this.x)) this.label = -1;
    else this.label = 1;
  }
  
  // mapping from coordinate-space to pixel-space
  float getX(){ return map(this.x, rangeX[0], rangeX[1], 0, width); }
  float getY(){ return map(this.y, rangeY[0], rangeY[1], height, 0); }
  
  void draw(){
    strokeWeight(3);
    if(label == 1){
      stroke(255);
      fill(0);
    }else{
      stroke(0);
      fill(255);
    }
    circle(this.getX(), this.getY(), 25);
  }
  
};
