titan <- read.csv("train.csv")
View(titan)

#ilgili sütundaki unique değerleri döner
unique(titan$Survived)

#titanicte yaşayanlar koşunlu
kosul <- titan$Survived == 1
titanSurvived <- titan[kosul, ]
View(titanSurvived)

#yaşamayanlar

titanNotSurvived <- titan[titan$Survived == 0, ]
View(titanNotSurvived)

#3.sınıftaki yolcuların hepsi
titanPC3 <- titan[titan$Pclass == 3, ]
View(titanPC3)

#1 ve 2.sınıftaki yolcuların hepsi
titanPC12 <- titan[titan$Pclass == 1 | titan$Pclass == 2, ]
View(titanPC12)


#2 değişik column seçmek için
titanPC2Survived <- titan[titan$Pclass == 2 & titan$Survived = 1]

#1. ve sınıf olup yaşayanlar
titanPC12Survived <- titan[(titan$Pclass == 1 | titan$Pclass == 2) & titan$Survived = 1]


#sıralama için
ordPc <- order(titan$Pclass)
View(titan[ordPc,])

ordAge <- order(titan$Age)
View(titan[ordAge,])

ordAgeDec <- order(titan$Age, decreasing = TRUE)
View(titan[ordAgeDec,])

View(titan$PassengerId[ordAge])


#-------------------------------------
train <- read.csv("train.csv")
View(train)
nrow(train)
ncol(train)

test <- read.csv("test.csv")
View(test)
nrow(test)
ncol(test)

colnames(train)

colnames(test)

#sütun sıralamasını değiştir
test['Survived'] <- NA
test <- test [c(1,12, 2:11)]
colnames(test)

# iki verisetini birleştir
full <- rbind(train, test)
nrow(full)

#tüm değişken tiplerini gör
str(full)

#değişkeni faktör yap
full$fPclass <- factor(full$Pclass)

#faktör değişkenlerdeki intleri string olarak yap
full$fPclass <- NULL
full$fPclass <- factor(full$Pclass, levels = c(1, 2, 3),
                       labels = c("A", "B", "C"))

boxplot( Fare ~ Pclass, data = full)


#------------------------------------------
#Rdaki tüm veriseti paketleri göster
data()

data(package =  .packages(all.available =  TRUE))

install.packages('ISLR')
library(ISLR)

View(Auto)

plot(araba$horsepower, araba$mpg,
    main ="beygir gücüne göre yakıt tüketimi",
    ylab = "1 galon ile gidilen yol (mil)",
    xlab = "beygir gücü",
    pch = 20, col = c("red"))


hist(araba$year,
      main = "Araba Satışı",
      ylab = "miktar",
      xlab = "yıl",
      col = "red", border ="black")


