class Rocket{
  PVector pos, vel, acc;
  color c;
  int count;
  DNA dna;
  boolean isFinished, hasCollided, hasReached;
  float fitness, selectionChance;
  Rocket(DNA d){
    this.count = 0;
    this.fitness = 0.0;
    this.isFinished = false;
    this.hasReached = false;
    this.selectionChance = 0.0;
    this.pos = new PVector(width/2, height);
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.c = color(floor(random(255)), floor(random(255)), floor(random(255)));
    this.dna = d;
    this.vel.y = abs(this.vel.y);
  }
  void update(){
    acc = this.dna.pArray[this.count % allowedMoves];
    this.vel.add(acc);
    this.pos.add(vel);
    this.count++;
  }
  void show(){
    push();
    if(isFinished) fill(255,0,0, 120);
    else fill(this.c, 120);
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    rectMode(CENTER);
    circle(0, 0, 10);
    ellipse(-28, 0, 50, 10);
    pop();
  } // NOTE: this.vel.heading() = atan(this.vel.y / this.vel.x)
  
  // Fitness function
  float calcFitness(PVector TARGET){
    float d = dist(TARGET.x, TARGET.y, this.pos.x, this.pos.y);
    this.fitness = 1.0/d;
    return this.fitness;
  }
  
  // Crossover
  Rocket crossOver(Rocket r){
    PVector[] dnaTemp = new PVector[allowedMoves];
    int mid = allowedMoves >> 1;
    for(int i = 0; i < allowedMoves; i++){
      if(i<=mid){
        if(this.fitness >= r.fitness) dnaTemp[i] = this.dna.pArray[i];
        else dnaTemp[i] = r.dna.pArray[i];
      }
      else{
        if(this.fitness <= r.fitness) dnaTemp[i] = this.dna.pArray[i];
        else dnaTemp[i] = r.dna.pArray[i];
      }
    }
    return new Rocket(new DNA(dnaTemp));
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float mutationRate){
    for(int i = 0; i < allowedMoves; i++)
      if(random(1) < mutationRate)
        this.dna.pArray[i] = PVector.random2D();
  }
  
  // Function to evaluate current generation
  void evaluate(PVector TARGET){
    this.hasReached = dist(this.pos.x, this.pos.y, TARGET.x, TARGET.y) <= 20.0;
    if(this.hasCollided)
      this.fitness = 1.0;
    if(this.hasReached)
      this.fitness *= 100.0;
  }
}
