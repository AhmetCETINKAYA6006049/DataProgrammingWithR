#VERÝ ODAKLI PROGRAMLAMA
#GÖZDE ÖZARPACI


#TANIM

#Lubridate, zamandaki anlar olarak bilirnir
#Tarih-saatler ve zaman aralýklarýyla çalýþma iþlevleri: tarih-saat verilerinin hýzlý ve kullanýcý 
#dostu ayrýþtýrýlmasý, bir tarih-saatin bileþenlerinin çýkarýlmasý 
#ve güncellenmesi (yýllar, aylar, günler, saatler, dakikalar ve saniyeler),
#cebirsel iþlem tarih-saat ve zaman aralýðý nesnelerinde. "Lubridate" paketi,
#tarihlerle çalýþmayý kolay ve eðlenceli hale getiren tutarlý ve akýlda kalýcý bir sözdizimine sahiptir. 
#Apache 2.0 Lisansý altýnda yayýnlanan 'CCTZ' kaynak kodunun bazý bölümleri bu pakete dahildir.



###################################################################################################
#######################################  lubridate  ###################################################
###################################################################################################


#Paket Kurulumu
install.packages("tidyverse") #lubridate kütüphanesi tidiyverse paketinin içinde mevcuttur alternatif olarak install edilebilir.
install.packages("lubridate")
library(lubridate)


Sys.Date()# günü tarihini verir.
Sys.time()#tarih ve zaman verir



#Sys.Date fonksiyonu ile gelen tarini formatý
today <- Sys.Date()
today
class(today) #Tarih formatýnda verir.

tarih <- '06/06/2016' #tarih deðiþkenine yazdýðýmýz tarih ise karakter þeklinde algýlanýr
class(tarih)  #karakter halinde verir.


#karakter tipinde ki tarihin formatý
format(today,format = "%d/%m/%Y")
g<-format(today,format= "%d/%m/%Y")
class(g)



#"as.Date" ile formatý date formatýna çevirir.
as.Date(tarih,format  ='%d/%m/%Y')
yeniTarih <- as.Date(tarih,format  ='%d/%m/%Y')
yeniTarih
class(yeniTarih) 

#"POSIXct" "POSIXlt"  fonksiyonlarý
#tarih vekötürünü eger yalnýz tarih ise as.Date() kullanýlýr.
#eðer tarih ve zaman olarak bir vektör tanýmlanacak ise 
#as.POSIXct() yada as.POSIXlt() fonksiyonlarý kullanýlýr.
#ikisinin arasýnda ki fark ise; POSIXct() tarihi hafýzada uniqs formatýnda olarak tutuyor.
#as.POSIXlt() gün-ay-yýl olarak tutar,orjin noktalarý aylar için orjin :0 yýl için 1990
#çýkan sonuçlar için +1990 aylar içinde +1 olarak yorumlanýr.

t <- '12/12/1920 18:30:23'
t
class(t)
tP <- as.POSIXlt(t,format='%d/%m/%Y %H:%M:%S', tz="UTC")
class(tP) #R da tanýmlý tarih fortmatýna cevirir

tP
t
#ikisi ayný sonucu verecek ancak formatlarý farklý olacktýr.



#yanlýþ formatý verirsek
yeniTarih2<-'23-05-2020'
class(yeniTarih2)
as.Date(yeniTarih2) #yýl-ay-gün olarak yazmaya çalýþýr ve yanlýþ yazar
as.Date(yeniTarih2,format  ='%d-%m-%Y')#istediðimiz formatta istiyorsak belirtilmesi gerek
as.Date(yeniTarih2,format  ='%d-%m-%y')#hangi formatta istiyorsak belirtilmesi gerek küçük "y" ile çaðýrýyorsak iki basamak yazdýrýr.



#Kolay ve tarih-zaman hýzlý ayrýþtýrma: ymd(), ymd_hms, dmy(), dmy_hms, mdy(),
#"2010-12-15" yýl-ay-gün olarak yazýlmasýný saðlar
ymd(20101215)
mdy("4/30/17")



#Atanan Tarihin hangi gün olduðunu verir
bday <- dmy("02/10/1992")
wday(bday, label = TRUE)


#Farklý Bir Saat Dilimindeki Tarih-Saati Alýnmasý
#evrensel zaman dilimi olan "UTC" olarak zaman dilimini getirir,
time <- ymd_hms("2010-12-13 15:30:30")
time


# GMT(Greenwich Ortalama Zamaný), Britanya Adalarý'nýn standart zaman dilimidir.
#tzone: gösterilecek zman dilimi seçimini saðlar

x <- ymd_hms("2021-01-17 14:00:01", tz = "America/New_York")
with_tz(x, "GMT")



#X'in öðleden önce veya öðleden sonra oluþmasýna baðlý olarak DOÐRU veya YANLIÞ deðerini döndürür
x <- ymd_hms("2010-12-13 10:30:30")
am(x)
pm(x)



#tarihin yada saatin güncellenmesi 

date <- ymd("2009-02-10")
update(date, year = 2010, month = 1, mday = 1)
update(date,hour=5, minute = 10, second = 3) 



# Tarih formatýnda ise true deðilse ise false döner {
Tarih <- is.Date(as.Date("2009-08-03")) # TRUE
Tarih
Tarih2 <- is.Date(difftime(now() + 5, now())) 
Tarih2
class(Tarih2)
# }




# difftime 2 farklý tarihin zaman farkýný hesaplar. {

time_1 <-  "2021-01-12"           
time_2 <-  "2019-05-10"               

#zaman farkýný mins(dk) cinsinden olrak hesaplar
difftime(time_1, time_2, units = "mins") 


#zaman farkýný saat cinsinde  hesaplar
difftime(time_1, time_2, units = "hours") 

#zaman farkýný gün cinsinde  hesaplar
difftime(time_1, time_2, units = "days")


#zaman farkýný hafta cinsinde  hesaplar
difftime(time_1, time_2, units = "weeks")


#zaman farkýný month cinsinde  hesaplamaz cünkü "difftime fonksiyonu içinde ay hesabý yoktur."
difftime(time_1, time_2, units = "months") 

# }



##tarih ve zaman deðiþkenini ayrýma iþlemi
##tarih vektörü seq fonksiyonu ile oluþturalým; 
#seq fonksiyonu=  belirli bir tarihten belirli bir tarihe kadar olan tarihleri yazmak için kullanýlýr
#from parametresi nerden baþayacak
#to parametresi nereye kadar gideceði 
#by parametresi ise sýralmasý tarihe yada zamana göre sýralar.

d <- seq(from =strptime('2012-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2012-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')
d
class(d)
View(d)

#tarih deðiþkenin formatýný belirliyoruz
tarih <- format (d, format = '%Y-%m-%d')
tarih
class(tarih)

#zaman deðiþkenin formatýný belirliyoruz
zaman <- format(d,format='%H:%M:%S')
zaman
class(zaman)

#tarih ve zaman deðiþkenlerini iki ayrý deðiþkene ayrý formata ile  data frame atadýk
df <- data.frame('Tarih' = tarih,'Zaman'=zaman)
View(df)
class(df$Tarih)


#tarih vektörlerinin sýralanmasý
x<- c(3,5,7,8,9)
sort(x) #defaultta küçükten büyüðe sýralar
sort(x,decreasing = T) #Büyükten küçüðe sýralar

d <- seq(from =strptime('2021-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2021-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')

View(d) 

View(sample(d)) #Tarih vektörlerini daðýttý, karmaaþýk hale getirdik.

View(sort(d,decreasing = T)) #Büyükten küçüðe sýrala
View(sort(d,decreasing = F))  #küçükten büyüðe sýrala


#iki tarih arasýnda kalan tarihlerin elde edilmesi
d <- seq(from =strptime('2021-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2021-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')

d 
View(d > '2021-01-08')
View(d[d > '2021-01-08']) #8 ocakdan büyük olan tarihleri getirir.
View (d > '2021-01-08' & d <'2021-01-17') # 8 ve 17 arasýndaki tarihleri getiri.
View(d[d > '2021-01-08' & d < '2021-01-17'])

#weekdays() ve months() fonksiyonlarý
d <- '2021/01/01'
d
#tarihimi, date formatýna ceviriyorum
y <- format (d, format = '%Y/%m/%d')
#hangi gün olduðunu buluyorum
weekdays(y)
#hangi ay olduðunu buluyorum
months(y)

#>10.aY --> ay bilgisini veriri
bday <- dmy("11/12/2021")
month(bday)



#sistem dili ve karakter tarih formatýný yýl ay gün olarak yazdýrma 
x2 <- '1 Eylül 2019'
as.Date(x2 , format="%d %B %Y") 
#%B ayý karakter olarak yazýlmasýný saðlar.
#null dönmez çünkü sistem türkçe olarak calýþýyor eylülü ceviridði için istenilen formatta yazdýrdý.

x3 <- '1 September 2019'
as.Date(x3 , format="%d %B %Y")
#null döner çünkü sistem türkçe olarak calýþýyor, eylülü çevirmedeði için null döndü.


#sistem dilini cevirmek için;
sessionInfo()
Sys.setlocale('LC_TIME', 'en_US.UTF-8')

#sistem dilini TR cevirmek için;
sessionInfo()
Sys.setlocale('LC_TIME', 'tr_TR.UTF-8')





