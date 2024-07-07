@echo off
chcp 65001 > nul
REM coleta_manual.cmd
REM Este script é usado para coletar arquivos de um equipamento com CronosX+Linux através do CMD.
REM Uso:
REM coleta_manual.cmd

REM Solicita o nome do equipamento
set /p EQUIPAMENTO="Digite o nome do equipamento para criação da pasta: "

REM Solicita o IP do equipamento
set /p IP_REMOTO="Digite o IP do equipamento (pressione Enter para usar 192.168.10.50): "
IF "%IP_REMOTO%"=="" (
    set IP_REMOTO=192.168.10.50
)

set BASE_COLETA=C:\Coletas\

REM Verifica se o diretório base existe
IF NOT EXIST "%BASE_COLETA%" (
    mkdir "%BASE_COLETA%"
    echo Diretório %BASE_COLETA% criado.
)

set EQUIPAMENTO_DIR=%BASE_COLETA%%EQUIPAMENTO%

REM Cria o diretório do equipamento, se não existir
IF NOT EXIST "%EQUIPAMENTO_DIR%" (
    mkdir "%EQUIPAMENTO_DIR%"
    echo Diretório %EQUIPAMENTO_DIR% criado.
)

REM Define o comando SCP
set REMOTE_PATH=odroid@%IP_REMOTO%:/media/p3/APP_local/cronosx/lotes/
set SCP_COMMAND=scp -r -p -o StrictHostKeyChecking=no %REMOTE_PATH% %EQUIPAMENTO_DIR%

REM Executa o comando SCP
%SCP_COMMAND%
IF %ERRORLEVEL% NEQ 0 (
    echo Erro: Não foi possível copiar os arquivos do equipamento remoto.
    exit /b 1
)

REM Compacta a pasta com 7-Zip
set ZIP_FILE=%BASE_COLETA%%EQUIPAMENTO%\%EQUIPAMENTO%_coleta.zip
7z a -tzip "%ZIP_FILE%" "%EQUIPAMENTO_DIR%\*" >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Erro: Não foi possível compactar os arquivos.
    exit /b 1
)

echo Coleta e compactação concluídas com sucesso.

REM Abre o diretório do equipamento no Explorer
start "" "%EQUIPAMENTO_DIR%"

exit /b 0
