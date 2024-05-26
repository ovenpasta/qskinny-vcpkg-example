

VISUAL STUDIO
=============
You'll need a visual studio build tools or visual studio IDE and launch it's command line prompt.
Be sure to install the "Desktop development with C++" workload

VCPKG
=====

```cmd
git clone https://github.com/microsoft/vcpkg
.\vcpkg\bootstrap-vcpkg.bat
```

BUILD
=====

The first time, the build command will download and compile all the dependencies, and will take a few hours depending on your hardware
You can also install the vcpkg packages globally to reuse the same binaries (read the vcpkg manual for more information)


DEBUG BUILD
===========

```cmd

mkdir build

cmake -S . -B build  -DCMAKE_TOOLCHAIN_FILE=vcpkg\scripts\buildsystems\vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows  --fresh -DVCPKG_OVERLAY_PORTS=vcpkg-overlays --fresh

cmake --build build

cd build/Debug

rem copy all the qt plugins
xcopy ..\..\vcpkg\packages\qtbase_x64-windows\debug\Qt6\plugins\ plugins\ /S

rem copy all the qskinny plugins
xcopy ..\..\vcpkg\packages\qsqkinny_x64-windows\debug\lib\qskinny\plugins\ plugins\ /S

rem set the plugin path
set QSK_PLUGIN_PATH=plugins

rem launch the app
.\myapp.exe

```

RELEASE BUILD
=============

In this case we use Ninja generator, I had issues with the debug build using the msbuild Release target, the Debug build can also use Ninja.
Here we use the same cmake build directory of debug, because otherwise vcpkg will rebuild all the libraries

```cmd

mkdir build

cmake -S . -B build  -DCMAKE_TOOLCHAIN_FILE=vcpkg\scripts\buildsystems\vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows -DVCPKG_OVERLAY_PORTS=vcpkg-overlays -G Ninja -DCMAKE_BUILD_TYPE=Release --fresh

cmake --build build 

cd build

rem copy all the qt plugins -- you will need to delete the unneded ones
xcopy ..\vcpkg\packages\qtbase_x64-windows\Qt6\plugins\ plugins\ /S

rem copy all the qskinny plugins
xcopy ..\vcpkg\packages\qskinny_x64-windows\lib\qskinny\plugins\ plugins\  /S

rem set the plugin path 
set QSK_PLUGIN_PATH=plugins

rem launch the app
.\myapp.exe

```
