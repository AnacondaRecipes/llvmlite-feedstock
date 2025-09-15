setlocal enabledelayedexpansion

@rem CMAKE_ARGS is set by visual studio's activation script. 
@rem We need to extract the CMake variables and export them as environment variables
@rem to have llvmlite's build script use them.
for /f "tokens=1,2 delims==" %%a in ('echo %CMAKE_ARGS% ^| findstr /r "-D[^=]*="') do (
    set "%%a=%%b"
)

@rem Ensure there are no build leftovers (CMake can complain)
if exist ffi\build rmdir /S /Q ffi\build

%PYTHON% -m pip install . --no-deps  --no-build-isolation --ignore-installed -vv
if errorlevel 1 exit 1
