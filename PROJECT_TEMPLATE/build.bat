@echo off
cls
set PATH=C:/msys32/xtensa-lx106-elf/bin;C:/msys32/usr/bin;C:/msys32/mingw32/bin

echo =======================================================================
echo BUILD PROJECT
echo =======================================================================

call make COMPILE=gcc BOOT=new APP=1 SPI_SPEED=40 SPI_MODE=DIO SPI_SIZE_MAP=6 all -j12