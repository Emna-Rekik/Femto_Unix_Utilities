CC:= gcc
CFLAGS:= -std=c11 -O0 -Wall -g
BUILD_PATH:= ./build
EXEC_PATH:= $(BUILD_PATH)/excecutables
OBJECTS_PATH:= $(BUILD_PATH)/objects
SOURCE_PATH:= ./sources

pwd: $(EXEC_PATH)/pwd
echo: $(EXEC_PATH)/echo
cp: $(EXEC_PATH)/cp
mv: $(EXEC_PATH)/mv

$(EXEC_PATH)/pwd: build $(BUILD_PATH)/excecutables $(OBJECTS_PATH)/pwd.o
	$(CC)  $(OBJECTS_PATH)/pwd.o -o $(EXEC_PATH)/pwd

$(OBJECTS_PATH)/pwd.o: $(BUILD_PATH)/objects $(SOURCE_PATH)/pwd.c
	$(CC) -c $(SOURCE_PATH)/pwd.c
	mv pwd.o $(OBJECTS_PATH)
	
$(EXEC_PATH)/echo: build $(BUILD_PATH)/excecutables $(OBJECTS_PATH)/echo.o
	$(CC)  $(OBJECTS_PATH)/echo.o -o $(EXEC_PATH)/echo

$(OBJECTS_PATH)/echo.o: $(BUILD_PATH)/objects $(SOURCE_PATH)/echo.c
	$(CC) -c $(SOURCE_PATH)/echo.c
	mv echo.o $(OBJECTS_PATH)
	
$(EXEC_PATH)/cp: build $(BUILD_PATH)/excecutables $(OBJECTS_PATH)/cp.o
	$(CC)  $(OBJECTS_PATH)/cp.o -o $(EXEC_PATH)/cp

$(OBJECTS_PATH)/cp.o: $(BUILD_PATH)/objects $(SOURCE_PATH)/cp.c
	$(CC) -c $(SOURCE_PATH)/cp.c
	mv cp.o $(OBJECTS_PATH)
	
$(EXEC_PATH)/mv: build $(BUILD_PATH)/excecutables $(OBJECTS_PATH)/mv.o
	$(CC)  $(OBJECTS_PATH)/mv.o -o $(EXEC_PATH)/mv

$(OBJECTS_PATH)/mv.o: $(BUILD_PATH)/objects $(SOURCE_PATH)/mv.c
	$(CC) -c $(SOURCE_PATH)/mv.c
	mv mv.o $(OBJECTS_PATH)
	
build: 
	mkdir -p build
	
$(BUILD_PATH)/excecutables: 
	mkdir -p $(BUILD_PATH)/excecutables
	
$(BUILD_PATH)/objects:
	mkdir -p $(BUILD_PATH)/objects
	
.PHONY : clean	
clean: 
	-@rm -r $(BUILD_PATH)

