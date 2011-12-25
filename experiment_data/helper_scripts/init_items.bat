net use m: /DELETE

rmdir /S /Q D:\00_Dateien
mkdir D:\00_Dateien
xcopy /I /C /E D:\grp5\templates\Dateien D:\00_Dateien

net use m: \\localhost\d$\00_Dateien
