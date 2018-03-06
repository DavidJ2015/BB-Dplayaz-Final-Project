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
# L8 <- Indicators()[[2]]

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
  listOfValues <- content(variableValue, "text") %>% fromJSON()
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

