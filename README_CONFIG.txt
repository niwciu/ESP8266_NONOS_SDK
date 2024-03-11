1. CREATING VS CODE C/C++ Configutayion
	a) click on some .c file
	b) in bottom right correnr of vs code window click on C/C++ Configuration -> Edit Configurations UI
	c) add Configurations (for example "ESP_NONS_SDK")
	d) set complier path to extensa compiler ( depanding on where you installed , in my case it's C:/msys32/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc.exe)
	e) add the fallowing folder from my sys to "inclde path"
		C:/msys32/xtensa-lx106-elf/bin;
		C:/msys32/usr/bin;
		C:/msys32/mingw32/bin;
		(again correct path depand on place where msys32 was installed)
	f) set C stadard to 99
 2) Configure Build task
	a) Ctrr+P and press >
	b) type and select Tasks: Configure Task
	c) select "Create tasks.json file from template and "Others"
	d) edit file to add taks listed bellow. You can add -jxx flag according to your developers machine properties
	
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "make",
            "args": [ 
                "COMPILE=gcc" ,
                "BOOT=new",
                "APP=1",
                "SPI_SPEED=40",
                "SPI_MODE=DIO",
                "SPI_SIZE_MAP=6",
                "all",
            ],
            "options": {
                "cwd": "${workspaceFolder}/CZYSTY_SZABLON/",
                "env": {

                    "PATH":"C:/msys32/xtensa-lx106-elf/bin;C:/msys32/usr/bin;C:/msys32/mingw32/bin"
                }
            }
        },
        {
            "label": "Clean",
            "type": "shell",
            "command": "make",
            "args": [ 
                "clean" ,
            ],
            "options": {
                "cwd": "${workspaceFolder}/CZYSTY_SZABLON/",
                "env": {

                    "PATH":"C:/msys32/xtensa-lx106-elf/bin;C:/msys32/usr/bin;C:/msys32/mingw32/bin"
                }
            }
        }
    ]
}
3) compiling using predefined scripts
	a) open script build.bat
	b) edit path to the correct value in line 3 and save it
	c) open project location in terminal and typ ./build.bat
	d) to configure clean script do same for celan.bat file
	
	e) to use script open project folder in terminal and type ./build.bat or ./clean.bat
	