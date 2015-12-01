CDIR = .
BDIR = $(CDIR)/_
CHART_JSURL = https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js
CHART_JS = $(BDIR)/Chart.min.js

GEN = $(BDIR)/generate.sh

C_OUT = $(CDIR)/main.c_out
JAVA_OUT = $(CDIR)/Main.class

all build: $(C_OUT) $(JAVA_OUT)
run: bc c java js lua php py rb
_: _bc _c _java _js _lua _php _py _rb

$(C_OUT):
	gcc -Wall -Wpedantic -std=c99 -o $(C_OUT) main.c

$(JAVA_OUT):
	javac Main.java

$(CHART_JS):
	wget -P $(BDIR) $(CHART_JSURL)

$(BDIR)/c.html: $(C_OUT) $(CHART_JS)
	OUT="$(BDIR)/c.html" $(GEN) $(CDIR)/$(C_OUT)
$(BDIR)/java.html: $(JAVA_OUT) $(CHART_JS)
	OUT="$(BDIR)/java.html" $(GEN) "java Main"
$(BDIR)/%.html: main.% $(CDIR)/*.% $(CHART_JS)
	OUT="$@" $(GEN) "$(CDIR)/$<"

clean:
	rm -rvf $(C_OUT) $(JAVA_OUT)
_clean: clean
	rm -rvf $(BDIR)/*.html $(CHART_JS)


c: $(C_OUT)
	$(CDIR)/$(C_OUT)
java: $(JAVA_OUT)
	java Main
%: main.%
	"$(CDIR)/$<"

_bc: $(BDIR)/bc.html
_c: $(BDIR)/c.html
_java: $(BDIR)/java.html
_js: $(BDIR)/js.html
_lua: $(BDIR)/lua.html
_php: $(BDIR)/php.html
_py: $(BDIR)/py.html
_rb: $(BDIR)/rb.html
