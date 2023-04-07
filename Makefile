NAME=gbemu
BUILD_DIR=build

.PHONY: default
default: release tags

#################
# Utility targets
#################

.PHONY: build-dir
build-dir:
	@mkdir -p $(BUILD_DIR)

.PHONY: rebuild
rebuild: clean release tags

.PHONY: compile
compile:
	@cd $(BUILD_DIR) && make

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)

.PHONY: tags
tags:
	@ctags .

.PHONY: format
format:
	@./scripts/clang-format

.PHONY: tidy
tidy: debug
	@./scripts/clang-tidy

###################
# Commands to build
###################

.PHONY: cmake-debug
cmake-debug: build-dir
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=on ..

.PHONY: cmake-release
cmake-release: build-dir
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Release ..

.PHONY: debug
debug: cmake-debug compile

.PHONY: release
release: cmake-release compile
