# Build programs from the O'Reilly book "Flex & Bison"

# Prerequisites: flex, and libfl

# Fedora: sudo dnf install flex flex-devel
# Ubuntu: sudo apt install flex libfl-dev

default: build

FLEX=flex

BUILD_DIR=build

%.lex.yy.c: %.l
	$(FLEX) -o $@ $<

lexer.%: %.lex.yy.c
	$(CC) $< -lfl -o $@

.PHONY: build clean

build: lexer.fb1-1 lexer.fb1-3 lexer.fb1-4

clean:
	-rm *.lex.yy.c
	-rm lexer.*
