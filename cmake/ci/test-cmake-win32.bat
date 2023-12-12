@echo off

set Generator=Visual Studio 16 2019

if "%1" == "Ninja" ^
(

set VSENV="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
if exist %VSENV% (
call %VSENV% 
goto :build
) else (echo "not find vs in" %VSENV%)

set VSENV="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
if exist %VSENV% (
call %VSENV% 
goto :build
) else (echo "not find vs in" %VSENV%)

set VSENV="D:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
if exist %VSENV% (call %VSENV% ) else (exit /B)

)
else ^
(

call "%~dp0\find-msvcinfo.bat"
if not %errorlevel%==0 (exit /b 1)
		
call "%VSDir%\VC\Auxiliary\Build\vcvars64.bat"

REM ��ע�����ѯ win10 SDK ��װĿ¼����Ҫ�����ж�ע�����ѯ�Ƿ񱻽���������� vcvars64.bat ���޷��������û�������Ҫ�ֶ����û�������
call "%~dp0\check-vcvars64.bat"

)
:build
echo "build"

cd %~dp0

cd ../../

echo Generator : %Generator%
mkdir test-build
cd test-build
mkdir build
cd build

echo "Release"	
cmake ^
    -G "%Generator%" ^
    -DCMAKE_BUILD_TYPE=Release ^
	-DCC_UNIT_TESTING=ON ^
    ..\..\ || exit /b
	
cd ../../