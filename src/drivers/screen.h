#define VIDEOMEMORY 0xb8000
#define screenHeight 25
#define screenWidth 80

void clearScreen();                                           //clear whole screen with empty chars
void print(char* address, int row, int column);                                    //takes a string pointer and writes a string to the screen
void printChar(char letter, int row, int column, char color); //prints a single char to the screen with coordinates and colorMode

#include "screen.c"
