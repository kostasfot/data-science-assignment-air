# Writing the function
complete <- function(directory, id = 1:332) {
  
  # Creating a list of the csv files
  file_list = list.files(path = directory, pattern = ".csv", full.names = TRUE)
  
  # Numeric variable where sum of the complete cases will be stored
  nobs <- numeric()
  
  # Sum operation of the complete cases
  for (i in id) {
    data <- read.csv(file_list[i])
    nobs <- c(nobs, sum(complete.cases(data)))
  }
  
  # Creating a table form of our results
  data.frame(id, nobs)
}
