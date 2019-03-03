OBJS := ./bin/main.o

ifdef DEBUG
	EXE := ./bin/raspberry-gcc-local-debug.exe
	CC := gcc
	LL := gcc
	CC_OPTIONS := -c -O0 -g -I"source" 
	LL_OPTIONS := -o $(EXE)
else
	EXE := ./bin/raspberry-cross-arm-gcc
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
./bin/%.o: ./source/%.c
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
	del /f /s /q bin\*.*
