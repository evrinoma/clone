TARGET = traceClone
PREFIX = /usr/bin
START = traceclone
CONFIG = /etc/init.d
SRC = srv.js
BASE_PATH =
BASE_TARGET =
DIR_NAME =

strict: $(TARGET) build_target

all: $(TARGET) build_target run_target

full: $(TARGET) build_target run_target run_start

build_target:
    @if [ -z "$(BASE_PATH)" ] || [ -z "$(BASE_TARGET)" ] || [ -z "$(DIR_NAME)" ]; then \
	echo "BASE_PATH, BASE_TARGET, или DIR_NAME не заданы"; \
	exit 1; \
    else \
	echo "BASE_PATH=$(BASE_PATH)"; \
	echo "BASE_TARGET=$(BASE_TARGET)"; \
	echo "DIR_NAME=$(DIR_NAME)"; \
	$(MAKE) run_target; \
    fi

run_target:
    sed -i -e "s@BASE_PATH@$(BASE_PATH)@" $(SRC)
    sed -i -e "s@BASE_TARGET@$(BASE_TARGET)@" $(SRC)
    sed -i -e "s@DIR_NAME@$(DIR_NAME)@" $(TARGET)

run_start:
    $(info ************ INSTALL clone ************)
    cp $(START) $(CONFIG)/$(START)

run_target:
    $(info ************ DOCKER clone ************)
    cp $(TARGET) $(PREFIX)/$(TARGET)

uninstall:
    $(info *********** UNINSTALL clone ***********)
    rm -rf $(PREFIX)/$(TARGET)
    rm -rf $(CONFIG)/$(START)
    git checkout .
