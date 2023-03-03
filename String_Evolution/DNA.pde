char newChar(){
  int r = floor(random(64,122));
  if(r == 64) r = 32;
  return char(r);
}

class DNA{
  String str;
  int fitness;
  float selectionChance;
  DNA(int n){
    str = "";
    for(int i=0;i<n;i++){
      this.str += newChar();
    }
    fitness = 0;
    selectionChance = 0.0;
  }
  DNA(String s){ str = s; }
  
  // Fitness function
  int calcFitness(String targetString){
    int score = 0;
    for(int i = 0; i < this.str.length(); i++){
      if(targetString.charAt(i) == this.str.charAt(i)) score++;
    } 
    this.fitness = score;
    return score;
  }
  
  // Crossover
  DNA crossOver(DNA d){
    String s = "";
    int mid = this.str.length() >> 1;
    for(int i = 0; i < this.str.length(); i++){
      if(i<=mid) s += this.str.charAt(i);
      else s += d.str.charAt(i);
    }
    return new DNA(s);
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float mutationRate){
    char[] newCharArr = new char[this.str.length()];
    for(int i = 0; i < this.str.length(); i++){
      if(random(1) < mutationRate) newCharArr[i] = newChar();
      else newCharArr[i] = this.str.charAt(i);
    }
    this.str = new String(newCharArr);
  }
  
};
