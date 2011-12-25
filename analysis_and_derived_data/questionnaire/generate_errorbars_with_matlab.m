x = xlsread('questionnaire_results.xlsx', 'questionnaire_results')
errorbar(mean(x),std(x), 'r*')
axis([0 14 0 6])

												
