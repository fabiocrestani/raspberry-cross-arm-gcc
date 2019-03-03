#
# makefile
#
# Created on: 3 de mar de 2019
#     Author: Fabio Crestani
#
 
ifdef DEBUG_IN_HOST
	BIN_PATH := bin/x86
	
	OBJS := ./$(BIN_PATH)/main.o
	EXE := ./$(BIN_PATH)/raspberry-gcc-local-debug.exe
	
	CC := gcc
	LL := gcc
	CC_OPTIONS := -c -O0 -g -I"source" 
	LL_OPTIONS := -o $(EXE)
else
	BIN_PATH := bin/arm-linux-gnueabihf
	
	OBJS := ./$(BIN_PATH)/main.o
	EXE := ./$(BIN_PATH)/raspberry-cross-arm-gcc
	
	CC := arm-linux-gnueabihf-gcc
	LL := arm-linux-gnueabihf-gcc
	CC_OPTIONS := -c -O0 -g -I"source" 
	LL_OPTIONS := -o $(EXE)
endif

# Main (all) target
all: $(EXE)
	@echo $(CC)
	@echo "*** finished building ***"

# Rule to build the files in the source folder
./$(BIN_PATH)/%.o: ./source/%.c
	@echo Building file: $<
	$(CC) $(CC_OPTIONS) -o "$@" "$<"
	@echo Finished building: $<
	
# Rule to link the executable
$(EXE): $(OBJS) $(USER_OBJS)
	@echo Building target: $@
	@echo Invoking: Linker
	$(LL) $(LL_OPTIONS) $(OBJS) $(LIBS)
	@echo Finished building target: $@

# Clean target
clean:
	del /f /s /q bin\x86\*.*
	del /f /s /q bin\arm-linux-gnueabihf\*.*
