#!/bin/sh

## this script extracts following files from "dir-B-S_of_folders.log":

LIST_OF_ALL_FOLDERS="folders_with_path.txt"
##      ... a concatenated list of all folders with path from the TPs

LIST_OF_ALL_FOLDERS_WO_PATH="folders_without_path.txt"
##      ... a concatenated list of all folders without path from the TPs

FOLDER_LENGTHS="folders_without_path_-_lengths.csv"
##      ... the list of string length from LIST_OF_ALL_FOLDERS_WO_PATH

FOLDER_NUM_PER_TP="folders_number_of_unique_per_TP.csv"
##      ... the list of unique folder names per TP

LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS="folders_list_of_average_nr_of_parentfolders_per_TP.csv"
##      ... the list of the average number of parent folders per TP
rm ${LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS}

COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS="folders_combined_list_of_average_nr_of_parentfolders_per_TP.csv"
##      ... all LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS in one file
rm ${COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS}

AVERAGE_OF_COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS="folders_combined_list_of_average_nr_of_parentfolders_per_TP_-_average.csv"
##      ... average of  COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS in one value



## this procedure takes a TP number as argument and 
## prints the list of folders from the "dir-B-S_of_folders.log" file
extract_folders_from_dir_B_S_of_folders()
{
    ## if a second argument is given, only the folder names (without path) is printed

    if [ "x${2}" = "x" ]; then
    ## extracts the folders with path
	grep TP${1} dir-B-S_of_folders.log | egrep -v '\....$' | \
            egrep -v "TP${1}.Ordner$"
    else
    ## extracts the folders without path
	grep TP${1} dir-B-S_of_folders.log | egrep -v '\....$' | \
            egrep -v "TP${1}.Ordner$" | \
            sed 's#.*\\##'
    fi
}


extract_folder_occurrences()
{
    # folders with files per TP with multiples
    grep TP${1} ../dir-B-S_of_folders.log | \
	grep Ordner |  \
	egrep '\....$' | \
	sed 's#\(.*\)\\.*#\1#' \
	> TP${1}_folders_with_files_with_multiples.txt


    # list of number of parent folders per each file
    grep TP${1} ../dir-B-S_of_folders.log | \
	grep Ordner | \
	egrep '\....$' | \
	sed 's#\(.*\)\\.*#\1#' | \
	sed 's#.*Ordner\\##' | \
	awk '{ print split($0,array,"\\")}' \
	> TP${1}_folders_with_files_with_multiples_-_numbers.txt

    cat TP${1}_folders_with_files_with_multiples_-_numbers.txt >> ../${COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS}

    # calculating the average number and writing to file
    awk '{ total += $1; count++ } END { print total/count }' \
        < TP${1}_folders_with_files_with_multiples_-_numbers.txt \
        >> ../${LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS}
}



extract_folders_from_dir_B_S_of_folders 01 >  ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 02 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 03 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 04 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 05 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 06 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 07 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 08 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 09 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 10 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 11 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 12 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 13 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 14 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 15 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 16 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 17 >> ${LIST_OF_ALL_FOLDERS}
extract_folders_from_dir_B_S_of_folders 18 >> ${LIST_OF_ALL_FOLDERS}

extract_folders_from_dir_B_S_of_folders 01 nopath >  ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 02 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 03 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 04 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 05 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 06 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 07 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 08 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 09 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 10 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 11 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 12 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 13 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 14 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 15 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 16 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 17 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}
extract_folders_from_dir_B_S_of_folders 18 nopath >> ${LIST_OF_ALL_FOLDERS_WO_PATH}

cat ${LIST_OF_ALL_FOLDERS_WO_PATH} | \
    awk '{ print length($0) }' \
    > ${FOLDER_LENGTHS}

## number of folders for each TP
grep TP01 ${LIST_OF_ALL_FOLDERS} |wc -l >  ${FOLDER_NUM_PER_TP}
grep TP02 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP03 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP04 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP05 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP06 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP07 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP08 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP09 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP10 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP11 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP12 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP13 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP14 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP15 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP16 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP17 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}
grep TP18 ${LIST_OF_ALL_FOLDERS} |wc -l >> ${FOLDER_NUM_PER_TP}

cd group_1
extract_folder_occurrences 01
extract_folder_occurrences 02
extract_folder_occurrences 03
extract_folder_occurrences 04
extract_folder_occurrences 05
extract_folder_occurrences 06
extract_folder_occurrences 07
extract_folder_occurrences 08
extract_folder_occurrences 09
cd ../group_2
extract_folder_occurrences 10
extract_folder_occurrences 11
extract_folder_occurrences 12
extract_folder_occurrences 13
extract_folder_occurrences 14
extract_folder_occurrences 15
extract_folder_occurrences 16
extract_folder_occurrences 17
extract_folder_occurrences 18
cd ..

# calculating the average number and writing to file
awk '{ total += $1; count++ } END { print total/count }' \
    < ${COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS} \
    > ${AVERAGE_OF_COMBINED_LIST_OF_AVERAGE_NR_OF_PARENTFOLDERS}


#end