void printChar(char letter, int row, int column, char color){
  char* video_memory = (char*) VIDEOMEMORY;       //defines a pointer to the video memory
  video_memory[(column * 80 + row)*2+1] = color;  //sets the color attribute
  video_memory[(column * 80 + row)*2] = letter;   //sets the char
}

void print(char* address, int row, int column){
  int i;
  for(i = 0; address[i] != 0x00; i++){
    printChar(address[i], row + i, column, 0x0f);
  }
}

void clearScreen(){
  int i, j;
  for(i = 0; i < screenWidth;i++){
    for(j = 0; j < screenHeight; j++){
      printChar(' ', i, j, 0x00);
    }
  }
}
