# Writing the function
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Storing all the csv files into a list
  file_list <- list.files(path = directory,
                         pattern = ".csv",
                         full.names = TRUE)
  
  # Creating a variable to store our data into
  values <- numeric()
  
  for (i in id) {
    data <- read.csv(file_list[i])
    values <- c(values, data[[pollutant]])
  }
  
  # Calculating the means
  mean(values, na.rm = TRUE)
}
