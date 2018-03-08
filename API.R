library(httr)
library(jsonlite)
library(dplyr)

base <- "http://api.worldbank.org/v2/"


## Catalog of Sources used by API
# Using this function, we can find who provided data to the API we are using (This may or may not be useful)
API_Sources <- function(){
  pathing <- "sources"
  query <- "?format=json"
  url1 <- paste0(base, pathing, query)
  Sources <- GET(url = url1)
  List_of_Sources <- content(Sources, "text") %>% fromJSON()
}

# List that describes the second list below
L1 <- API_Sources()[[1]]

# Data frame that lists names of companies attributed to this API development and when they contributed to the API
L2 <- API_Sources()[[2]]


## Database about countries listed within this API
Countries <- function(){
  pathing <- "countries"
  query <- paste0("?per_page=304&format=json")
  url2 <- paste0(base, pathing, query)
  Country <- GET(url = url2)
  Country_List <- content(Country, "text") %>% fromJSON()
}

#List that describes L4 below this list
L3 <- Countries()[[1]]

# This brings about a list of 304 countries, and so this should be very, very useful
L4 <- Countries()[[2]]
L4 <- flatten(L4)
write.csv(L4, file = "L4.csv")

## This is not a very useful source of information.  We probably dont want to use it.
IncomeLevels <- function(){
  pathing <- "incomeLevels"
  query <- "?format=json"
  url3 <- paste0(base, pathing, query)
  Income <- GET(url = url3)
  Income_List <- content(Income, "text") %>% fromJSON()
}

# List that describes L6 below
L5 <- IncomeLevels()[[1]]

# This is a data frame that describes income levels for only 7 different countries.  This is not very useful
L6 <- IncomeLevels()[[2]]

Indicators <- function(){
  pathing <- "indicators"
  query <- paste0("?per_page=17066&format=json")
  url4 <- paste0(base, pathing, query)
  Indicate <- GET(url = url4)
  Indicator_List <- content(Indicate, "text") %>% fromJSON()
}

# List that describes L8 below
#L7 <- Indicators()[[1]]

# This is a data frame that has a list of different "indicators" that can be used to search the API site for different statistics/
# data concerning either all the countries or certain countries during or over a time period.  This is ALOT, as it has a total 
# of 17066 rows (please don't push a list like this to gitHub:  it wont work)  I have deselected both L7 and L8 below so that your 
# doesn't run this function twice.  You shouldn't need your computer to write down this data frame.
# L8 <- Indicators()[[2]] %>% flatten()

# This is a basic search of all countries with a certain indicator
searchThroughApi <- function(indicatorValue){
  pathing <- paste0("countries/all/indicators/",indicatorValue)
  query <- ("?format=json")
  url5 <- paste0(base, pathing, query)
  variableValue <- GET(url = url5)
  listOfValues <- content(variableValue, "text") %>% fromJSON()
}


# This is a narrowed search of a particular indicator by specific year or year range
searchThroughApiByYear <- function(indicatorValue, yearRange){
  pathing <- paste0("countries/all/indicators/",indicatorValue)
  query <- paste0("?date=", yearRange, "&format=json")
  url5 <- paste0(base, pathing, query)
  variableValue <- GET(url = url5)
  List_Indicators <- content(variableValue, "text") %>% fromJSON()
}

# This function returns the number of entries of a certain indicator within a certain year
staEntries <- function(indicator, year){
  dataList <- searchThroughApiByYear(indicator, year)
  entries <- dataList[[1]]$total
  return(entries)
}

# Calls on the function that returns the number of entries to use the number in the search through the API (For the entire
# dataframe of countries with a certain indicator)
staFiltered <- function(indicator, year){
  entries <- staEntries(indicator, year)
  pathing <- paste0("countries/all/indicators/",indicator)
  query <- paste0("?date=", year, "&per_page=", entries, "&format=json")
  url6 <- paste0(base, pathing, query)
  ourData <- GET(url = url6)
  pullOurData <- content(ourData, "text") %>% fromJSON()
}

country_list <- Countries()[[2]] %>% select(id, name)

staByYear <- function(indicator, year, list_of_countries){
  entries <- staEntries(indicator, year)
  pathing <- paste0("countries/all/indicators/",indicator)
  query <- paste0("?date=", year, "&per_page=", entries, "&format=json")
  url7 <- paste0(base, pathing, query)
  data <- GET(url = url7)
  pullData <- content(data, "text") %>% fromJSON()
  data_frame <- pullData[[2]] %>% flatten()
  data_frame <- left_join(country_list, data_frame, by = c("name" = "country.value"))
  vectored <- unlist(list_of_countries)
  new_list <- list()
  for(i in 1:length(data_frame$name)){
    new_list[[i]] <- test_function(data_frame$name[i], vectored)
  }
  new_list <- unlist(new_list)
  data_frame <- data_frame %>% filter(new_list)
  return(data_frame)
}


test_function <- function(country, vector){
  for(i in 1:length(vector)){
    if(country == vector[i]){
      return(TRUE)
    }
  }
  return(FALSE)
}

staByCountry <- function(list_of_indicators, list_of_years, country){
  length <- length(list_of_years)
  if(length(list_of_years) > 1){
    years_name <- paste0( list_of_years[[1]], ":", list_of_years[[length]])
  } else{
    years_name <- list_of_years[[1]]
  }
  new_data <- staByData(list_of_indicators[[1]], list_of_years, list(country)) %>% mutate(data = paste0("Value", 1))
  for(i in 2:length(list_of_indicators)){
    new_list <- staByData(list_of_indicators[[i]], list_of_years, list(country)) %>% mutate(data = paste0("Value", i))
    new_data <- rbind(new_data, new_list)
  }
  new_data <- new_data %>% select(-country)
  return(new_data)
}

staByData <- function(indicator, list_of_years, list_of_countries){
  starter_data <- data.frame(country = unlist(list_of_countries))
  for(i in 1:length(list_of_years)){
    new_data <- data.frame(country = unlist(list_of_countries))
    new_data$value <- staByYear(list(indicator), list_of_years[[i]], list_of_countries)$value
    colnames(new_data) <- c("country", paste0("Year", list_of_years[[i]]))
    starter_data <- left_join(starter_data, new_data)
  }
  return(starter_data)
}
intro <- "This project uses the Health Nutrition and Population Statistics found within the database located
    on 'The World Bank' website.As affirmed by the website name, the organization behind this data is The World Bank.  The World Bank has tasked itself with ending world poverty 
    and supporting developing countries, and through their goals, they obtain data through research that they promote, and as 
    a result they have made such data public.  This certain collection of data, is aimed at those who are curious learning 
    about other countries in the world, whether it be something specific--such as population health in a country--or something broad 
    in scope: how countries compare with each other over certain values. This project's aim is to provide easy access to information 
    that sufficiently satisfies curiosities about information concerning country statistics (limited to the data range that will be 
    fulfilled by this project.) Audiences who want basic but copious information concerning country statistics are the main target of 
    this project."