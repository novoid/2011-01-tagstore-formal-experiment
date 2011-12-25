echo off
echo "TP sichern nach Abspeichern"
echo .
SET /P TPNum="Bitte TP Nummer eingeben: "
echo .
echo "TP-Nummer ist: %TPNum%"
echo .

taskkill /IM python.exe

mkdir D:\grp5\tp-data-backup\TP_%TPNum%
mkdir D:\grp5\tp-data-backup\TP_%TPNum%\Ordner
mkdir D:\grp5\tp-data-backup\TP_%TPNum%\tagstore

xcopy /I /C /E D:\01_ordner-variante D:\grp5\tp-data-backup\TP_%TPNum%\Ordner
xcopy /I /C /E C:\Users\student\Documents\tagstore D:\grp5\tp-data-backup\TP_%TPNum%\tagstore

pause