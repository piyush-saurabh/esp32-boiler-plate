# ESP32 Boiler Plate
This repository contains the boiler plate or getting started code for ESP32 using ESP-IDF in VSCode. This repository comes with the support for: 
* JTAG debugging using [ESP-Prog](https://robu.in/product/esp-prog-development-board-jtag-debug-program-downloader-compatible-for-esp32/) in VSCode
* Tasks for building firmware
* Task for flashing and monitoring firmware

## Usage Instruction
#### Clone this repository
```bash
git clone https://github.com/piyush-saurabh/esp32-boiler-plate.git
```
#### Search and replace 'boiler-plate' with your project name.

Replace the file at 2 instances
1. CMakeLists.txt (project name)
2. launch.json (target for debbuging)

#### Modify the settings.json
Go to .vscode/settings.json and modify 
* The path for ESP IDF root folder and ESP Tools folder
* Port on which ESP32 board is commected

#### VSCode Tasks
* Press Ctrl+Shift+P to open command palette in VSCode 
* Type 'Run tasks' and press enter. This will now display all the tasks configured in .vscode/tasks.json

## Reference
For more instruction, refer https://github.com/makercrew/esp_prog_vscode_debug
