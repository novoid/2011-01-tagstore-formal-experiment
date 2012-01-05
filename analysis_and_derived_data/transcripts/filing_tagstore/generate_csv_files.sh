#!/bin/sh

STRING="^(.)?.:.. (m|o|t)$"

egrep -vE "${STRING}" TP01a_t.txt > TP01a_t_modified.txt
egrep -vE "${STRING}" TP02a_t.txt > TP02a_t_modified.txt
egrep -vE "${STRING}" TP03a_t.txt > TP03a_t_modified.txt
egrep -vE "${STRING}" TP04a_t.txt > TP04a_t_modified.txt
egrep -vE "${STRING}" TP05a_t.txt > TP05a_t_modified.txt
egrep -vE "${STRING}" TP07a_t.txt > TP07a_t_modified.txt
egrep -vE "${STRING}" TP08a_t.txt > TP08a_t_modified.txt
egrep -vE "${STRING}" TP09a_t.txt > TP09a_t_modified.txt
egrep -vE "${STRING}" TP10a_t.txt > TP10a_t_modified.txt
egrep -vE "${STRING}" TP11a_t.txt > TP11a_t_modified.txt
egrep -vE "${STRING}" TP12a_t.txt > TP12a_t_modified.txt
egrep -vE "${STRING}" TP13a_t.txt > TP13a_t_modified.txt
egrep -vE "${STRING}" TP14a_t.txt > TP14a_t_modified.txt
egrep -vE "${STRING}" TP15a_t.txt > TP15a_t_modified.txt
egrep -vE "${STRING}" TP16a_t.txt > TP16a_t_modified.txt
egrep -vE "${STRING}" TP17a_t.txt > TP17a_t_modified.txt
egrep -vE "${STRING}" TP18a_t.txt > TP18a_t_modified.txt


../scripts/LogAnalyzerTagstore.py TP01a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP02a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP03a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP04a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP05a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP07a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP08a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP09a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP10a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP11a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP12a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP13a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP14a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP15a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP16a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP17a_t_modified.txt
../scripts/LogAnalyzerTagstore.py TP18a_t_modified.txt

head -n 1 TP01a_t_modified_results.csv > ../filing_tagstore.csv
for i in TP*a_t_modified_results.csv; do tail -n 1 $i >> ../filing_tagstore.csv ; done

#end