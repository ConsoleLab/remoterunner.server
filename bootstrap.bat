@ECHO OFF

MKDIR build
CD build

IF [%1]==[] GOTO 32BIT
IF "%1"=="x64" GOTO 64BIT

ECHO Unrecognized building architecture: "%1"
GOTO EXIT

:64BIT
cmake.exe -DCMAKE_INSTALL_PREFIX=%USERPROFILE%\AppData\Local ..

:32BIT
cmake.exe -DCMAKE_INSTALL_PREFIX=%USERPROFILE%\AppData\Local -T host=x86 -A win32 ..

cmake.exe --build . --target INSTALL --config Release

:EXIT
CD ..
RMDIR /Q /S build