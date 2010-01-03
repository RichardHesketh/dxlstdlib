@echo off

REM    Copyright 2010 by Mathias Mamsch
REM    This file is part of the DOORS Standard Library 

REM    The DOORS Standard Library  is free software: you can redistribute it and/or modify
REM    it under the terms of the GNU General Public License as published by
REM    the Free Software Foundation, either version 3 of the License, or
REM    (at your option) any later version.

REM    The DOORS Standard Library  is distributed in the hope that it will be useful,
REM    but WITHOUT ANY WARRANTY; without even the implied warranty of
REM    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM    GNU General Public License for more details.

REM    You should have received a copy of the GNU General Public License
REM    along with the DOORS Standard Library.  If not, see <http://www.gnu.org/licenses/>.

if exist "setupDOORS.obj" del "setupDOORS.obj"
if exist "setupDOORS.exe" del "setupDOORS.exe"

s:\masm32\bin\ml /c /coff "setupDOORS.asm"
if errorlevel 1 goto errasm

s:\masm32\bin\PoLink /SUBSYSTEM:CONSOLE "setupDOORS.obj"
if errorlevel 1 goto errlink
dir "setupDOORS.*"
copy setupDOORS.exe ..
goto TheEnd

:errlink
echo _
echo Link error
goto TheEnd

:errasm
echo _
echo Assembly Error
goto TheEnd

:TheEnd



pause
