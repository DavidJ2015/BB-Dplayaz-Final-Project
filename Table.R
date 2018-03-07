
## We need a function for a table that can do a multiple amount of tasks:

#- If the "only one country" tab is selected:  columns of years, rows of data points
#- If the "only one year" tab is selected:  columns of Data points, rows of countries
#- If the "only one data point" is selected:  columns of years (with data afiliated with year), rows of countries

source("./API.R")

country_list <- Countries()[[2]] %>% select(id, name)

#Requires a specific year, countries which are being approached, and all the indicators necessary
# Goes to API for each indicator, and combines each data frame into an encompassing data frame
OneYear <- function(year, range_countries, range_data){
  data_list <- country_list
  data_list <- staByYear(range_data[[1]], year, range_countries) %>% select(name, value)
  if(length(range_data) > 1){
    for(i in 2:length(range_data)){
      list <- staByYear(range_data[[i]], year, range_countries) %>% select(name, value)
      colnames(list) <- c("name", paste0("Value", i))
      data_list <- left_join(data_list, list)
    }
  }
  return(data_list)
}

#Year range must be a vector of numbers
oneCountry <- function(Country_name, Year_Range, data_list){
  staByCountry(data_list, Year_Range, Country_name)
  }
  
oneIndicator <- function(indicator, Year_Range, Country_List){
  staByData(indicator, Year_Range, Country_List)
}




