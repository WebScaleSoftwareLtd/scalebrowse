cd source && export PATH="$$PATH":$$PWD/chromium/third_party/depot_tools/ && export DEPOT_TOOLS_WIN_TOOLCHAIN=0 && python3 scripts/runhooks.py && ninja -C out/Release vivaldi
