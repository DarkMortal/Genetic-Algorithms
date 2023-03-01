final String target = "Har har Mahadev";

Population genePool;

void setup(){
  size(600,650);
  surface.setTitle(target);
  genePool = new Population(target,0.011,700);
  genePool.calcFitnessAll();
  genePool.evaluate();
}

void draw(){
  clear();
  background(0);
  textSize(15);
  text("Best Match : ",50,75);
  text("All phrases : ",300,75);
  textSize(20);
  text(genePool.bestPhrase,50,100);
  text("Generations : "+genePool.generations,50,130);
  text("Fitness : "+genePool.bestFitness,50,160);
  text("Mutation : "+genePool.mutationRate*100+" %",50,190);
  text("Population size : "+genePool.population.length,50,220);
  for(int i=0; i < genePool.population.length; i++)
    text(genePool.population[i].str, 300, 75+(i+1)*30);
  if(!genePool.isFinished){
    genePool.naturalSelection();
    genePool.calcFitnessAll();
    genePool.evaluate();
  }
}
