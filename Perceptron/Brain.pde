class Neuron{
  float[] weights;
  
  Neuron(int n){
    this.weights = new float[n];
    for(int i=0;i<n;i++) this.weights[i] = random(5);
  }
  
  float getOutput(float[] inputs){
    float sum = 0.0;
    for(int i=0;i<this.weights.length;i++)
      sum += this.weights[i] * inputs[i];
    return sum;
  }
  
};

class Brain{
  Neuron n;
  float lr;  // learning rate
  
  Brain(int p, float lr_){
    n = new Neuron(p);
    lr = lr_;
  }
  
  void train(float[] inputs,int target){
    int guess = signum(this.n.getOutput(inputs));
    int error = target - guess;
    for(int i=0;i< this.n.weights.length; i++)
      this.n.weights[i] += error * inputs[i] * lr;
  }
  
  int getResult(float[] inputs){ return signum(this.n.getOutput(inputs)); }
  
};

int signum(float r){
  return (r<=0)?-1:1;
}
