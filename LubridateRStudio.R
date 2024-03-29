#VER� ODAKLI PROGRAMLAMA
#G�ZDE �ZARPACI


#TANIM

#Lubridate, zamandaki anlar olarak bilirnir
#Tarih-saatler ve zaman aral�klar�yla �al��ma i�levleri: tarih-saat verilerinin h�zl� ve kullan�c� 
#dostu ayr��t�r�lmas�, bir tarih-saatin bile�enlerinin ��kar�lmas� 
#ve g�ncellenmesi (y�llar, aylar, g�nler, saatler, dakikalar ve saniyeler),
#cebirsel i�lem tarih-saat ve zaman aral��� nesnelerinde. "Lubridate" paketi,
#tarihlerle �al��may� kolay ve e�lenceli hale getiren tutarl� ve ak�lda kal�c� bir s�zdizimine sahiptir. 
#Apache 2.0 Lisans� alt�nda yay�nlanan 'CCTZ' kaynak kodunun baz� b�l�mleri bu pakete dahildir.



###################################################################################################
#######################################  lubridate  ###################################################
###################################################################################################


#Paket Kurulumu
install.packages("tidyverse") #lubridate k�t�phanesi tidiyverse paketinin i�inde mevcuttur alternatif olarak install edilebilir.
install.packages("lubridate")
library(lubridate)


Sys.Date()# g�n� tarihini verir.
Sys.time()#tarih ve zaman verir



#Sys.Date fonksiyonu ile gelen tarini format�
today <- Sys.Date()
today
class(today) #Tarih format�nda verir.

tarih <- '06/06/2016' #tarih de�i�kenine yazd���m�z tarih ise karakter �eklinde alg�lan�r
class(tarih)  #karakter halinde verir.


#karakter tipinde ki tarihin format�
format(today,format = "%d/%m/%Y")
g<-format(today,format= "%d/%m/%Y")
class(g)



#"as.Date" ile format� date format�na �evirir.
as.Date(tarih,format  ='%d/%m/%Y')
yeniTarih <- as.Date(tarih,format  ='%d/%m/%Y')
yeniTarih
class(yeniTarih) 

#"POSIXct" "POSIXlt"  fonksiyonlar�
#tarih vek�t�r�n� eger yaln�z tarih ise as.Date() kullan�l�r.
#e�er tarih ve zaman olarak bir vekt�r tan�mlanacak ise 
#as.POSIXct() yada as.POSIXlt() fonksiyonlar� kullan�l�r.
#ikisinin aras�nda ki fark ise; POSIXct() tarihi haf�zada uniqs format�nda olarak tutuyor.
#as.POSIXlt() g�n-ay-y�l olarak tutar,orjin noktalar� aylar i�in orjin :0 y�l i�in 1990
#��kan sonu�lar i�in +1990 aylar i�inde +1 olarak yorumlan�r.

t <- '12/12/1920 18:30:23'
t
class(t)
tP <- as.POSIXlt(t,format='%d/%m/%Y %H:%M:%S', tz="UTC")
class(tP) #R da tan�ml� tarih fortmat�na cevirir

tP
t
#ikisi ayn� sonucu verecek ancak formatlar� farkl� olackt�r.



#yanl�� format� verirsek
yeniTarih2<-'23-05-2020'
class(yeniTarih2)
as.Date(yeniTarih2) #y�l-ay-g�n olarak yazmaya �al���r ve yanl�� yazar
as.Date(yeniTarih2,format  ='%d-%m-%Y')#istedi�imiz formatta istiyorsak belirtilmesi gerek
as.Date(yeniTarih2,format  ='%d-%m-%y')#hangi formatta istiyorsak belirtilmesi gerek k���k "y" ile �a��r�yorsak iki basamak yazd�r�r.



#Kolay ve tarih-zaman h�zl� ayr��t�rma: ymd(), ymd_hms, dmy(), dmy_hms, mdy(),
#"2010-12-15" y�l-ay-g�n olarak yaz�lmas�n� sa�lar
ymd(20101215)
mdy("4/30/17")



#Atanan Tarihin hangi g�n oldu�unu verir
bday <- dmy("02/10/1992")
wday(bday, label = TRUE)


#Farkl� Bir Saat Dilimindeki Tarih-Saati Al�nmas�
#evrensel zaman dilimi olan "UTC" olarak zaman dilimini getirir,
time <- ymd_hms("2010-12-13 15:30:30")
time


# GMT(Greenwich Ortalama Zaman�), Britanya Adalar�'n�n standart zaman dilimidir.
#tzone: g�sterilecek zman dilimi se�imini sa�lar

x <- ymd_hms("2021-01-17 14:00:01", tz = "America/New_York")
with_tz(x, "GMT")



#X'in ��leden �nce veya ��leden sonra olu�mas�na ba�l� olarak DO�RU veya YANLI� de�erini d�nd�r�r
x <- ymd_hms("2010-12-13 10:30:30")
am(x)
pm(x)



#tarihin yada saatin g�ncellenmesi 

date <- ymd("2009-02-10")
update(date, year = 2010, month = 1, mday = 1)
update(date,hour=5, minute = 10, second = 3) 



# Tarih format�nda ise true de�ilse ise false d�ner {
Tarih <- is.Date(as.Date("2009-08-03")) # TRUE
Tarih
Tarih2 <- is.Date(difftime(now() + 5, now())) 
Tarih2
class(Tarih2)
# }




# difftime 2 farkl� tarihin zaman fark�n� hesaplar. {

time_1 <-  "2021-01-12"           
time_2 <-  "2019-05-10"               

#zaman fark�n� mins(dk) cinsinden olrak hesaplar
difftime(time_1, time_2, units = "mins") 


#zaman fark�n� saat cinsinde  hesaplar
difftime(time_1, time_2, units = "hours") 

#zaman fark�n� g�n cinsinde  hesaplar
difftime(time_1, time_2, units = "days")


#zaman fark�n� hafta cinsinde  hesaplar
difftime(time_1, time_2, units = "weeks")


#zaman fark�n� month cinsinde  hesaplamaz c�nk� "difftime fonksiyonu i�inde ay hesab� yoktur."
difftime(time_1, time_2, units = "months") 

# }



##tarih ve zaman de�i�kenini ayr�ma i�lemi
##tarih vekt�r� seq fonksiyonu ile olu�tural�m; 
#seq fonksiyonu=  belirli bir tarihten belirli bir tarihe kadar olan tarihleri yazmak i�in kullan�l�r
#from parametresi nerden ba�ayacak
#to parametresi nereye kadar gidece�i 
#by parametresi ise s�ralmas� tarihe yada zamana g�re s�ralar.

d <- seq(from =strptime('2012-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2012-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')
d
class(d)
View(d)

#tarih de�i�kenin format�n� belirliyoruz
tarih <- format (d, format = '%Y-%m-%d')
tarih
class(tarih)

#zaman de�i�kenin format�n� belirliyoruz
zaman <- format(d,format='%H:%M:%S')
zaman
class(zaman)

#tarih ve zaman de�i�kenlerini iki ayr� de�i�kene ayr� formata ile  data frame atad�k
df <- data.frame('Tarih' = tarih,'Zaman'=zaman)
View(df)
class(df$Tarih)


#tarih vekt�rlerinin s�ralanmas�
x<- c(3,5,7,8,9)
sort(x) #defaultta k���kten b�y��e s�ralar
sort(x,decreasing = T) #B�y�kten k����e s�ralar

d <- seq(from =strptime('2021-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2021-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')

View(d) 

View(sample(d)) #Tarih vekt�rlerini da��tt�, karmaa��k hale getirdik.

View(sort(d,decreasing = T)) #B�y�kten k����e s�rala
View(sort(d,decreasing = F))  #k���kten b�y��e s�rala


#iki tarih aras�nda kalan tarihlerin elde edilmesi
d <- seq(from =strptime('2021-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to   =strptime('2021-01-30 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         by ='day')

d 
View(d > '2021-01-08')
View(d[d > '2021-01-08']) #8 ocakdan b�y�k olan tarihleri getirir.
View (d > '2021-01-08' & d <'2021-01-17') # 8 ve 17 aras�ndaki tarihleri getiri.
View(d[d > '2021-01-08' & d < '2021-01-17'])

#weekdays() ve months() fonksiyonlar�
d <- '2021/01/01'
d
#tarihimi, date format�na ceviriyorum
y <- format (d, format = '%Y/%m/%d')
#hangi g�n oldu�unu buluyorum
weekdays(y)
#hangi ay oldu�unu buluyorum
months(y)

#>10.aY --> ay bilgisini veriri
bday <- dmy("11/12/2021")
month(bday)



#sistem dili ve karakter tarih format�n� y�l ay g�n olarak yazd�rma 
x2 <- '1 Eyl�l 2019'
as.Date(x2 , format="%d %B %Y") 
#%B ay� karakter olarak yaz�lmas�n� sa�lar.
#null d�nmez ��nk� sistem t�rk�e olarak cal���yor eyl�l� cevirid�i i�in istenilen formatta yazd�rd�.

x3 <- '1 September 2019'
as.Date(x3 , format="%d %B %Y")
#null d�ner ��nk� sistem t�rk�e olarak cal���yor, eyl�l� �evirmede�i i�in null d�nd�.


#sistem dilini cevirmek i�in;
sessionInfo()
Sys.setlocale('LC_TIME', 'en_US.UTF-8')

#sistem dilini TR cevirmek i�in;
sessionInfo()
Sys.setlocale('LC_TIME', 'tr_TR.UTF-8')





