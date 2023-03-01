class Population {
  DNA[] population, matingPool;
  int generations, perfectScore;
  float mutationRate, bestFitness;
  String bestPhrase, target;
  boolean isFinished;
  Population(String targetString, float mutation, int popMax){
    this.population = new DNA[popMax]; // Array to hold the current population
    // this.matingPool = new DNA[popMax]; // ArrayList which we will use for our "mating pool"
    this.generations = 0; // Number of generations
    this.isFinished = false; // Are we finished evolving?
    this.target = targetString; // Target phrase
    this.mutationRate = mutation; // Mutation rate
    this.perfectScore = this.target.length();
    this.bestPhrase = "";
    this.bestFitness = 0.0;
    
    // Generating initial population
    for (int i = 0; i < popMax; i++) {
      this.population[i] = new DNA(this.perfectScore);
    } calcFitnessAll();
  }
  
  void calcFitnessAll(){
    float sum = 0.0;
    for(int i = 0; i < this.population.length; i++){
      sum += population[i].calcFitness(this.target);
    }
    for(int i = 0; i < this.population.length; i++)
      population[i].selectionChance = population[i].fitness/sum;
  }
  
  // Creating a new generation using natural selection
  void naturalSelection(){
    DNA[] matingPool = new DNA[this.population.length];
    for(int i = 0; i < this.population.length; i++){
      DNA a = pickOne(this.population);
      DNA b = pickOne(this.population);
      DNA c = a.crossOver(b);
      c.mutate(this.mutationRate);
      matingPool[i] = c;
    } 
    for(int i = 0; i < this.population.length; i++) this.population[i] = matingPool[i];
    this.generations++;
  }
  
  void evaluate(){
    int bestFitness = 0;
    int index = 0;
    for(int i = 0; i < this.population.length; i++){
      if(bestFitness < this.population[i].fitness){
        index = i;
        bestFitness = this.population[i].fitness;
      }
    }
    this.bestFitness = float(bestFitness)/float(perfectScore) * 100.0;
    this.bestPhrase = this.population[index].str;
    this.isFinished = (bestFitness == this.perfectScore);
  }
  
};

DNA pickOne(DNA[] arr){
  int index = 0;
  float r = random(1);
  while(r>0 && index < arr.length){
    r -= arr[index].selectionChance;
    index++;
  } index--;
  if(index < 0) index += arr.length;
  return arr[index % arr.length];
}
