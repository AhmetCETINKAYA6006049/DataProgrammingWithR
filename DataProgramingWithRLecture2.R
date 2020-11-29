#vectors
a <- c(1, 2,3)
a

#printing first element
a[1]

#NA 
a[4]

#empt members NA
a[4] <- 123
a[7] <- 11

#vector becomes character
a[9] <- "e"
a

#typeof array
typeof(a)

#length of array
length(a)

#mean (ortalama)
v <- c(3,2,8,9,6,4)
mean(v)

sort(v,decreasing = FALSE) #or decreasing(TRUE)

v <- c("z", "e", "b", "c", "g", "A", "<")
v
sort(v, decreasing = TRUE)

num3to20 <- c(3:10)
num3to20

bazi_sayilar <- c( 2,3,5,7,11,13,17,19,23,29,31,37, 
                   41,43,47,59,67,71,73,79,83,89,97,103, 107, 119)

vector_adding <- c(bazi_sayilar, num3to20, 4:1) #
vector_adding


#vekt?r?n 3, 6, 7. ?yelerini bas
bazi_sayilar[c(3,6,7)]

#vekt?r?n 3,4,5,6,7. ?yelerini bas
num3to20[3:7]

#x. deger hari?
num3to20[-1]

#belli araligi almamasi i?in
num3to20[-(1:3)]

#y'yi 3 ile ?arp ama y'yi etkileme
y <- c(0, 7, 8)
y*3

#z=y-5
z <-y-5
z

#y^2 ve z^2
y^2
z^2

d <- c(0, 1, 2, 3, 4)
e <-1:5
f <- 1:50

d+e

# boyutlar ayni degilse k???g? boyutunda kaydirarak toplar
d+f

d*e

# kaydirarak ?arpar k???k olanin rakamlarini b?y?k olandakinin sirasiyla tekrarlar sliding
d*f

#ardisik sayilar 1,3,5, ..., 21
seq(1, 21, by =2)

#x i n kez bas rep(3,10)
rep(3, 10)

#paterne g?re sayi bastir 2 den 20 ye kadar ardisik sayilari 3 kez bastir
rep(seq(2,20, by = 2), 5)

#her bir elemani ayri ayri sirali bastirmak
rep(c(1,4), each =3)

sort(rep(seq(2,20, by = 2 ), 3))


#bos vekt?r
bazi.cift <- NULL
bazi.cift


bazi.cift[seq(2,20, by =2)] <-seq(2, 20, by =2) 
bazi.cift

x <- c( 0, 7,8)
x/x  #NaN
1/x  #Inf

#karakter vekt?rleri

colours <- c("red", "yellow", "blue")
colours
typeof(colours)

more.colours <- c(colours, "green", "magenta", "cyan")
more.colours

z <- c("red", "green", 1)
z

#her ?yein 2 ve 3. karakterini al
substr(colours, 2, 3)

#"red  flowers"    "yellow  flowers" "blue  flowers" 
paste(colours, " flowers")

#"several reds"    "several yellows" "several blues" 
paste("several ", colours, "s", sep ="")

#"I like  red, I like  yellow, I like  blue"
paste("I like ", colours , collapse=", ")


#morecolours in 2 ve 5. ?yeleri
more.colours[c(2,5)]

#morecolours in 2 ve 5 arasi ?yeleri
more.colours[c(2:5)]


#bazi.cift te NA-bos var mi?
is.na(bazi.cift)



