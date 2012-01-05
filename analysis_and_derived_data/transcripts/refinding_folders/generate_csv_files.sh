#!/bin/sh

../scripts/LogAnalyzerRefinding.py TP01b_f.txt
../scripts/LogAnalyzerRefinding.py TP02b_f.txt
../scripts/LogAnalyzerRefinding.py TP03b_f.txt
../scripts/LogAnalyzerRefinding.py TP04b_f.txt
../scripts/LogAnalyzerRefinding.py TP05b_f.txt
../scripts/LogAnalyzerRefinding.py TP07b_f.txt
../scripts/LogAnalyzerRefinding.py TP08b_f.txt
../scripts/LogAnalyzerRefinding.py TP09b_f.txt
../scripts/LogAnalyzerRefinding.py TP10b_f.txt
../scripts/LogAnalyzerRefinding.py TP11b_f.txt
../scripts/LogAnalyzerRefinding.py TP12b_f.txt
../scripts/LogAnalyzerRefinding.py TP13b_f.txt
../scripts/LogAnalyzerRefinding.py TP14b_f.txt
../scripts/LogAnalyzerRefinding.py TP15b_f.txt
../scripts/LogAnalyzerRefinding.py TP16b_f.txt
../scripts/LogAnalyzerRefinding.py TP17b_f.txt
../scripts/LogAnalyzerRefinding.py TP18b_f.txt

head -n 1 TP01b_f_results.csv > ../refinding_folders.csv
for i in TP*b_f_results.csv; do tail -n 1 $i >> ../refinding_folders.csv ; done

#end