@echo off
chcp 65001 >nul

goto check_Permissions

:check_Permissions
    echo Проверка прав администратора...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Успешно: права администратора подтверждены.
        goto update_signatures
    ) else (
        echo Запустите скрипт от имени администратора.
        pause
        exit
    )

:update_signatures
    cd /D C:\Program Files\Windows Defender
    MpCmdRun.exe -removedefinitions -dynamicsignatures
    MpCmdRun.exe -SignatureUpdate
    pause