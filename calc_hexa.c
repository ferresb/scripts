#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

#define SIZE 8

int parse_str(char* str) {
    int result = 0;
    int val;
    int i = 0;
    while (str[i] != '\0') {
        if (('0' <= str[i]) && (str[i] <= '9')) {
            val = str[i] - '0';
        } else {
            if (('a' <= str[i]) && (str[i] <= 'f')) {
                val = 10 + str[i] - 'a';
            } else {
                if (('A' <= str[i]) && (str[i] <= 'F')) {
                    val = 10 + str[i] - 'A';
                } else {
                    printf("Chiffre non conforme : %c\n", str[i]);
                    exit(1);
                }
            }
        }
        result = result * 16 + val;
        i++;
    }
    return result;
}

int compute(int a, char* op, int b) {
    switch (op[0]) {
        case '+': 
            return a + b;
        case '-':
            return a - b;
        default:
            printf("Opération %c non conforme", op[0]);
            exit(1);
    }
}

int main() {
    char str[SIZE];
    printf("1ère opérande :\n");
    scanf("%s", &str);
    int a = parse_str(str);
    printf("2ème opérande :\n");
    scanf("%s", &str);
    int b = parse_str(str);
    printf("opération :\n");
    scanf("%s", &str);
    int result = compute(a, str, b);
    printf("Base 10: %d %s %d = %d\n", a, str, b, result);
    printf("Base 16: 0x%x %s 0x%x = 0x%x\n", a, str, b, result);
    return 0;
}
