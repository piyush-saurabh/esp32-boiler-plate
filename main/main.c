#include<stdio.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

void app_main(void)
{
    int i = 0;
    while (true)
    {
        i = i+1;
        printf("Value of i = %d\n", i);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}