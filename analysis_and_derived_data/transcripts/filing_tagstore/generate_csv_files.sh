#!/bin/sh

STRING="^(.)?.:.. (m|o|t)$"

echo "generating logs without commands for: \"m\", \"o\", or \"t\" ..."
## ... because parser does not understand those commands
## and they are not of interest for now
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

echo "analyze modified log files and generate result CSVs ..."
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

echo "generate combined result CSV file .."
head -n 1 TP01a_t_modified_results.csv > ../filing_tagstore.csv
for i in TP*a_t_modified_results.csv; do tail -n 1 $i >> ../filing_tagstore.csv ; done

echo "generate combined file for all numbers of tags ..."
grep " ta " TP*a_t.txt | grep -v '#' | sed "s/.* ta //" > all_numbers_of_tags.csv

echo "generate average number of tags ..."
awk '{ total += $1; count++ } END { print total/count }' \
    < all_numbers_of_tags.csv \
    > average_nr_of_tags_-_general_value.csv

echo "generate number of tags files for each TP ..."
NR_OF_TAGS_FILE_POSTFIX="a_t_number_of_tags.csv"
AVERAGE_NR_OF_TAGS_FILE_POSTFIX="a_t_average_number_of_tags.csv"

for testperson in `ls -1 TP* | sed 's/TP\(..\).*/TP\1/' | sort | uniq`; do

    echo "doing TP${testperson} ..."

    nr_of_tags_file="${testperson}${NR_OF_TAGS_FILE_POSTFIX}"
    average_nr_of_tags_file="${testperson}${AVERAGE_NR_OF_TAGS_FILE_POSTFIX}"

    echo "generating \"${nr_of_tags_file}\" ..."
    ## get all lines with a "ta" command; ignore lines with comment; extract numbers
    grep " ta " ${testperson}a_t.txt | grep -v '#' | sed "s/.* ta //" > ${nr_of_tags_file}

    echo "generating \"${average_nr_of_tags_file}\" ..."
    awk '{ total += $1; count++ } END { print total/count }' \
	< ${nr_of_tags_file} \
	> ${average_nr_of_tags_file}

done

echo "generating: average_nr_of_tags_-_list.csv"
cat TP*a_t_average_number_of_tags.csv > average_nr_of_tags_-_list.csv

#end