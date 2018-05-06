SOURCE		= list-system-base
TARGET_DIR	= /usr/local/bin
PLATFORM	= $(shell uname -s)

prep:
	source ./prep

install: prep
	source ./install
