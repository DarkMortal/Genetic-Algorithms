// For the sake of simplicity, we will just use rectangles

class Obstacle{
  PVector pos;
  float WIDTH;
  float HEIGHT;
  Obstacle(PVector p, float x, float y){
    this.pos = p; this.WIDTH = x; this.HEIGHT = y;
  }
  void disp(){
    fill(255);
    rect(this.pos.x, this.pos.y, WIDTH, HEIGHT);
  }
  boolean isCollided(Rocket r){
    return (r.pos.y > this.pos.y && r.pos.y < (this.pos.y + HEIGHT) && r.pos.x > this.pos.x && r.pos.x < (this.pos.x + WIDTH));
  }
};

Obstacle[] blocks = {
  new Obstacle(new PVector(55, 20), 50, 130),
  new Obstacle(new PVector(450, 20), 50, 130),
  new Obstacle(new PVector(160, 200), 230, 150)
};
