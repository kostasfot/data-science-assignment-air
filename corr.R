corr <- function(directory, threshold = 0) {
  # Creating a list of the CSV files
  file_list <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  
  # Numeric vector to store the correlations
  correlations <- numeric()
  
  # Calculate correlations for monitors meeting the threshold requirement
  for (i in seq_along(file_list)) {
    data <- read.csv(file_list[i])
    num_complete_cases <- sum(complete.cases(data))
    
    # Calculate correlation if threshold is met
    if (num_complete_cases > threshold) {
      sulfate <- data$sulfate[complete.cases(data)]
      nitrate <- data$nitrate[complete.cases(data)]
      correlation <- cor(sulfate, nitrate)
      correlations <- c(correlations, correlation)
    }
  }
  
  return(correlations)
}

