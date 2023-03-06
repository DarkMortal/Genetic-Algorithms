int trainingIndex = 0;
Brain b = new Brain(3,1.5);
Point[] points = new Point[80];

void setup(){
  size(650,650);
  surface.setTitle("Neural Perceptron");
  
  for(int i=0;i<points.length;i++)
    points[i] = new Point(random(rangeX[0],rangeX[1]), random(rangeY[0],rangeY[1]));
}

void draw(){
  clear();
  background(136, 192, 208);
  stroke(0);
  l1.disp();
  
  for(Point p:points){
    p.draw();
    float[] inputs = {p.x, p.y, 1.0};  // 1.0 is the bias
    int guess = b.getResult(inputs);
    if(guess == p.label) fill(0,255,0);
    else fill(255,0,0);
    circle(p.getX(), p.getY(), 15);
  }
  
  Point pIndex = points[trainingIndex];
  float[] inputs = {pIndex.x, pIndex.y, 1.0}; // 1.0 is the bias
  b.train(inputs, pIndex.label);
  
  // drawing the training line
  stroke(255);
  drawNeuron(b.n);
  
  trainingIndex++;
  if(trainingIndex == points.length) trainingIndex = 0;
}
