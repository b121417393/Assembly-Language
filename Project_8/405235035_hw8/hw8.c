#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>

//Convert a string to a floating point number
float my_atof(char *str) 
{
    float temp = 0;
    float divide = 10;

    //Part before the decimal point
    while (*str >= '0' && *str <= '9' && *str != '.') 
    {
        temp = temp * 10.0 + (*str - '0');
        str++;
    }

    if (*str == '.')
        str++;

    //Part after the decimal point
    while (*str >= '0' && *str <= '9' && *str != '\0') 
    {
        temp = temp + (*str - '0') / divide;
        divide *= 10;
        str++;
    }

    return temp;
}

//Take out the floating point number in the string
void get_number(char *text, float data[200]) 
{
    char *ptr, *token = " ";
    int i = 0;

    ptr = strtok(text, token);

    while (ptr != NULL) 
    {
        data[i] = my_atof(ptr);
        i++;
        ptr = strtok(NULL, token);
    }

    return;
}

int main(void) 
{
    float data[200][200], sum[200];
    char text[2048];
    int i = 0, j = 0, k = 0;
    struct timeval start, end;
    unsigned long diff;

    FILE *fp, *fd;
    fp = fopen("data.txt", "r+");
    fd = fopen("output.txt", "w+");

    //Reading data
    while (fgets(text, 2048, fp) != NULL) 
    {
        get_number(text, data[i]);
        i++;
    }

    //Time before the calculation
    gettimeofday(&start, NULL);

    //Processing data
    for (i = 0; i < 200; i++) 
    {
        //Set zero
        sum[i] = 0;

        for (j = 0; j < 200; j++)
            for (k = 0; k < 200; k++)
                sum[i] += data[i][k] * data[j][k];  //Multiply and then add

        fprintf(fd, "%.4f\n", sum[i]);
    }

    //Time after the calculation
    gettimeofday(&end, NULL);
    diff = 1000 * (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000;
    printf("Calculated time total:%ld millisecond\n", diff);

    fclose(fp);
    fclose(fd);

    return 0;
}