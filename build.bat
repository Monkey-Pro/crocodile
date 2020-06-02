@echo off
:loop
@echo off&amp;color 0A
cls
echo,
echo 请选择要编译的系统环境：
echo,
echo 1. Windows_amd64
echo 2. linux_amd64
echo 3. linux_i386
echo 4. All
echo 0. quit
echo,
::清空release目录...
rmdir /s release /Q
SET projectName="crocodile-server"
SET zipDirs=config
del app


set/p action=请选择:
if %action% == 1 goto build_Windows_amd64
if %action% == 2 goto build_linux_amd64
if %action% == 3 goto build_linux_i386
if %action% == 4 goto all
if %action% == 0 goto end
cls &amp; goto :loop

:build_Windows_amd64
echo 编译Windows版本64位
SET CGO_ENABLED=0
SET GOOS=windows
SET GOARCH=amd64
go build -v -a -o release/windows/amd64/%projectName%_windows_amd64.exe
echo 添加资源到工作目录并打包
copy release\windows\amd64\%projectName%_windows_amd64.exe .
echo 打成zip包
WinRAR.exe a release/%projectName%_windows_amd64.zip %zipDirs% %projectName%_windows_amd64.exe
timeout /t 2 /nobreak
del %projectName%_windows_amd64.exe
goto end

:build_linux_amd64
echo 编译Linux版本64位
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -v -a -o release/linux/amd64/%projectName%_linux_amd64
echo 添加资源到工作目录并打包
copy release\linux\amd64\%projectName%_linux_amd64 .
echo 打成zip包
WinRAR.exe a release/%projectName%_linux_amd64.zip %zipDirs% %projectName%_linux_amd64
timeout /t 2 /nobreak
del %projectName%_linux_amd64
goto end

:build_linux_i386
echo 编译Linux版本32位
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=386
go build -v -a -o release/linux/i386/%projectName%_linux_i386
echo 添加资源到工作目录并打包
copy release\linux\i386\%projectName%_linux_i386 .
echo 打成zip包
WinRAR.exe a release/%projectName%_linux_i386.zip %zipDirs% %projectName%_linux_i386
timeout /t 2 /nobreak
del %projectName%_linux_i386
goto end

:all
echo 准备编译所有版本，请耐心等待...
timeout /t 3 /nobreak
::删除之前的zip包
del release\*.zip
echo,

echo 编译Windows版本64位
SET CGO_ENABLED=0
SET GOOS=windows
SET GOARCH=amd64
go build -v -a -o release/windows/amd64/%projectName%_windows_amd64.exe
echo 添加资源到工作目录并打包
copy release\windows\amd64\%projectName%_windows_amd64.exe .
echo 打成zip包
WinRAR.exe a release/%projectName%_windows_amd64.zip %zipDirs% %projectName%_windows_amd64.exe
timeout /t 2 /nobreak
del %projectName%_windows_amd64.exe

echo ===============分隔符=====================

echo 编译Linux版本64位
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -v -a -o release/linux/amd64/%projectName%_linux_amd64
echo 添加资源到工作目录并打包
copy release\linux\amd64\%projectName%_linux_amd64 .
echo 打成zip包
WinRAR.exe a release/%projectName%_linux_amd64.zip %zipDirs% %projectName%_linux_amd64
timeout /t 2 /nobreak
del %projectName%_linux_amd64

echo ===============分隔符=====================

echo 编译Linux版本32位
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=386
go build -v -a -o release/linux/i386/%projectName%_linux_i386
echo 添加资源到工作目录并打包
copy release\linux\i386\%projectName%_linux_i386 .
echo 打成zip包
WinRAR.exe a release/%projectName%_linux_i386.zip %zipDirs% %projectName%_linux_i386
timeout /t 2 /nobreak
del %projectName%_linux_i386

:end
start release
pause
#@exit
