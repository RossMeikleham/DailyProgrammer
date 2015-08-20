#include <stdio.h>
#include <string.h>

int main() {
    char *inputs[] = {"billowy",
                   "biopsy",
                   "chinos",
                   "defaced",
                   "chintz",
                   "sponged",
                   "bijoux",
                   "abhors",
                   "fiddle",
                   "begins",
                   "chimps",
                   "wronged"
                  };
 
    for (int i = 0; i < sizeof (inputs) / sizeof(inputs[0]); i++) {
        
        char last = 0;
        int forwards = 1;
        int reverse = 1;

        for (int j = 0; j < strlen(inputs[i]) && (forwards || reverse); j++) {
            if (last != 0 && (!forwards || inputs[i][j] < last)) {forwards = 0;}
            if (last != 0 && (!reverse  || inputs[i][j] > last)) {reverse  = 0;}
            last = inputs[i][j];
        }

        printf("%s %s", inputs[i], forwards ? "IN ORDER" : (reverse ? "REVERSE ORDER" : "NOT IN ORDER"));
        printf("\n");

    }

}
