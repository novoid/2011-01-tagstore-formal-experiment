taskkill /IM python.exe
rmdir /S /Q C:\Users\student\Documents\tagstore
xcopy /I /C /E D:\grp5\templates\tagstore C:\Users\student\Documents\tagstore


net use t: /DELETE
net use t: \\localhost\d$\02_tagging-variante
