cd source
set PATH=%PATH%;%cd%\chromium\third_party\depot_tools
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
python3 scripts/runhooks.py
ninja -C out/Release vivaldi
