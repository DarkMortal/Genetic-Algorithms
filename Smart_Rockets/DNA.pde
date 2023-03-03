class DNA{
  PVector[] pArray;
  DNA(){
    pArray = new PVector[allowedMoves];
    for(int i=0; i<allowedMoves; i++) pArray[i] = PVector.random2D();
  }
  DNA(PVector[] p){ pArray = p; }
};

void collisionHelper(Rocket r){
  float x = r.pos.x;
  float y = r.pos.y;
  
  boolean b = (x >= 0 && x <= width);
  b = b && (y >= 0 && y <= height);
  b = b && (r.count < allowedMoves);
  
  boolean hasCollided = false;
  for(Obstacle ob: blocks){
    hasCollided = ob.isCollided(r);
    if(hasCollided) break;
  }
  
  r.hasCollided = hasCollided;
  r.isFinished = !b || hasCollided;
}
