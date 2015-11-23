
C_OUT = main.c_out
JAVA_OUT = Main.class

all: $(C_OUT) $(JAVA_OUT)
run: c java lua php py rb


$(C_OUT):
	gcc -Wall -Wpedantic -std=c99 -o $(C_OUT) main.c

$(JAVA_OUT):
	javac Main.java

clean:
	rm -rvf $(C_OUT) $(JAVA_OUT)


c: $(C_OUT)
	./$(C_OUT)

java: $(JAVA_OUT)
	java Main

lua:
	./main.lua

php:
	./main.php

py:
	./main.py

rb:
	./main.rb
