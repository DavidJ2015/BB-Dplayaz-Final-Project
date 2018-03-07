is.installed <- function(package){
    is.element(package, installed.packages()[,1])
}

if (!is.installed("httr")){
  install.packages("httr")
}

if (!is.installed("shinydashboard")){
  install.packages("shinydashboard")
}

if (!is.installed("dplyr")){
  install.packages("dplyr")
}

if (!is.installed("ggplot2")){
  install.packages("ggplot2")
}

if (!is.installed("ggrepel")){
  install.packages("ggrepel")
}

if (!is.installed("maps")){
  install.packages("maps")
}

if (!is.installed("mapdata")){
  install.packages("mapdata")
}

if (!is.installed("countrycode")){
  install.packages("countrycode")
}

# Source code - https://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages