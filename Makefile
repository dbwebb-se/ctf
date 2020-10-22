#!/usr/bin/env make
#
# Makefile for all sources of dbwebb ctf.
#

# Make adjustments based on OS
ifneq (, $(findstring CYGWIN, $(OS)))
	OS_CYGWIN = "true"
	ECHO = /bin/echo -e
else ifneq (, $(findstring Linux, $(OS)))
	OS_LINUX = "true"
else ifneq (, $(findstring Darwin, $(OS)))
	OS_MAC = "true"
endif

BIN ?= bin

BATS ?= $(BIN)/bats
SHELLCHECK ?= $(BIN)/shellcheck-latest/shellcheck

# Docker
CONTAINER ?= ctf-cli
COMMAND ?= bash

SOURCES := $(shell find src/ -mindepth 1 -maxdepth 1 -type d)
TARGETS := build clean clean-all solve test

.PHONY: build-database check clean-top install test test-docker $(SOURCES)

all: build test
	@echo ">>> Building and testing all the ctfs"

$(TARGETS): $(SOURCES)

$(SOURCES):
	$(MAKE) -C $@ $(MAKECMDGOALS) BIN=$(PWD)/$(BIN)

build: build-database

build-database:
	@echo ">>> Building ctf database"
	bash script/build_database.bash

clean-top:
	rm -rf bin

check:
	@echo ">>> Checking development environment"
	$(MAKE) --version
	$(BATS) --version
	echo && $(SHELLCHECK) --version

install:
	@echo ">>> Install development environment"
	install -d bin
	composer install

	# Bats
	curl -Lso $(BIN)/bats-exec-suite https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-exec-suite
	curl -Lso $(BIN)/bats-exec-test https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-exec-test
	curl -Lso $(BIN)/bats-format-tap-stream https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-format-tap-stream
	curl -Lso $(BIN)/bats-preprocess https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats-preprocess
	curl -Lso $(BATS) https://raw.githubusercontent.com/sstephenson/bats/master/libexec/bats
	chmod 755 $(BIN)/bats*

	# Shellcheck
ifdef OS_LINUX
	curl -Ls https://github.com/koalaman/shellcheck/releases/download/latest/shellcheck-latest.linux.x86_64.tar.xz | tar -xJ -C build/ && rm -f $(BIN)
	shellcheck && ln build/shellcheck-latest/shellcheck $(BIN)
else ifdef OS_MAC
	curl -Ls https://github.com/koalaman/shellcheck/releases/download/latest/shellcheck-latest.darwin.x86_64.tar.xz | tar -xJ -C build/ && rm -f $(BIN)
	shellcheck && ln build/shellcheck-latest/shellcheck $(BIN)
endif



test:
	@echo ">>> Testing"
	composer validate

docker:
	@echo ">>> Run command using docker image"
	docker-compose run $(CONTAINER) $(COMMAND)
