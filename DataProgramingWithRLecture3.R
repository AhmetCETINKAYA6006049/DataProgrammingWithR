#matrisler
#önce sütunları doldurur col
m <- matrix(1:6, nrow = 3, ncol = 2)
m

m <- matrix(1:6, nrow = 2, ncol = 3)
m

#1. satır 2. sütun
m[1,2]

#1. satırın tüm değerleri
m[1,]

#2. satırın tüm değerleri
m[, 2]

x <- matrix(1:4, 2, 2)
x

y <- matrix(rep(10, 4), 2, 2)
y

x+y
y-x
x*y
y/x

#Data Frame
#her vektörü yeni bir sütuna oturttuğumuzdaki tablodur

colors <- c("red", "yellow", "blue")
numbers <- c(1, 2, 3)
colors.and.numbers <- data.frame(colors, numbers, more.numbers = c(4, 5, 6))
View(colors.and.numbers)

#data frame de yer alan sütun isimleri
names(colors.and.numbers)

#numbers sütununa ait değerler
colors.and.numbers$numbers

#yeni sütun ekle
colors.and.numbers$cars <- NULL
colors.and.numbers$cars <- c("bmw", "ford", "mazda")

titanic <- read.csv("train.csv")
View(titanic)

#dataFrame colon adları
colnames(titanic)

#2. sütun adını değiştir
colnames(titanic)[2] <- 'column-2'
colnames(titanic)

colnames(titanic)[2] <- 'survived'


#ilk 6 row u döner
head(titanic)

#satır sayısı
nrow(titanic)

#sütun sayısı
ncol(titanic)

#değişken tipi 
typeof(titanic$survived)

#sınıfını factöre çevir, kategorik
class(titanic$survived)
titanic[, 'survived'] <- factor(titanic[, 'Survived'])
class(titanic$survived)

titanic[, 'Pclass'] <- factor(titanic[, 'Pclass'])
titanic[, 'Sex'] <- factor(titanic[, 'Sex'])

#boş var mı NA 
colSums(is.na(titanic))  

#NA olan rowları silerek yeni DF oluştur
titanic2 <- na.omit(titanic)  
nrow(titanic2)
View(titanic2)

table(titanic$Sex)
table(titanic$survived)
table(titanic$Age)

#yaş aralığına böl tabloyu kaç kişi var göster
table(cut(titanic$Age, breaks = seq(0, 80, by=20)))

#belirli bir sütunun değerlerini bastır
print(titanic$Sex)

#dataframein boyutlar
dim(titanic)

#classları ve ilk değerlerini bastır
str(titanic)

# DF in istatistik verilerini verir
summary(titanic)

summary(titanic$Age)

















