.PHONY: init reset create-patches rebase-patches build
.DEFAULT_GOAL := build

ifeq ($(OS),Windows_NT)
	OS_SPECIFIC := export DEPOT_TOOLS_WIN_TOOLCHAIN=0
else
	OS_SPECIFIC := ./chromium/build/install-build-deps.sh --no-syms --no-arm --no-chromeos-fonts --no-nacl --no-prompt
endif

init:
	git clone https://github.com/IAmJSD/vivaldi-source.git source
	cd source && git checkout $(shell cat current_commit.txt)
	cd source && git checkout -b patches
	cd source && (git am ../patches/*.patch || true)

reset:
	cd source && git switch main && git branch -D patches
	cd source && git checkout -b patches
	cd source && (git am ../patches/*.patch || true)

create-patches:
	rm -rf patches && cd source && git format-patch -o ../patches/ main

rebase-patches:
	rm current_commit.txt && cd source && git rev-parse --short=8 origin/main > ../current_commit.txt
	cd source && git fetch origin main && git rebase origin/main

build:
	cd source && export PATH="$$PATH":$$PWD/chromium/third_party/depot_tools/ && $(OS_SPECIFIC) && python3 scripts/runhooks.py && ninja -C out/Release vivaldi
