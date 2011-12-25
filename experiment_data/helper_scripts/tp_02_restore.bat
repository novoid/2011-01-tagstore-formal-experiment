
call D:\grp5\scripts\init_items.bat
call D:\grp5\scripts\init_ordner.bat
call D:\grp5\scripts\init_tagstore.bat

taskkill /IM python.exe

echo off
echo "Wiederherstellen von TP"
echo .
SET /P TPNum="Bitte TP Nummer eingeben: "
echo .
echo "TP-Nummer ist: %TPNum%"
echo .

xcopy /I /C /E D:\grp5\tp-data-backup\TP_%TPNum%\Ordner D:\01_ordner-variante
xcopy /I /C /E D:\grp5\tp-data-backup\TP_%TPNum%\tagstore C:\Users\student\Documents\tagstore

call D:\grp5\scripts\restart_tagstore.bat
