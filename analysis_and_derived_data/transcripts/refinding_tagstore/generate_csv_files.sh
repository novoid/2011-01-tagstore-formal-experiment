#!/bin/sh

../scripts/LogAnalyzerRefinding.py TP01b_t.txt
../scripts/LogAnalyzerRefinding.py TP02b_t.txt
../scripts/LogAnalyzerRefinding.py TP03b_t.txt
../scripts/LogAnalyzerRefinding.py TP04b_t.txt
../scripts/LogAnalyzerRefinding.py TP05b_t.txt
../scripts/LogAnalyzerRefinding.py TP07b_t.txt
../scripts/LogAnalyzerRefinding.py TP08b_t.txt
../scripts/LogAnalyzerRefinding.py TP09b_t.txt
../scripts/LogAnalyzerRefinding.py TP10b_t.txt
../scripts/LogAnalyzerRefinding.py TP11b_t.txt
../scripts/LogAnalyzerRefinding.py TP12b_t.txt
../scripts/LogAnalyzerRefinding.py TP13b_t.txt
../scripts/LogAnalyzerRefinding.py TP14b_t.txt
../scripts/LogAnalyzerRefinding.py TP15b_t.txt
../scripts/LogAnalyzerRefinding.py TP16b_t.txt
../scripts/LogAnalyzerRefinding.py TP17b_t.txt
../scripts/LogAnalyzerRefinding.py TP18b_t.txt

head -n 1 TP01b_t_results.csv > ../refinding_tagstore.csv
for i in TP*b_t_results.csv; do tail -n 1 $i >> ../refinding_tagstore.csv ; done

#end