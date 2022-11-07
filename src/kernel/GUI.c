void drawMainMenu(){
  clearScreen();
  char* titleTxt = "Simple OS ";
  print(titleTxt, screenWidth/2-strlen(titleTxt)/2, 1);

  char* programText = "Run Program Number #";
  int i;
  for(i = 0; i < 3; i++){
    print(programText, 0, 5+i);
    printChar(0x31+i, strlen(programText), 5+i, 0x0f);
  }

  printChar(27, strlen(programText) + 2, 5+cursor, 0x0f);
}
