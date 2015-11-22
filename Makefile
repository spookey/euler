
all: main.c_out Main.class
run: c java lua py


main.c_out:
	gcc -Wall -Wpedantic -o main.c_out main.c

c: main.c_out
	./main.c_out


Main.class:
	javac Main.java

java: Main.class
	java Main

lua:
	./main.lua

py:
	./main.py


clean:
	rm -rvf main.c_out Main.class
