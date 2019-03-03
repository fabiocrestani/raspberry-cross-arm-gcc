# Windows > Raspberry Pi cross-compile base project

This repository contains an Eclipse project to cross-compile and debug for Raspberry Pi from a Windows machine.



## Usage

The project uses a makefile with two main targets: `local-debug` and `raspberry`:

1. Use the `local-debug` to compile with gcc and run the application locally. 
2. Use the `raspberry` target to compile with `arm-linux-gnueabihf-gcc` and run the application in the remote device. Make sure the device is connected to the network and has a ssh server running.



## Setup

### Install MinGW

Download mingw-get-setup from https://sourceforge.net/projects/mingw/files/Installer/ and install: 

* `mingw-developer-toolkit`

* `mingw32-base`

* `mingw32-gcc-g++`

* `msys-base`

  

### Install toolkit with compiler and tools for Raspberry Pi
Download SysGCC from http://gnutoolchains.com/raspberry/



### Add binaries to PATH

In Eclipse, add the binaries to PATH:

Menu Window > Preferences > C/C++ > Build > Environment > Add...
Name: `PATH`
Value: `D:\SysGCC\raspberry\bin;C:\MinGW\bin`



### Add debug configuration

1. In Debug Configurations, add a new C/C++ Remote Application.
2. In C/C++ Application select the executable to be run in the remote device
3. In Remote Absolute File Path for C/C++ set the path to copy the application in the remote device
4. In Connection, create a Remote Host connection and set the IP of the device, as well the username and password for ssh.
5. In Debugger > Main > GDB debugger, set the full path to the gdb: `D:\SysGCC\raspberry\bin\arm-linux-gnueabihf-gdb.exe`