SOURCE		= list-system-base
TARGET_DIR	= /usr/local/bin
PLATFORM	= $(shell uname -s)

prep:
	awk '{print $$0}' ./prep | sh

install: prep
	awk '{print $$0}' ./install | sh
