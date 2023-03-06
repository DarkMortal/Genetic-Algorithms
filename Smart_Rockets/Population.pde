class Population {
  Rocket[] population;
  PVector TARGET;
  int generations,  rocketsReached;
  float mutationRate, bestFitness, perfectScore;
  Population(PVector TARGETED, float mutation, int popMax){
    this.population = new Rocket[popMax]; // Array to hold the current population
    this.generations = 0; // Number of generations
    this.TARGET = TARGETED; // Target to reach 
    this.mutationRate = mutation; // Mutation rate
    this.rocketsReached = 0;
    
    // Generating initial population
    for (int i = 0; i < popMax; i++)
      this.population[i] = new Rocket(new DNA());
  }
  
  void calcFitnessAll(){
    float sum = 0.0;
    for(int i = 0; i < this.population.length; i++)
      sum += population[i].calcFitness(this.TARGET);
    for(int i = 0; i < this.population.length; i++)
      population[i].selectionChance = population[i].fitness/sum;
  }
  
  // Creating a new generation using natural selection
  void naturalSelection(){
    Rocket[] matingPool = new Rocket[this.population.length];
    for(int i = 0; i < this.population.length; i++){
      Rocket a = pickOne(this.population);
      Rocket b = pickOne(this.population);
      Rocket c = a.crossOver(b);
      c.mutate(this.mutationRate);
      matingPool[i] = c;
    } 
    for(int i = 0; i < this.population.length; i++) this.population[i] = matingPool[i];
    this.generations++;
  }
  
  void updateShow(){
    for(Rocket r: this.population){
      if(!r.isFinished){
        r.update();
        collisionHelper(r);
      } 
      r.show();
      r.evaluate(this.TARGET);
      if(r.hasReached) this.rocketsReached++;
    }
  }
  
};

Rocket pickOne(Rocket[] arr){
  int index = 0;
  float r = random(1);
  while(r>0 && index < arr.length){
    r -= arr[index].selectionChance;
    index++;
  } index--;
  if(index < 0) index += arr.length;
  return arr[index % arr.length];
}
