@echo off
chcp 1252 > nul
setLocal EnableDelayedExpansion

:: Define variables
set Letra=#
set Letra2=
set Hostname=%ComputerName%
set OutputFile="%Hostname%.txt"
set TitleBar="Gerando Lista de Programas Instalados"
set Contador=0
set Quantity=50
set Speed=100
set Velocidade= 100

:: Simulate progress bar
cls
echo %TitleBar%
echo.
for /l %%b in (1,1,%Quantity%) do (
    cls
    echo %TitleBar%
    echo.
    set /a Contador+=2
    set Letra2=!Letra2!%Letra%
    set Linha=!Letra2!
    echo Carregando [!Linha:~,100!] Concluido: !Contador!%%
    Cscript %temp%\sleep.vbs %Velocidade%> Nul
 
)

:: Query and save installed programs
echo.
echo Salvando....
echo.
wmic product get name,version > "%OutputFile%"



:: Display final message
echo.
echo Lista de Programa Salva: %OutputFile%
echo.
pause
goto Inicio
expand_more