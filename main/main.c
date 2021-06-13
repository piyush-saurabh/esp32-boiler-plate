#include <stdio.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <esp_log.h>

#define TAG "MAIN"

// Comment it to stop debugging
#define DEBUG

void app_main()
{
#ifdef DEBUG
    ESP_LOGI(TAG, "Started...");
#endif

    int i = 0;
    while (true)
    {
        i = i + 1;
        ESP_LOGI(TAG, "Value of i = %d\n", i);

        // Wait for 5 sec
        vTaskDelay(5 * 1000 / portTICK_PERIOD_MS);
    }
}