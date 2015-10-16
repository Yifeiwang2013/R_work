##Study note 2
## 2.11 ADDING COLOR TO PLOTS
World <- data.frame(countries = c('Algeria','Angola','Burkina Faso','Chad','Guinea','Kenya',
                                               'Abkhazia','Bhutan','China','India','Laos','Mongolia',
                                               'Albania','Belgium','Finland','France','Germany','Italy','Monaco','United Kingdom',
                                               'Anguilla','Barbados','Costa Rica','Dominica','Canada','United States of America',
                                               'Australia','Guam','Nauru','Niue','Samoa','Tuvalu',
                                               'Argentina','Chile','Brazil','Guyana','Paraguay','Suriname','Argentina'),
                                 Continent = c(rep('AF',6),rep('AS',6),rep('EU',8),rep('NA',6),rep('OC',6),rep('SA',7)))

levels(World$Continent)
#[1] "AF" "AS" "EU" "NA" "OC" "SA"

mycolors = c('red','yellow','blue','green','orange','violet')

mycolors[World$Continent]
library(XML)
