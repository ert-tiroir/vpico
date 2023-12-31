
SOURCEDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SOURCES   := $(shell find $(SOURCEDIR) -name '*.cpp')

clean:
	-[ -e build/out ] && rm -f build/out
	-[ -e out ] && rm -f out
build:
	mkdir -p build
	make -B clean
	g++ -o build/out -DVIRTUAL -I. $(SOURCES)
	cp build/out .
run:
	make -B build
	./out
test:
	mkdir -p build
	make -B clean
	g++ -o build/out -DTESTING -DVIRTUAL -I. $(SOURCES)
	cp build/out .
	./out