
#include "stdio.h"

#ifndef PROGRAM
#define PROGRAM "{\"name\":\"main\",\"desc\":\"Undefined\",\"osOnly\":false,\"pargs\":[],\"oargs\":[],\"opts\":[]}"
#endif

int main()
{

  printf("%s", PROGRAM);

  return 0;
}