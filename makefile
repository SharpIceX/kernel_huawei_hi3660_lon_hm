OUT_DIR := ./out
TMEP_DIR := ./.tmp
SCRIPT_DIR := ./script

.DEFAULT_GOAL := default
.PHONY: default clean magisk kernel

default:
	@echo "请指定具体的操作目标！"
	@exit 1

kernel:
	cd "$(SCRIPT_DIR)" && bash "./compile_kernel.bash"

magiskboot:
	cd "$(SCRIPT_DIR)" && bash "./compile_magiskboot.bash"

clean:
	rm -rf "$(OUT_DIR)" "$(TMEP_DIR)"
	cd "./submodules/Magisk" && python3 "./build.py" clean native
