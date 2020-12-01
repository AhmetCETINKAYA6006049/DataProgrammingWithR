#R comment line with hash

5+8
1:20
3^4
31%%7
7 * 4  +3
3 + 4 * 7
(3+9)*4
log2(32)
sqrt(81)
abs(-3)
factorial(5)


toplam <- 5+8
toplam

sum <- 3+5
sum

oran <- 0.25
anapara <- 1000
yil <- 30
faiz <- anapara*oran*yil
faiz  

x <- 1:11
x
mean(x)
min(x)
var(x)
max(x)

#R is case sensitive
K?k <- sqrt
K?k(16)

a <- "R is a good language"
a

a <- (1+1 ==3)
a

#objects we have in this workspace
objects()

#Documentation of a function 
?sqrt()
help(mean)

#using packages from library
install.packages("gstat")
library(gstat)
#detach package
detach("package:gstat", unload = TRUE)

#deleting package
remove.packages("gstat")

getwd()

#setwd('C:/Users/DevPro/Desktop/MyNewDirectory')

#exiting RStudio
q(save = "no")








