#!/usr/bin/env make
#
# Makefile for a dbwebb ctf.
#
BIN ?= bin
BUILD ?= build

BATS ?= $(BIN)/bats
SHELLCHECK ?= $(BIN)/shellcheck

.PHONY: build check clean clean-all install solve test

all: build test
	@echo ">>> Building and testing the ctf"

build:
	@echo ">>> Building the target for the ctf"
	[ ! -f script/create.bash ] || bash script/create.bash
	ls -l target

check:
	@echo ">>> Checking development environment"
	$(BATS) --version
	echo && $(SHELLCHECK) --version

clean:
	@echo ">>> Cleaning up"
	rm -rf build

clean-all: clean
	@echo ">>> Cleaning up installed items"
	rm -rf bin

install:
	@echo ">>> Install development environment"
	install -d bin

	# Bats
	curl -Lso $(BIN)/bats-exec-suite https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-exec-suite
	curl -Lso $(BIN)/bats-exec-test https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-exec-test
	curl -Lso $(BIN)/bats-format-tap-stream https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-format-tap-stream
	curl -Lso $(BIN)/bats-preprocess https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-preprocess
	curl -Lso $(BATS) https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats
	chmod 755 $(BIN)/bats*

	# Shellcheck
	curl -s https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz | tar -xJ -C $(BIN)

solve:
	@echo ">>> Run and verify the solution"
	[ ! -f script/solve.bash ] || bash script/solve.bash

test:
	@echo ">>> Run tests"
	@#$(SHELLCHECK) --shell=bash src/*.bash
	[ ! -d test ] || $(BATS) test/
