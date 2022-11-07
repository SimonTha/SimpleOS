void setup1(){
  clearScreen();
  print("Hello world!", 0, 0);
}

void keyPressed1(unsigned int keyCode){
  if(keyCode == 37){
    exit();
  }
}
