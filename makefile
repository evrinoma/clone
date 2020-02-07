TARGET = traceClone
PREFIX = /usr/local/bin
START = traceclone
CONFIG = /etc/init.d

all: $(TARGET)
install:
	$(info ************ INSTALL clone**********)
	cp $(TARGET) $(PREFIX)/$(TARGET)
	cp $(START) $(CONFIG)/$(START)
uninstall:
	$(info ************ UNINSTALL clone**********)
	rm -rf $(PREFIX)/$(TARGET)
	rm -rf $(CONFIG)/$(START)


