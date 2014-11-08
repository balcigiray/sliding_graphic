class SlidingGraph {
  
//global variables
  int posX; //x position of the graph
  int posY; //y position of the graph
  int lengthX; //length of the graph
  int lengthY; //height of the graph
  float highLimit; //upper limit of the incoming data
  float lowLimit; //lower limit of the incoming data
  color graphicColor; //color of the bars
  
//global private variables
  private boolean isSecond = false; //adjusts the array order
  private boolean initialCondition = true; //is used for starting of the program once
  private float[] values1; //datas are stored in these 2 arrays
  private float[] values2;
  private int arrayIndex; //used in addValue method 
  private int arrayPosition; //used in drawGraph method
  private int lineWidth; //adjusts the size of the bars and relative array size
  private int zeroLine;

//constructor
//first 4 variables are same as the rect() function. position and size.
//last 2 variables are for limits
  SlidingGraph(int _posX, int _posY, int _lengthX, int _lengthY, float _lowLimit, float _highLimit){
    posX = _posX;
    posY = _posY;
    lengthX = _lengthX;
    lengthY = _lengthY; 
    highLimit = _highLimit;
    lowLimit = _lowLimit;
    lineWidth = 5; //default bar width  
    arrayIndex = 0;
    graphicColor = color(0); //default color for bars is black
    
    initializeArrays();
  }
  
//override method is for optional line width adjustment
  SlidingGraph(int _posX, int _posY, int _lengthX, int _lengthY, float _lowLimit, float _highLimit, int _lineWidth){
    posX = _posX;
    posY = _posY;
    lengthX = _lengthX;
    lengthY = _lengthY; 
    highLimit = _highLimit;
    lowLimit = _lowLimit;
    lineWidth = _lineWidth;     
    arrayIndex = 0;
    graphicColor = color(0);
    
    initializeArrays();
  }
 
//override method is for optional line color adjustment
  SlidingGraph(int _posX, int _posY, int _lengthX, int _lengthY, float _lowLimit, float _highLimit, color _color){
    posX = _posX;
    posY = _posY;
    lengthX = _lengthX;
    lengthY = _lengthY; 
    highLimit = _highLimit;
    lowLimit = _lowLimit;
    lineWidth = 5;     
    arrayIndex = 0;
    graphicColor = _color;
    
    initializeArrays();
  }
  
  //this method will get the incoming data to SlidingGraph object  
  void addValue(float _value){
  }
  
  //this method will draw the incoming data to the screen
  void drawGraph(){
  }

  //this method will create the 2 arrays which will be used in the object
  //width of the graph and bar width is important in the method
  private void initializeArrays(){
  }
  
  //adjusts the incoming data for constraint area
  private float adjustBoundary(float _data){
  }
  
  //since first loop of the draw is different from rest. This method is required
  private void drawInitialGraph(){
}
