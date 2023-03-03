PVector target;
final int allowedMoves = 400;
Population genePool;

void setup(){
  size(550,550);
  surface.setTitle("Smart Rockets");
  target = new PVector(width/2, 85);
  genePool = new Population(target,0.021,40);
}

void draw(){
  clear();
  background(0);
  fill(0,255,0);
  ellipse(target.x, target.y, 20,20);
  
  // drawing evaluation
  for(Obstacle ob: blocks) ob.disp();
  textSize(20);
  fill(0);
  text("Generation : "+(genePool.generations+1), 170,225);
  text("Mutation Rate : "+(genePool.mutationRate*100)+" %", 170,250);
  text("Population Size : "+genePool.population.length, 170,275);
  textSize(18);
  text("Rockets reaching target : "+genePool.rocketsReached, 170,300);
  
  // the cycle keeps on repeating
  boolean isGenerationCompleted = false;
  for(Rocket r: genePool.population){
     isGenerationCompleted = r.isFinished;
     if(!isGenerationCompleted) break;
  }
  if(!isGenerationCompleted) genePool.updateShow();
  else{
    genePool.calcFitnessAll();
    genePool.naturalSelection();
    genePool.rocketsReached = 0;
  }
}
