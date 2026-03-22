SCRIPT_DIR := ./script
TOOLS_DIR  := $(SCRIPT_DIR)/tools

.DEFAULT_GOAL := default
.PHONY: clean kernel pack_kernel magiskboot

default:
	@echo "请指定具体的操作目标！"
	@exit 1

clean:
	cd "$(TOOLS_DIR)" && bash "./clean.bash"

kernel:
	cd "$(SCRIPT_DIR)" && bash "./kernel.bash"

pack_kernel:
	cd "$(SCRIPT_DIR)" && bash "./pack_kernel.bash"

magiskboot:
	cd "$(SCRIPT_DIR)" && bash "./magiskboot.bash"
