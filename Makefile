CDIR = .
BDIR = $(CDIR)/_
CHART_JSURL = https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js
CHART_JS = $(BDIR)/Chart.min.js

GEN = $(BDIR)/generate.sh

C_OUT = $(CDIR)/main.c_out
GROOVY_DIR = $(CDIR)/groovy
GROOVY_OUT = $(GROOVY_DIR)/Main.class
JAVA_DIR = $(CDIR)/java
JAVA_OUT = $(JAVA_DIR)/Main.class
RUST_OUT = $(CDIR)/main.rs_out
SWIFTC_OUT = $(CDIR)/main.swift_out

all build: $(C_OUT) $(GROOVY_OUT) $(JAVA_OUT) $(RUST_OUT) $(SWIFTC_OUT)
run: bc c groovy groovyc java js lua php py rb rust swift swiftc
_: _bc _c _groovy _groovyc _java _js _lua _php _py _rb _rust _swift _swiftc

$(C_OUT):
	gcc -Wall -Wpedantic -std=c99 -o $(C_OUT) main.c

$(GROOVY_OUT):
	groovyc -d $(GROOVY_DIR) Main.groovy

$(JAVA_OUT):
	mkdir $(JAVA_DIR)
	javac -d $(JAVA_DIR) Main.java

$(RUST_OUT):
	rustc -o $(RUST_OUT) main.rs

$(SWIFTC_OUT):
	xcrun swiftc main.swift -o main.swift_out

$(CHART_JS):
	wget -P $(BDIR) $(CHART_JSURL)

$(BDIR)/c.html: $(C_OUT) $(CHART_JS)
	OUT="$(BDIR)/c.html" $(GEN) $(C_OUT)
$(BDIR)/java.html: $(JAVA_OUT) $(CHART_JS)
	OUT="$(BDIR)/java.html" $(GEN) "java -classpath $(JAVA_DIR) Main"
$(BDIR)/groovy.html: $(CHART_JS)
	OUT="$(BDIR)/groovy.html" $(GEN) "groovy Main.groovy"
$(BDIR)/groovyc.html: $(GROOVY_OUT) $(CHART_JS)
	OUT="$(BDIR)/groovyc.html" $(GEN) "groovy -classpath $(GROOVY_DIR) Main"
$(BDIR)/rust.html: $(RUST_OUT) $(CHART_JS)
	OUT="$(BDIR)/rust.html" $(GEN) $(RUST_OUT)
$(BDIR)/swift.html: $(CHART_JS)
	OUT="$(BDIR)/swift.html" $(GEN) "xcrun swift main.swift"
$(BDIR)/swiftc.html: $(SWIFTC_OUT) $(CHART_JS)
	OUT="$(BDIR)/swiftc.html" $(GEN) $(SWIFTC_OUT)

$(BDIR)/%.html: main.% $(CDIR)/*.% $(CHART_JS)
	OUT="$@" $(GEN) "$(CDIR)/$<"

clean:
	rm -rvf $(C_OUT) $(GROOVY_DIR) $(JAVA_DIR) $(RUST_OUT) $(SWIFTC_OUT)
_clean: clean
	rm -rvf $(BDIR)/*.html $(CHART_JS)


c: $(C_OUT)
	$(C_OUT)
java: $(JAVA_OUT)
	java -classpath $(JAVA_DIR) Main
groovy:
	groovy Main.groovy
groovyc: $(GROOVY_OUT)
	groovy -classpath $(GROOVY_DIR) Main
rust: $(RUST_OUT)
	$(RUST_OUT)
swift:
	xcrun swift main.swift
swiftc: $(SWIFTC_OUT)
	$(SWIFTC_OUT)

%: main.%
	$(CDIR)/$<

_bc: $(BDIR)/bc.html
_c: $(BDIR)/c.html
_groovy: $(BDIR)/groovy.html
_groovyc: $(BDIR)/groovyc.html
_java: $(BDIR)/java.html
_js: $(BDIR)/js.html
_lua: $(BDIR)/lua.html
_php: $(BDIR)/php.html
_py: $(BDIR)/py.html
_rb: $(BDIR)/rb.html
_rust: $(BDIR)/rust.html
_swift: $(BDIR)/swift.html
_swiftc: $(BDIR)/swiftc.html
