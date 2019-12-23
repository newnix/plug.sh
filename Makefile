.POSIX:

## Always run these when specified
.PHONY: status commit pull push help

## Primary user configuration file
include config.mk

PROJECT = plug.sh
PREFIX ?= ${HOME}/.local
DESTDIR ?= /lib
CONFDIR ?= /etc

## This can be overridden though config.mk
SHELL ?= bash

## DVCS control targets
DVCS ?= fossil

status:
	@$(DVCS) $@

commit:
	@$(DVCS) $@

## Assuming fossil, this pushes to git mirrors
push:
	@gitsync -r ${PROJECT} -n master


help:
	@printf "Options for installing %s:\n" "${PROJECT}"
