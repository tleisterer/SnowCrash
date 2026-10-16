#include <stdio.h>

int main(int argc, char **argv)
{
  (void)argc;
  int i = 0;
  while(argv[1][i])
  {
    printf("%c", (argv[1][i]) - i);
    i++;
  }
  return 0;
}