
## We need a function for a table that can do a multiple amount of tasks:

#- If the "only one country" tab is selected:  columns of years, rows of data points
#- If the "only one year" tab is selected:  columns of Data points, rows of countries
#- If the "only one data point" is selected:  columns of years (with data afiliated with year), rows of countries

source("./API.R")

country_list <- Countries()[[2]] %>% select(id, name)

#Requires a specific year, countries which are being approached, and all the indicators necessary
# Goes to API for each indicator, and combines the new 
OneYear <- function(year, range_countries, range_data){
  data_list <- country_list
  data_list <- staByYear(range_data[[1]], year, range_countries) %>% select(name, value) 
  for(i in 2:length(range_data)){
    list <- staByYear(range_data[[1]], year, range_countries) %>% select(name, value)
    colnames(list) <- c("name", paste0("Value", i))
    
    data_list <- left_join(data_list, list)
  }
  return(data_list)
}

test_function <- function(country, vector){
  for(i in 1:length(vector)){
    if(country == vector[i]){
      return(TRUE)
    }
  }
  return(FALSE)
}

#Year range must be a vector of numbers
oneCountry <- function(Country_name, Year_Range, data_list){
  
  char_vec <- as.character(Year_Range)
  
  }
  




# 5.51.01.09.water

