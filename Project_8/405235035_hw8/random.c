#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main()
{
    float data[200][200];
    int i = 0, j = 0;

    FILE *fp;
    fp = fopen("data.txt", "w+");

    srand(time(NULL));

    //Generates an integer number from 0 to 999
    //and then divides it to 100 and converts it to a floating point number.
    for (i = 0; i < 200; i++)
    {
        for (j = 0; j < 200; j++)
        {
            data[i][j] = (float)(rand() % 1000) / 100;
            fprintf(fp, "%.2f ", data[i][j]);
        }
        fprintf(fp, "\n");
    }

    fclose(fp);

    return 0;
}