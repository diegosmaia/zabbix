@ECHO OFF

REM # TOKEN EXTRAIR LINHA DE UM ARQUIVO
REM # Revision: 1
REM # Date: 18/03/2016
REM # Author: Diego Maia - diegosmaia@yahoo.com.br Telegram - @diegosmaia
REM # token.bat linha arquivo

for /f "tokens=1* delims=:" %%a in ('findstr /n .* "%2"') do (
  if "%%a" equ "%1" set teste=%%b

)

rem echo "%teste%"
call :Strip %teste%
goto :EOF

:Strip 
REM # Strip e convert , por .
set a=%1.%2
echo %a%
