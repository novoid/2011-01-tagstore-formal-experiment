#!/bin/sh

../scripts/LogAnalyzerFolder.py TP01a_f.txt
../scripts/LogAnalyzerFolder.py TP02a_f.txt
../scripts/LogAnalyzerFolder.py TP03a_f.txt
../scripts/LogAnalyzerFolder.py TP04a_f.txt
../scripts/LogAnalyzerFolder.py TP05a_f.txt
#../scripts/LogAnalyzerFolder.py TP06a_f.txt
../scripts/LogAnalyzerFolder.py TP07a_f.txt
../scripts/LogAnalyzerFolder.py TP08a_f.txt
../scripts/LogAnalyzerFolder.py TP09a_f.txt
../scripts/LogAnalyzerFolder.py TP10a_f.txt
../scripts/LogAnalyzerFolder.py TP11a_f.txt
../scripts/LogAnalyzerFolder.py TP12a_f.txt
../scripts/LogAnalyzerFolder.py TP13a_f.txt
../scripts/LogAnalyzerFolder.py TP14a_f.txt
../scripts/LogAnalyzerFolder.py TP15a_f.txt
../scripts/LogAnalyzerFolder.py TP16a_f.txt
../scripts/LogAnalyzerFolder.py TP17a_f.txt
../scripts/LogAnalyzerFolder.py TP18a_f.txt

head -n 1 TP01a_f_results.csv > ../filing_folders.csv
for i in TP*a_f_results.csv; do tail -n 1 $i >> ../filing_folders.csv ; done

#end