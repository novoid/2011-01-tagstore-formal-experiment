

all_tags_lengths <- read.table("tags_concated_-_raw_tags_single_unique_-_lengths.csv")

pdf('tag_length_boxplot.pdf')
boxplot(all_tags_lengths, 
    names=c("tagstore condition"), 
    xlab="tagstore condition", 
    ylab="number of characters in tags", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))

list_of_all_folders_without_paths_lengths <- read.table("folders_without_path_-_lengths.csv")

pdf('folder_length_boxplot.pdf')
boxplot(list_of_all_folders_without_paths_lengths, 
    names=c("folder condition"), 
    xlab="folder condition", 
    ylab="number of characters in folders", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))


pdf('folder_and_tag_length_boxplot.pdf')
boxplot(list(list_of_all_folders_without_paths_lengths$V1, all_tags_lengths$V1), 
    names=c("folder condition", "tagstore condition"), 
    #xlab="FE 1", 
    ylab="number of characters", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))

ufolders <- read.table("folders_number_of_unique_per_TP.csv")
utags <- read.table("tags_number_of_unique_per_TP.csv")

pdf('folder_and_tag_uniques_boxplot.pdf')
boxplot(list(ufolders$V1, utags$V1), 
    names=c("folder condition", "tagstore condition"), 
    #xlab="FE 1", 
    ylab="unique occurrences per TP", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))

avnroftags <- read.table("../transcripts/filing_tagstore/average_nr_of_tags_-_list.csv")
avnrofparenfolders <- read.table("folders_list_of_average_nr_of_parentfolders_per_TP.csv")
pdf('average_nr_of_parentfolders_vs_average_nr_of_tags_boxplot.pdf')
boxplot(list(avnrofparenfolders$V1, avnroftags$V1), 
    names=c("folder condition", "tagstore condition"), 
    #xlab="FE 1", 
    ylab="average number of associated categories", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))


