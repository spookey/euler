CDIR = .

C_OUT = main.c_out
JAVA_OUT = Main.class

all build: $(C_OUT) $(JAVA_OUT)
run: c java js lua php py rb


$(C_OUT):
	gcc -Wall -Wpedantic -std=c99 -o $(C_OUT) main.c

$(JAVA_OUT):
	javac Main.java

clean:
	rm -rvf $(C_OUT) $(JAVA_OUT)


c: $(C_OUT)
	$(CDIR)/$(C_OUT)

java: $(JAVA_OUT)
	java Main

js node:
	$(CDIR)/main.js

lua:
	$(CDIR)/main.lua

php:
	$(CDIR)/main.php

py:
	$(CDIR)/main.py

rb:
	$(CDIR)/main.rb

