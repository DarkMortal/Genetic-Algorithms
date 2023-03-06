class Line{
  float m,b;
  Line(float m_,float b_){
    this.m = m_;
    this.b = b_;
  }
  float f(float x){ return this.m * x + this.b; }
  
  void disp(){
    Point p1 = new Point(rangeX[0], this.f(rangeX[0]));
    Point p2 = new Point(rangeX[1], this.f(rangeX[1]));
    line(p1.getX(), p1.getY(), p2.getX(), p2.getY());
  }
  
}

Line l1 = new Line(-0.5, 0.2);

// draw line using a neuron
void drawNeuron(Neuron n_){
  float m = n_.weights[0] / n_.weights[1];
  float c = n_.weights[2] / n_.weights[1];
  Line l2 = new Line(-m, -c);
  l2.disp();
}
