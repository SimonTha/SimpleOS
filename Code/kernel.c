void start () { //dont use main as name because mingw may mess up
  char* video_memory = (char*) 0xb8000;   //define where video memory is

  *video_memory = 'X';                    //Put an X on the top left of the screen
}
