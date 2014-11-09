 /*constructor contains 6 or 7 variables
  *(a,b,c,d,e,f) or (a,b,c,d,e,f,g)
  *
  *a: x coordinate of the graph upper left corner
  *b: y coordinate of the graph upper left corner
  *c: width of the graph
  *d: height of the graph
  *e: lower limit of the input data
  *f: higher limit of the input data
  *g: width of the individual graphic bars
  */

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
  
  //this method will get the incoming data to SlidingGraph object  
  void addValue(float _value){
    _value = adjustBoundary(_value);
    
    //program enters here at first starting
    if(initialCondition == true){
      values1[arrayIndex] = _value;
      arrayIndex++;
      
      if(arrayIndex == values1.length){
        arrayIndex = 0;  
        initialCondition = false;
      }
    }
    
    else{
      if(isSecond == true){
        values1[arrayIndex] = _value;    
      }    
      else{
        values2[arrayIndex] = _value;
      }
      arrayIndex++;
  
      if(arrayIndex == values1.length){
        arrayIndex = 0;
        isSecond = !isSecond;        
      }    
    }
  }
  
  //this method will draw the incoming data to the screen
  void drawGraph(){
    fill(graphicColor);
    int xCounter = posX;
    
    if (initialCondition == true){
      drawInitialGraph();
    }
    
    else{
      if(isSecond == false){
        for(int i=arrayIndex; i<values1.length; i++){
          rect(xCounter, zeroLine, lineWidth, values1[i]);
          xCounter += lineWidth;        
        }
        for(int i=0; i<arrayIndex; i++){
          rect(xCounter, zeroLine, lineWidth, values2[i]);
          xCounter += lineWidth;
        }
      }
      
      else{
        for(int i=arrayIndex; i<values2.length; i++){
          rect(xCounter, zeroLine, lineWidth, values2[i]);
          xCounter += lineWidth;        
        }
        for(int i=0; i<arrayIndex; i++){
          rect(xCounter, zeroLine, lineWidth, values1[i]);
          xCounter += lineWidth;
        }
      }
    }   
  }

  //this method will create the 2 arrays which will be used in the object
  //width of the graph and bar width is important in the method
  private void initializeArrays(){
    int size = parseInt(lengthX/lineWidth);

    values1 = new float[size];
    values2 = new float[size];  
  }
  
  //adjusts the incoming data for constraint area
  private float adjustBoundary(float _data){
    zeroLine = parseInt(lengthY/2);
    _data = map(_data, lowLimit, highLimit, -zeroLine, zeroLine);    
    zeroLine += posY;    
    return -_data;
  }
  
  //since first loop of the draw is different from rest. This method is required
  private void drawInitialGraph(){
    for(int i=0; i<values1.length; i++){
      rect(lineWidth*i+posX, zeroLine, lineWidth, values1[i]);
    }  
  }

}
