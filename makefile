TARGET = traceClone
PREFIX = /usr/local/bin
START = traceclone
CONFIG = /etc/init.d
SRC = srv.js
BASE_PATH = 
BASE_TARGET =
DIR_NAME =

all: $(TARGET)
test_target:
ifneq ($(BASE_PATH),)
	echo "$(BASE_PATH)"
ifneq ($(BASE_TARGET),)
	echo "$(BASE_TARGET)"
ifneq ($(DIR_NAME),)
	echo "$(DIR_NAME)"
	make run_target
endif
endif
endif
	echo "BASE_PATH BASE_TARGET DIR_NAME unset"
run_target:
	sed -i -e "s@BASE_PATH@$(BASE_PATH)@" $(SRC)
	sed -i -e "s@BASE_TARGET@$(BASE_TARGET)@" $(SRC)
	sed -i -e "s@DIR_NAME@$(DIR_NAME)@" $(TARGET)
	run install
install:
	$(info ************ INSTALL clone**********)
	cp $(TARGET) $(PREFIX)/$(TARGET)
	cp $(START) $(CONFIG)/$(START)
uninstall:
	$(info ************ UNINSTALL clone**********)
	rm -rf $(PREFIX)/$(TARGET)
	rm -rf $(CONFIG)/$(START)
	git checkout .


