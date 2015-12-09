CDIR = .
BDIR = $(CDIR)/_
CHART_JSURL = https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js
CHART_JS = $(BDIR)/Chart.min.js

GEN = $(BDIR)/generate.sh

C_OUT = $(CDIR)/main.c_out
JAVA_OUT = $(CDIR)/Main.class
SWIFTC_OUT = $(CDIR)/main.swift_out

all build: $(C_OUT) $(JAVA_OUT) $(SWIFTC_OUT)
run: bc c java js lua php py rb
_: _bc _c _java _js _lua _php _py _rb _swift _swiftc

$(C_OUT):
	gcc -Wall -Wpedantic -std=c99 -o $(C_OUT) main.c

$(JAVA_OUT):
	javac Main.java

$(SWIFTC_OUT):
	xcrun swiftc main.swift -o main.swift_out

$(CHART_JS):
	wget -P $(BDIR) $(CHART_JSURL)

$(BDIR)/c.html: $(C_OUT) $(CHART_JS)
	OUT="$(BDIR)/c.html" $(GEN) $(C_OUT)
$(BDIR)/java.html: $(JAVA_OUT) $(CHART_JS)
	OUT="$(BDIR)/java.html" $(GEN) "java Main"
$(BDIR)/swift.html: $(CHART_JS)
	OUT="$(BDIR)/swift.html" $(GEN) "xcrun swift main.swift"
$(BDIR)/swiftc.html: $(SWIFTC_OUT) $(CHART_JS)
	OUT="$(BDIR)/swiftc.html" $(GEN) $(SWIFTC_OUT)

$(BDIR)/%.html: main.% $(CDIR)/*.% $(CHART_JS)
	OUT="$@" $(GEN) "$(CDIR)/$<"

clean:
	rm -rvf $(C_OUT) $(JAVA_OUT) $(SWIFTC_OUT)
_clean: clean
	rm -rvf $(BDIR)/*.html $(CHART_JS)


c: $(C_OUT)
	$(C_OUT)
java: $(JAVA_OUT)
	java Main
swift:
	xcrun swift main.swift
swiftc: $(SWIFTC_OUT)
	$(SWIFTC_OUT)

%: main.%
	$(CDIR)/$<

_bc: $(BDIR)/bc.html
_c: $(BDIR)/c.html
_java: $(BDIR)/java.html
_js: $(BDIR)/js.html
_lua: $(BDIR)/lua.html
_php: $(BDIR)/php.html
_py: $(BDIR)/py.html
_rb: $(BDIR)/rb.html
_swift: $(BDIR)/swift.html
_swiftc: $(BDIR)/swiftc.html
