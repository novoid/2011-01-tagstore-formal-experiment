
num_tags <- read.table("all_numbers_of_tags.csv")

pdf('number_of_tags_boxplot.pdf')
boxplot(num_tags, 
    names=c("number of tags FE1"), 
    xlab="tagstore condition", 
    ylab="number of tags per item", 
    pars = list(boxwex = 0.3, staplewex = 0.5, 
    boxfill="lightblue"))

