//------------------------------------------------------------------------
//This is an example code of the class. Explains class and gives examples.
//------------------------------------------------------------------------

//first we create three different SlidingGraph objects
SlidingGraph gr1;
SlidingGraph gr2;
SlidingGraph gr3;
SlidingGraph gr4;
SlidingGraph gr5;

//counter is used for slowing down a graph
int counter = 0;

void setup(){
  size(1920,800);
  frameRate(50); //frame rate is used for slowing down the data flow for this example
  noStroke();
  
  gr1 = new SlidingGraph(0,0,width,300,-50,50); //upper one
  gr2 = new SlidingGraph(width/2-300, 700, 600, 100, -50, 50, 30); //bottom center
  gr3 = new SlidingGraph(width/2-300, 400, 600, 100, -50, 50, 30); //lower center
  gr4 = new SlidingGraph(1520, 350, 300, 400, -500, 500, 1); //rigth
  gr5 = new SlidingGraph(100, 350, 300, 400, -50, 50, 1); //left
  
  gr2.graphicColor = color(200, 56, 56);
  gr4.graphicColor = color(156, 200, 1);
  gr5.graphicColor = color(25, 56, 211);
}

void draw(){
  background(255);
  float r = random(-50,50);
  gr1.addValue(r);
  gr1.drawGraph();
  gr2.drawGraph();
  gr3.addValue(r);
  gr3.drawGraph();
  gr5.addValue(r);
  gr5.drawGraph();
  
  //using a counter drawGraph method can be easily slowed down compared to others
  //but obviously sampling time decreases
  if(counter == 5){
    gr2.addValue(r);
    counter = 0; 
  }
  gr4.addValue(r*10);
  gr4.drawGraph(); 
  counter++;

  println(frameRate);
}
