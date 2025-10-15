@echo off
set BACKUP_FILE=%USERPROFILE%\Desktop\Clustertruck.reg
chcp 65001 >nul
REG EXPORT HKEY_CURRENT_USER\Software\Landfall\Clustertruck %BACKUP_FILE%
IF %ERRORLEVEL% == 0 (
    echo "Бэкап сохранен в файл %BACKUP_FILE% (на рабочем столе)"
) ELSE (
    echo Ошибка при сохранении бэкапа. Возможно, сохранения не существует.
)
pause