#!/bin/sh

## this script uses extract_single_line_tags_from_raw-tags-files.sh
## it visits all data of TP and generates a single file containing 
##    all tags used by all TPs including multiple occurrences 

## the resulting "TPxx_raw_tags.txt" files contain the list of tags for each item (with corrected umlauts)
## the resulting "TPxx_raw_tags_single_unique.txt" files contain the list of single unique tags (with corrected umlauts)


TMPFILE=`mktemp`
ALL_TAGS_FILE="tags_list_of_all_with_multiples.txt"
ALL_TAG_LENGTHS_FILE="tags_list_of_all_with_multiples_-_lengths.csv"
SUMMARIZED_TAGS_UNIQUE="tags_concated_-_raw_tags_single_unique.txt"
SUMMARIZED_TAGS_UNIQUE_LENGTHS="tags_concated_-_raw_tags_single_unique_-_lengths.csv"
NUMBER_UNIQUE_TAGS_PER_TP="tags_number_of_unique_per_TP.csv"

## this procedure takes a TP number as argument and 
## prints the list of tags from the original store.tgs file of the TP and
## corrects German umlauts
extract_tags_from_store_tgs_files()
{
    ## extracts the tags and corrects German umlauts:
    grep '\tags' TP${1}_store.tgs | \
	sed 's/.*tags=//' | \
	sed 's/\"//g' | \
	sed 's/\\xd6/Ö/g' | \
	sed 's/\\xf6/ö/g' | \
	sed 's/\\xe4/ä/g' | \
	sed 's/\\xdf/ß/g' | \
	sed 's/\\xfc/ü/g' | \
	sed 's/\\x62/b/g' | \
	sed 's/\\x65/e/g' | \
	sed 's/\\x61/a/g' | \
	sed 's/\\x66/f/g' | \
	sed 's/\\x64/d/g'
}

## this procedure takes a TP number as argument and
## prints a list of tags from all items of the TP with one tag per line
## still containing multiple occurrences of each tag
extract_single_line_tags_from_raw_tags_files()
{
    cat TP${1}_raw_tags.txt | awk '{split($0,array,",") } { for (x in array) print array[x] }'
}

generate_single_uniq()
{
    extract_single_line_tags_from_raw_tags_files ${1} | sort > ${TMPFILE}
    ## correct line endings:
    dos2unix ${TMPFILE}
    sort ${TMPFILE} | uniq > TP${1}_raw_tags_single_unique.txt
}


cd group_1

extract_tags_from_store_tgs_files 01 > TP01_raw_tags.txt
extract_tags_from_store_tgs_files 02 > TP02_raw_tags.txt
extract_tags_from_store_tgs_files 03 > TP03_raw_tags.txt
extract_tags_from_store_tgs_files 04 > TP04_raw_tags.txt
extract_tags_from_store_tgs_files 05 > TP05_raw_tags.txt
extract_tags_from_store_tgs_files 06 > TP06_raw_tags.txt
extract_tags_from_store_tgs_files 07 > TP07_raw_tags.txt
extract_tags_from_store_tgs_files 08 > TP08_raw_tags.txt
extract_tags_from_store_tgs_files 09 > TP09_raw_tags.txt

dos2unix TP01_raw_tags.txt
dos2unix TP02_raw_tags.txt
dos2unix TP03_raw_tags.txt
dos2unix TP04_raw_tags.txt
dos2unix TP05_raw_tags.txt
dos2unix TP06_raw_tags.txt
dos2unix TP07_raw_tags.txt
dos2unix TP08_raw_tags.txt
dos2unix TP09_raw_tags.txt

generate_single_uniq 01
generate_single_uniq 02
generate_single_uniq 03
generate_single_uniq 04
generate_single_uniq 05
generate_single_uniq 06
generate_single_uniq 07
generate_single_uniq 08
generate_single_uniq 09

extract_single_line_tags_from_raw_tags_files 01 >  ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 02 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 03 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 04 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 05 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 06 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 07 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 08 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 09 >> ../${ALL_TAGS_FILE}

wc -l TP01_raw_tags_single_unique.txt | awk '{ print $1 }' >  ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP02_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP03_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP04_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP05_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP06_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP07_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP08_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP09_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}

cat *_raw_tags_single_unique.txt > ../${SUMMARIZED_TAGS_UNIQUE}

cd ../group_2

extract_tags_from_store_tgs_files 10 > TP10_raw_tags.txt
extract_tags_from_store_tgs_files 11 > TP11_raw_tags.txt
extract_tags_from_store_tgs_files 12 > TP12_raw_tags.txt
extract_tags_from_store_tgs_files 13 > TP13_raw_tags.txt
extract_tags_from_store_tgs_files 14 > TP14_raw_tags.txt
extract_tags_from_store_tgs_files 15 > TP15_raw_tags.txt
extract_tags_from_store_tgs_files 16 > TP16_raw_tags.txt
extract_tags_from_store_tgs_files 17 > TP17_raw_tags.txt
extract_tags_from_store_tgs_files 18 > TP18_raw_tags.txt

dos2unix TP10_raw_tags.txt
dos2unix TP11_raw_tags.txt
dos2unix TP12_raw_tags.txt
dos2unix TP13_raw_tags.txt
dos2unix TP14_raw_tags.txt
dos2unix TP15_raw_tags.txt
dos2unix TP16_raw_tags.txt
dos2unix TP17_raw_tags.txt
dos2unix TP18_raw_tags.txt

generate_single_uniq 10
generate_single_uniq 11
generate_single_uniq 12
generate_single_uniq 13
generate_single_uniq 14
generate_single_uniq 15
generate_single_uniq 16
generate_single_uniq 17
generate_single_uniq 18

extract_single_line_tags_from_raw_tags_files 10 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 11 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 12 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 13 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 14 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 15 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 16 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 17 >> ../${ALL_TAGS_FILE}
extract_single_line_tags_from_raw_tags_files 18 >> ../${ALL_TAGS_FILE}
cat *_raw_tags_single_unique.txt >> ../${SUMMARIZED_TAGS_UNIQUE}

wc -l TP10_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP11_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP12_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP13_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP14_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP15_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP16_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP17_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}
wc -l TP18_raw_tags_single_unique.txt | awk '{ print $1 }' >> ../${NUMBER_UNIQUE_TAGS_PER_TP}

cd ..

## extracts the length of each tag into a file
cat ${ALL_TAGS_FILE} | awk '{ print length($0) }' > ${ALL_TAG_LENGTHS_FILE}

cat ${SUMMARIZED_TAGS_UNIQUE} | awk '{ print length($0) }' > ${SUMMARIZED_TAGS_UNIQUE_LENGTHS}


#end