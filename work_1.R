mintemp = c(50.7, 52.8, 48.6,53.0, 49.9, 47.9, 54.1, 47.6, 43.6, 45.5)

mintemp[c(1,10)]
#[1] 50.7 45.5

mintemp[-c(1,10)]
#[1] 52.8 48.6 53.0 49.9 47.9 54.1 47.6 43.6

##computation##
mintempC = 5/9 * (mintemp - 32)
# [1] 10.388889 11.555556  9.222222 11.666667  9.944444  8.833333 12.277778  8.666667  6.444444  7.500000

x = 1:10
#[1]  1  2  3  4  5  6  7  8  9 10

rep(5,3)
#[1] 5 5 5

y = 3:7
#[1] 3 4 5 6 7


rep(y,3)
# [1] 3 4 5 6 7 3 4 5 6 7 3 4 5 6 7

rep(1:4, c(2,3,3,4))
# [1] 1 1 2 2 2 3 3 3 4 4 4 4

c(1,2,3,4) + c(1,2)
#[1] 2 4 4 6
#    1+1， 2+2， 3+1， 4+2

c(1,2,3,4) + c(1,2,3)
#Warning message:
#In c(1, 2, 3, 4) + c(1, 2, 3) :
#  longer object length is not a multiple of shorter object length


#Give the name to each element
taxrate = c(AL = 4, CA = 7.25, IL = 6.25, KS=5.3, NY=4.25, TN=7)
taxrate
#  AL   CA   IL   KS   NY   TN 
#4.00 7.25 6.25 5.30 4.25 7.00 

taxrate_addname = c(4,7.25,6.25,5.3,4.25,7)
names(taxrate_addname) = c('Al','CA','IL','KS','NY','TN')
taxrate_addname
#  AL   CA   IL   KS   NY   TN 
#4.00 7.25 6.25 5.30 4.25 7.00 


taxrate_addname[3]
# IL
#6.25

taxrate_addname['KS']
# KS
#5.3

taxrate < 6
#test the element which less than 6 or not
#   AL    CA    IL    KS    NY    TN 
#TRUE FALSE FALSE  TRUE  TRUE FALSE 

taxrate[taxrate < 6]
#  AL   KS   NY 
#4.00 5.30 4.25

sum(taxrate > 6)
#[1] 3

max(taxrate)
#[1] 7.25

sum(taxrate[taxrate > 6])
#[1] 20.5

taxrate[taxrate == max(taxrate)]
#  CA 
#7.25 

which(taxrate == max(taxrate))
#CA 
#2 (index)

which.max
#function (x) 
#.Internal(which.max(x)) --> .Internal means that the function that actually find the index of the 
#                             maximum value is compiled inside of R
#<bytecode: 0x1037c4f50>
#  <environment: namespace:base>


system.time(one <- which(taxrate == max(taxrate)))
# user  system elapsed 
#  0       0       0 

X <- rnorm(10000000)
system.time(one <- which(X == max(X)))
#   user  system elapsed 
# 0.077   0.013   0.091 

system.time(two <- which.max(X))
#   user  system elapsed 
#    0.020   0.000   0.021 

#TO CAMPARE TWO METHOD OF MAX FUNCTION --> THE SECOND IS FASTER
one
#[1] 3138537
two
#[1] 3138537


###2.3## MODE AND CLASSES
both <- c('dog',3,'cat','mouse',7,12,9,'chicken')
both
#[1] "dog"     "3"       "cat"     "mouse"   "7"       "12"      "9"       "chicken"
# these number were identified as char

mode(both)
#[1] "character"

both[2] + both[5]
#Error in both[2] + both[5] : non-numeric argument to binary operator

#but we can use as.numeric function to tell system that is number
as.numeric(both[2]) + as.numeric(both[5])
#[1] 10


##2.4## READING VECTORS##
#To read data from a file or from the terminal without the need for quotes and commas
setwd("/Users/YF/Dropbox/DataS")
nums = scan('numbers.txt')
nums
#[1] 12  7  9  8 14 10 17


##2.5 MISSING VALUES
## THE MISSING VALUE REPRESENTED BY 'NA'
x <- c(1,4,7,NA,12,19,15,21,20)
mean(x)
#[1] NA

x ==NA
#[1] NA NA NA NA NA NA NA NA NA

##USE na.rm = TRUE to solve
mean(x,na.rm = TRUE)
#[1] 12.375

is.na(x)
#[1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE

x[!is.na(x)]
#[1]  1  4  7 12 19 15 21 20

##2.6##  Matrices##
mymat = matrix(1:12,4,3)
##matrix( elements, rowsNum, colNum)
mymat
#     [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]    2    6   10
#[3,]    3    7   11
#[4,]    4    8   12


#or just tell ncol(col number) or nrow(row number)
mymat = matrix(1:12,ncol=3)
mymat
#    [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]    2    6   10
#[3,]    3    7   11
#[4,]    4    8   12


mymat = matrix(1:12,nrow = 3)
mymat
#    [,1] [,2] [,3] [,4]
#[1,]    1    4    7   10
#[2,]    2    5    8   11
#[3,]    3    6    9   12

mymat <- matrix(scan("numbers.txt"),nrow = 3, byrow=TRUE)
mymat
#byrow -> sequence follow by row, another bycol(defult)
#     [,1] [,2] [,3]
#[1,]   12    7    9
#[2,]    8   14   10
#[3,]   17   12    7

mymat[3,3]
#[1] 7

mymat[1,]
#[1] 12  7  9

mymat[,2]
#[1]  7 14 12


###2.7 DATA FRAMES###
#*** either vector or matrices can only hold one mode of data
# data frame is the best way to store data as a table
temps = data.frame(day = 1:10,
                    min = c(50.7,52.8,48.6,53.0,49.9,47.9,54.1,47.6,43.6,45.5),
                    max = c(59.5,55.7,57.3,71.5,69.8,68.8,67.5,66.0,66.1,61.7))

head(temps)
temps
#day  min  max
#1   1 50.7 59.5
#2   2 52.8 55.7
#3   3 48.6 57.3
#4   4 53.0 71.5
#5   5 49.9 69.8
#6   6 47.9 68.8

class(temps)
#[1] "data.frame"
mode(temps)
#[1] "list"

sapply(temps,mode)
#      day       min       max 
#"numeric" "numeric" "numeric" 

#ways to concentrade on some columns
temps$max
#[1] 59.5 55.7 57.3 71.5 69.8 68.8 67.5 66.0 66.1 61.7

temps[,3]
#[1] 59.5 55.7 57.3 71.5 69.8 68.8 67.5 66.0 66.1 61.7

temps[,"max"]
#[1] 59.5 55.7 57.3 71.5 69.8 68.8 67.5 66.0 66.1 61.7

temps['max']
#    max
#1  59.5
#2  55.7
#3  57.3
#4  71.5
#5  69.8
#6  68.8
#7  67.5
#8  66.0
#9  66.1
#10 61.7

temps[['max']]
# [1] 59.5 55.7 57.3 71.5 69.8 68.8 67.5 66.0 66.1 61.7



##2.8 MORE ON DATA FRAMES
temps[c('min','max')]
#min  max
#1  50.7 59.5
#2  52.8 55.7
#3  48.6 57.3
#4  53.0 71.5
#5  49.9 69.8
#6  47.9 68.8
#7  54.1 67.5
#8  47.6 66.0
#9  43.6 66.1
#10 45.5 61.7


##use with function to work with a data frame without having to constantly retype the data 
##frame's name
with(temps,5/9*(max-32) - 5/9*(min-32))
# [1]  4.888889  1.611111  4.833333 10.277778 11.055556 11.611111  7.444444 10.222222 12.500000  9.000000

#or we can do
5/9*(temps$max-32) - 5/9*(temps$min-32)
# [1]  4.888889  1.611111  4.833333 10.277778 11.055556 11.611111  7.444444 10.222222 12.500000  9.000000

#to add one or more new columns to data frame
temps$range = temps$max - temps$min
head(temps)
#day  min  max range
#1   1 50.7 59.5   8.8
#2   2 52.8 55.7   2.9
#3   3 48.6 57.3   8.7
#4   4 53.0 71.5  18.5
#5   5 49.9 69.8  19.9
#6   6 47.9 68.8  20.9

#or we can do
temps <- transform(temps,range=max-min)


##2.9 READING DATA FRAMES FROM FILES AND URLS
trial1 = read.csv('/Users/YF/Dropbox/EDA/dds_datasets/dds_ch2_nyt/nyt1.csv',header = TRUE, stringsAsFactors = FALSE)
head(trial1)
#Age Gender Impressions Clicks Signed_In
#1  36      0           3      0         1
#2  73      1           3      0         1
#3  30      0           3      0         1
#4  49      1           3      0         1
#5  47      1          11      0         1
#6  47      0          11      1         1
mode(trial1)
#[1] "list"
class(trial1)
#[1] "data.frame"

sapply(trial1,mode)
#        Age      Gender Impressions      Clicks   Signed_In 
#     "numeric"   "numeric"   "numeric"   "numeric"   "numeric" 

sapply(trial1, class)
#        Age      Gender Impressions      Clicks   Signed_In 
#     "integer"   "integer"   "integer"   "integer"   "integer" 


names(trial1)
#[1] "Age"         "Gender"      "Impressions" "Clicks"      "Signed_In"  

dim(trial1)
#[1] 458441      5

trial1[which.max(trial1$Age),]

subset(trial1,Age > 100)
#Age Gender Impressions Clicks Signed_In
#3874   102      1           3      0         1
#183790 102      1           6      0         1
#195509 103      0           4      0         1
#217138 107      1           4      0         1
#219563 101      1           4      0         1
#317311 103      1           3      0         1
#323992 101      0           5      0         1
#334124 101      1           5      0         1
#344812 101      0           2      0         1
#347860 107      1           5      1         1
#369077 108      0           3      0         1
#436710 104      1           6      1         1

head(subset(trial1,select = Impressions:Signed_In))
#Impressions Clicks Signed_In
#1           3      0         1
#2           3      0         1
#3           3      0         1
#4           3      0         1
#5          11      0         1
#6          11      1         1

sort(trial1$Age)
summary(trial1)
#Age             Gender       Impressions         Clicks          Signed_In     
#Min.   :  0.00   Min.   :0.000   Min.   : 0.000   Min.   :0.00000   Min.   :0.0000  
#1st Qu.:  0.00   1st Qu.:0.000   1st Qu.: 3.000   1st Qu.:0.00000   1st Qu.:0.0000  
#Median : 31.00   Median :0.000   Median : 5.000   Median :0.00000   Median :1.0000  
#Mean   : 29.48   Mean   :0.367   Mean   : 5.007   Mean   :0.09259   Mean   :0.7009  
#3rd Qu.: 48.00   3rd Qu.:1.000   3rd Qu.: 6.000   3rd Qu.:0.00000   3rd Qu.:1.0000  
#Max.   :108.00   Max.   :1.000   Max.   :20.000   Max.   :4.00000   Max.   :1.0000  

stem(trial1$Age)
boxplot(trial1$Age,main = 'Boxplot of Age')
hist(trial1$Age, main = 'Histgram of Age')
plot(density(trial1$Age), main='Density of Age')

rollingsales= read.xls('/Users/YF/Dropbox/EDA/dds_datasets/dds_ch2_rollingsales/rollingsales_bronx.xls',sheet = 1, header = TRUE)
rollingsales
rollingsales1 = subset(rollingsales,select = ADDRESS:ZIP.CODE)
head(rollingsales1)
rollingsales2 = subset(rollingsales,select = c(ADDRESS,SALE.PRICE))
head(rollingsales2)
NewRolling = merge(rollingsales1,rollingsales2,by = "ADDRESS")
head(NewRolling)

sum(NewRolling$ZIP.CODE == 10452)
#[1] 122

sum(as.numeric(NewRolling$SALE.PRICE[NewRolling$ZIP.CODE==10452]))
#[1] 56314

table(rollingsales$ZIP.CODE)
#0 10451 10452 10453 10454 10455 10456 10457 10458 10459 10460 10461 10462 10463 10464 10465 10466 10467 10468 10469 
#2    91   112   109    64   207   149   184   175   119   141   373   413   458    67   374   351   280   124   512 
#10470 10471 10472 10473 10474 10475 10803 
#114   283   206   242    80    32     6 

hist(as.numeric(rollingsales$SALE.PRICE),main='location by price')
plot(NewRolling[,-c(1)])


