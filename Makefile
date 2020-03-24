UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	TARGET = maxlib.so
else
	TARGET = maxlib.dll
endif

all : $(TARGET)

$(TARGET): maxlib.o
	gcc  -o $@  $^ -shared

maxlib.o: maxlib.c
	gcc  -o $@  -c $<  -std=c99

clean:
	rm -f *.o *.so *.dll *.exe