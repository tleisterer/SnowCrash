#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

char *ft_des(char *str) {
  char *result = strdup(str);
  uint32_t v1 = 0;
  int32_t v2 = 0;
  char *v3 = result; // 0x8048571
  int32_t v4 = -1;
  int32_t v5 = 0; // 0x8048571
  char *v6;       // 0x8048474
  bool v7;        // 0x8048474
  int32_t v8;     // 0x8048571
  while (v4 != 0) {
    v6 = v3;
    v8 = v4 - 1;
    v3 = v6 + (v7 ? -1 : 1);
    v5 = v8;
    if (*(char *)v6 == 0) {
      // break ->
      break;
    }
    v4 = v8;
    v5 = 0;
  }
  while (-2 - v5 > v1) {
    int32_t v9 = v2 != 6 ? v2 : 0;
    char *v10 = (char *)(v9 + (int32_t)"0123456");
    char v11 = *v10;
    if (v1 % 2 == 0) {
      if (v11 > 0) {
        char *v12 = (char *)(v1 + result); // 0x804851a
        char v13 = *v12;
        for (int32_t i = 0; i < (int32_t)*v10; i++) {
          char v14 = v13 - 1; // 0x804851d
          v13 = v14 != 31 ? v14 : 126;
          *v12 = v13;
        }
      }
    } else {
      if (v11 > 0) {
        char *v15 = (char *)(v1 + result); // 0x80484c4
        char v16 = *v15;
        for (int32_t i = 0; i < (int32_t)*v10; i++) {
          char v17 = v16 + 1; // 0x80484c7
          v16 = v17 != 127 ? v17 : 32;
          *v15 = v16;
        }
      }
    }
    // 0x8048553
    v1++;
    v2 = v9 + 1;
    v3 = result;
    v4 = -1;
    v5 = 0;
    while (v4 != 0) {
      v6 = v3;
      v8 = v4 - 1;
      v3 = v6 + (v7 ? -1 : 1);
      v5 = v8;
      if (*(char *)v6 == 0) {
        // break ->
        break;
      }
      v4 = v8;
      v5 = 0;
    }
  }
  // 0x8048583
  return result;
}

int main() {
  fputs((char *)ft_des("g <t61:|4_|!@IF.-62FH&G~DCK/Ekrvvdwz?v|"), stdout);
}