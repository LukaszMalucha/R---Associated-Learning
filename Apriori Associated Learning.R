# Apriori

# Data Preprocessing - Transform csv file into 0-1 column sparse matrix with 'arules' package
install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE) ## read csv file
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE) ## remove duplicates
summary(dataset)  ## density = how many non-zero values (3%)
itemFrequencyPlot(dataset, topN = 10)  ## plot for most popular product in the basket

# Training Apriori on the dataset - set boundries support 0.04%, confidence 20%
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results - sorted by 10 highest lift results
inspect(sort(rules, by = 'lift')[1:10])    
