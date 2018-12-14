#!/usr/bin/env make
#
# Makefile for all sources of dbwebb ctf.
#
BIN ?= bin

BATS ?= $(BIN)/bats
SHELLCHECK ?= $(BIN)/shellcheck-latest/shellcheck

SOURCES := $(shell find src/ -mindepth 1 -maxdepth 1 -type d)
TARGETS := build clean clean-all test

.PHONY: build check clean clean-all install test $(SOURCES)

all: build test
	@echo ">>> Building and testing all the ctfs"

$(TARGETS): $(SOURCES)

$(SOURCES):
	$(MAKE) -C $@ $(MAKECMDGOALS) BIN=$(PWD)/$(BIN)

clean-top:
	rm -rf bin

check:
	@echo ">>> Checking development environment"
	$(BATS) --version
	echo && $(SHELLCHECK) --version

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
