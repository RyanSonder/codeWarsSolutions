CC=gcc
CFLAGS=-Wall -Wextra -O2

JAVA_FILES=$(wildcard solutions/*/java/*.java)
C_FILES=$(wildcard solutions/*/c/*.c)
BIN_DIR=bin

all: c java

c:
	@mkdir -p $(BIN_DIR)
	@for file in $(C_FILES); do \
		out="$(BIN_DIR)/$$(basename $$file .c)"; \
		echo "Compiling $$file -> $$out"; \
		$(CC) $(CFLAGS) -o $$out $$file || exit 1; \
	done

java:
	@mkdir -p $(BIN_DIR)
	@for file in $(JAVA_FILES); do \
		echo "Compiling $$file"; \
		javac -d $(BIN_DIR) $$file || exit 1; \
	done

clean:
	rm -rf $(BIN_DIR)/*
