#*********************************Gamze Ödev************************************
data()
#aktif olmayan verisetlerini görmek için daha fazla veriseti 
data(package = .packages(all.available = TRUE))
#gglot2 kütüphanesini çaðýrdýk
library(ggplot2)
#diamonds verisetini yükledik
data("diamonds")
#dataframe olarak gözlemliyoruz
df <- diamonds
#aes deðiþkenlerin ifade edildiði kýsým,geom_bar ,ise kat.deð.görsel. kýsým

#barplot sütun grafiði kategorik deðiþkenler için kullanýlýr
ggplot(df, aes(cut)) + geom_bar()
#iki tane kat.deðiþkeni görselleþtirmek istediðimizde(cut-color)
#içiçe sýnýflandýrmak istediðimizde 
#position argümaný ile anlaþýlýr görsel
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge())
#grafiðe baþlýk oluþturmak için fonksiyon ;
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge()) + ggtitle("sütun grafik ile görsel")
#satýr ve sütun isimlerini deðiþtirmek için fonksiyon ;
ggplot(df, aes(cut,fill = color)) + geom_bar(position = position_dodge()) + ggtitle("sütun grafik ile görsel") +
  xlab("pýrlanta kalitesi") + ylab("görülme sýklýklarý")

#histogram ve yoðunluk grafikleri sürekli deðiþkenler için kullanýlýr
#sütunlarýn aralýklarý için binwidth)
ggplot(df,aes(price)) + geom_histogram(binwidth = 1000)
#yoðunluk grafiði görmek için;
ggplot(df,aes(price)) + geom_density()
#yoðunluk ve histogram ayný anda görselleþtirmek için ;(ölçeklerinin ayný olmasý gerekmektedir)
ggplot(df,aes(price)) + geom_histogram(aes(y = ..density..)) + geom_density()
#bir kategorik ve bir sürekli deðiþken ile sürekli deðiþken kýrýlýmýnda histogram görselleþtirelim;
ggplot(df,aes(price, fill = cut)) + geom_histogram()
#üstüste histogram çok anlaþýlýr deðil face_grid fonksiyonu ile parçalamýþ olduk
ggplot(df,aes(price)) + geom_histogram() + facet_grid(cut ~. )





#*********************************Murat Caniklioðlu*****************************

# 6 ülkenin (Türkiye, Canada, Brezilya, Mýsýr, Ýsveç ve Hindistan) 
# Freedom House Dünya Özgürlükler Raporu verilerini içeri aktaralým. 

#install.packages("dplyr")

#install.packages("ggplot2")

install.packages("gapminder")

library(dplyr) #veriyi manipüle ederken kullanacaðýz

library(ggplot2) #veri görselleþtirme de kullanacaðýmýz paket

library(gapminder) #Gapminder verilerinin bulunduðu veri paketi

colnames(gapminder) = c("ulke","kita","yil","yasam_suresi","nufus","kisi_basi_milli_gelir")

View(gapminder)

# ggplot(veriseti, aes(x, y))+geom_col() › Çubuk veya Sütun grafik için

# ggplot(veriseti, aes(x, y))+geom_line() veya geom_area() › Çizgi veya Alan grafik için

# ggplot(veriseti, aes(x, y))+geom_point() › Daðýlým grafiði (scatter plot) için

ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+geom_col() #geom_col() › Çubuk veya Sütun grafik için

# x eksenine (yatay eksen) yýl deðiþkenini, y eksenine yaþam süresini ekledik. 
# Grafiðe renk eklemek için fill argümanýný kýtaya eþitledik.

# yaþam süresi deðerlerini yýðýlý olarak topladý ve görselleþtirdi. 
# Bizim istediðimiz kýtalarýn yaþam sürelerini birbirleriyle ayrý ayrý görselleþtirmek ve karþýlaþtýrmaktý.
# bunu düzeltmek için 

ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+geom_col(position = "dodge")


# çizgi grafiði için farklý bir data yükledik


dosya = 'c:/free.csv'
freedom <- read.csv(dosya)
freedom

ggplot(freedom, aes(yýl, puan, color = ülke))+
  geom_line(size = 1.5)


#   <DAÐILIM GRAFÝÐÝ>  #  <SCATTERPLOT> 

# Saçýlým Grafiði iki deðiþken arasýndaki iliþkiyi göstermek için kullanýlýr.

# Yapacaðýmýz çalýþmada 2007 yýlýnda yaþam süresi ile kiþi baþýna düþen milli gelir arasýndaki 
# iliþkiyi kýtalara göre görselleþtirmek
# Ama bunun öncesinde elimizdeki veriyi 2007 yýlý kalacak þekilde filtreleyelim.


gapminder_2007 <-filter(gapminder, yil == 2007) 


# daðýlým grafiðinde goem_point() fonksiyonu ve renk için color argümaný kullanýyoruz.
ggplot(gapminder_2007,aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+geom_point()


# Yine daha iyi bir görsel için veri noktalarýnýn büyüklüðünü arttýralým ve þeffaflýk deðerini ayarlayalým. 
# Noktalarýn büyüklüðünü size, þeffaflýðý ise alpha argümanlarý ile ayarlayacaðýz.

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+geom_point(size = 4, alpha = 0.7)

# Grafiðin Geliþtirlmesi

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="yaþam süresi",
       y ="kiþi baþýna düþen milli gelir",
       title = "5 Kýtada Yaþam Süresi ve Kiþi Baþýna Düþen Milli Gelir Ýliþkisi",
       subtitle = "Veri Kaynaðý: Gapminder, 2007", 
       caption = "Paket : GGPLOT2")


# Renk Seçimi
# link = https://colorbrewer2.org/#type=qualitative&scheme=Set1&n=5

# renk artýk bir deðer olarak yer alýyor. Renkleri grafiðe yansýtmak için +scale_color_manuel () fonksiyonu kullanacaðýz.
# Eðer Çubuk grafikte bunu yapýyor olsaydýk scale_fill_manuel() kullanacaktýk.

renk <- c("#e41a1c","#377eb8","#4daf4a","#984ea3","#ff7f00")

ggplot(gapminder_2007, aes(yasam_suresi,kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="yaþam süresi",
       y ="kiþi baþýna düþen milli gelir",
       title = "5 Kýtada Yaþam Süresi ve Kiþi Baþýna Düþen Milli Gelir Ýliþkisi",
       subtitle = "Veri Kaynaðý: Gapminder, 2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)

# Facets ile birden fazla grafik oluþturalým

# Ggplot2’daki facets özelliði ile bir deðiþkeni referans alarak tek seferde birden fazla grafik oluþturabiliriz. 
# Facets özelliði sayesinde veri setini filtrelememize veya karmaþýk bir þekilde görselleþtirmemize gerek kalmayacak. 
# Bunu asýl koda iliþtireceðimiz facet_wrap() fonksiyonuyla yapacaðýz.


ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+  geom_col(position = "dodge")+
  labs(x ="yil",y="yasam süresi",
       title ="Son 50 yýlda 5 kýtada yaþam süresinin deðiþimi", 
       subtitle = "Gapminder, 1952 -2007", 
       caption = "Paket : GGPLOT2")+
  scale_fill_manual(values = renk)+
  
  facet_wrap(~kita, ncol =5) 


# Kýta 5 ayrý deðiþkenden oluþtuðu için 5 ayrý grafik elde ettik. 
# ncol argümaný ise görselin yan yana 5 ayrý grafik olmasýný saðladý. 
# Dilersek 3 üstte ve 2 altta bir grafik de elde edebilirdik. 


ggplot(gapminder, aes(yil, yasam_suresi, fill = kita))+  geom_col(position = "dodge")+
  labs(x ="yil",y="yasam süresi",
       title ="Son 50 yýlda 5 kýtada yaþam süresinin deðiþimi", 
       subtitle = "Gapminder, 1952 -2007", 
       caption = "Paket : GGPLOT2")+
  scale_fill_manual(values = renk)+
  
  facet_wrap(~kita, ncol =5) + facet_wrap(~kita, ncol = 3)


# daðýlým grafiðini 2007 yýlýna göre filtrelemiþtik
# bunun yerine facet özelliði sayesinde her yýlý ayrý görselleþtirelim.

ggplot(gapminder, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="yaþam süresi",
       y ="kiþi baþýna düþen milli gelir",
       title = "5 Kýtada Yaþam Süresi ve Kiþi Baþýna Düþen Milli Gelir Ýliþkisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)+
  facet_wrap(~yil, ncol = 6)
# Son 50 yýlda hem milli gelir hem de yaþam süresi tüm kýtalarda artmýþ. 
# Kýtalara bakalým:

ggplot(gapminder, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+  geom_point(size = 4, alpha = 0.7) +
  labs(x="yaþam süresi",
       y ="kiþi baþýna düþen milli gelir",
       title = "5 Kýtada Yaþam Süresi ve Kiþi Baþýna Düþen Milli Gelir Ýliþkisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+
  scale_color_manual(values = renk)+
  facet_wrap(~yil, ncol = 6)+facet_wrap(~kita, ncol = 3)

# Grafiðin temasýný deðiþtirelim

# grafiðin arka planý, görselde kullanýlan font tipi, 
# font büyüklüðü gibi bir çok ögeyi de ggplot2 paketinde belirleyebiliyoruz.
# bu grafik için theme_minimal() tercih ettik.

# Her seferinde tekrar uðraþmamak adýna þu ana kadarki kodu dagýlým_grafigi olarak tanýmlayalým.

dagilim_grafigi <- ggplot(gapminder_2007, aes(yasam_suresi, kisi_basi_milli_gelir, color = kita))+geom_point(size = 4, alpha = 0.7) +
  labs(x="yaþam süresi",
       y ="kiþi baþýna düþen milli gelir",
       title = "5 Kýtada Yaþam Süresi ve Kiþi Baþýna Düþen Milli Gelir Ýliþkisi",
       subtitle = "Gapminder, 1952-2007", 
       caption = "Paket : GGPLOT2")+  scale_color_manual(values = renk)

dagilim_grafigi+theme_minimal()

# temayý deðiþtirmek istersek

theme_custom <- function() {
  theme_minimal() +
    theme(
      text = element_text(family = "Roboto", color = "gray25"),
      plot.title = element_text(face = "bold"),
      plot.subtitle = element_text(size = 11),
      plot.caption = element_text(color = "gray30"),
      plot.background = element_rect(fill = "gray95"),
      legend.position = "bottom",
      legend.title = element_blank()
    )
}

# son hali

dagilim_grafigi + theme_custom()



#-----------------------------------------------------------------------------#

# BOXPLOT  #

# 1  DEÐÝÞKENLER ÜZERÝNDEN OLUÞTURULAN BOXPLOT GRAFÝÐÝ


# Datasetimiz R içinde bulunan "mtcars"
# Kullanacak olduðumuz deðiþkenler "drat" "Arka aks Oraný" - "wt" Aðýrlýk (1000 lbs(pound)) -> 1 lb 0.45 kg
library(ggplot2)
library(dplyr)
#library(caret)
View (mtcars)


# bu iki deðiþkenin boxplot grafiðini çizelim
# iki tür boxplot kullanýmý var biri deðiþkenler üzerinden diðeri ise formüller ile 
# biz þuan deðiþkenler üzerinden boxplot u kullanacaðýz.
# boxplot yazdýktan sonra mtcars içindeki drat ve wt deðiþkenlerini yazmamýz gerekiyor. bunu seçmek için [] kullanýlýr.

boxplot(mtcars[,c("drat" , "wt")])

# çalýþtýrýnca x eksenin de drat ve wt deðiþkeni görülür. 
# y ekseninde ise x eksenin de yer alan deðiþkenlere ait deðerler vardýr.


boxplot(mtcars[,c("drat" , "wt" , "qsec")]) # deðiþken deðerleri birbirine uzak olursa grafiðin okunmasý zorlaþýr bu
# bu nedenle deðiþkenleri buna uygunda seçebiliriz. yada standartlaþtýrma iþlemi yapýlabilir.
# y eksinindeki deðerin artmasýný istemiyorsak
boxplot(mtcars[,c("drat" , "wt")])

# Boxplot un Geliþtirilmesi 


# kolon isimlerini deðistirmek için names fonksiyonunu kullanýyoruz.
# baþka fonksiyonlarda bu deðiþebilir.
# bir önceki örnekte iris için scatterplot u kullanýrken kolon isimlerini deðiþtirmek için
# colnames(iris)=c("Taç_yapraðý_Boyu","Taç_yapraðý_Eni","çanak_yapraðý_boyu","çanak_yapraðý_Eni","türü")

boxplot(mtcars[,c("drat" , "wt")],
        names = c("DRAT Deðiþkeni" , "WT Deðiþkeni")) 

# bu bir vektör olacak ve ilk eleman drat ikinci eleman wt yi temsil edecek

# Grafiðin Rengini deðiþtirmek için col fonksiyonunu kullanýyoruz.

boxplot(mtcars[,c("drat" , "wt")],
        names = c("DRAT Deðiþkeni" , "WT Deðiþkeni"),
        col = "orange" ) 

# grafikteki her deðiþkene farklý renk vermek istiyorsak
# deðiþkenleri vektör içerisinde yazacaðýz

boxplot(mtcars[,c("drat" , "wt")],
        #  baþlýk girmek için main
        main = "BOXPLOT Grafiði" , 
        # x ve y eksen isimleri 
        xlab="Degiskenler", ylab="Degerler", 
        # deðiþken isimlerini deðiþtirmek için kullanýyoruz
        names = c("DRAT Deðiþkeni" , "WT Deðiþkeni"), 
        # deðiþkenlere ait olan box larýn renklendirmesi için kullanýyoruz.
        col = c("orange" ,"green"),
        # çizgileri renklendirmek için border
        border =c("blue" , "black"),
        
        pch = 19 # noktalarýn içini doldurmak için 19 biçimi deðiþtirmek için farklý deðerler kullanýlabilir.
) 


# boxplot grafiklerinin yorumlanmasý

# baþka bir durumdan daha söz etmek gerekirse
# max deðerlerin üzerinde kalan "Outliers" min ve max range in dýþýnda kalan deðerler
# grafiðe göre iki tane aykýrý deðerimiz olduðunu söyleyebiliriz.


boxplot(mtcars[,c("drat" , "wt")],
        main = "BOXPLOT Grafiði" ,  
        xlab="Number of Cylinders", 
        ylab="Miles Per Gallon" ,
        names = c("DRAT Deðiþkeni" , "WT Deðiþkeni"), 
        col = c("orange" ,"green"),
        border =c("blue" , "black"),
        # range =  0,5,
        outline = FALSE # aykýrý deðerleri görmek istemezsek outline deðerini kapatabilir yada range i deðiþtirebiliriz.
)

# boxplot grafikleri minimum ve maximum deðerleri gösterir 
# ayný zamanda 1. çeyrek 3. çeyrek ve medyaný (Ortanca) gösterir.
# box ýn altýndaki çizgi 1. çeyrek üstündeki çizgi 3. çeyrek ortadaki kalýn çizgi ise medyan(ortanca) dýr.
# medyan (Ortanca) = 1, 1, 2, 2, "3", 4, 5, 5, 5 serisi medyaný 5. eleman 3 sayýsýdýr.


# 2  FORMÜLLER ÜZERÝNDEN OLUÞTURULAN BOXPLOT GRAFÝÐÝ

# formül oluþturmak için ~ yaklaþýk sembolünü kullanýyoruz.
# gear (vites) - baðýmsýz deðiþkenimiz olsun
# mpg deðerlerimizde baðýmlý deðiþkenimiz olsun
# görmek istediðimiz boxplotu kullanarak gear deðiþkeninin mpg deðiþkenine etkisini göstermek.


# baðýmsýz deðiþken olan cyl i sað tarafa yani x eksenine yazacaðýz

# baðýmlý deðiþken olan mpg i sol tarafa yani y eksenine yazacaðýz


boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        xlab="Number of Cylinders", ylab="Miles Per Gallon",
        col = "orange",
        border ="blue")

# diðer iþlemleri yukarda yaptýðýmýz gibi deðiþtirerek grafiði geliþtirebiliriz.









#*********************************Muhammet Sait DELEN***************************

#GEOM_POINT FONKSiyonu

#Kütüpphanemizi import ediyoruz.

library(ggplot2)
#data <- read.csv("/Users/admin/Desktop/telco-dataeng2.csv")

#R içerisinde hazýr olarak yüklü olan paketimizi import ediyoruz.
data(mtcars)

#Noktalarýn renklerini color komutuyla ayarlayabiliriz.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#Alfabetik sýraya göre sýraralama iþlemi yapabiliriz.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#Kategorik verilerde kullanýlmakla birlikte noktalarý þeffaflaþtýrmaya yarar. 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#Noktalarýn boyutlarýný ve þekillerini deðiþtirebiliyoruz. (Ex:17 üçgen)

ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

#Noktalarýn boyutlarýný görebiliyoruz.
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(aes(size=qsec))

#Noktalarý zenginleþtirip kenar boyutlarý ekliyoruz.
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() + geom_rug()

# 2 boyutlu yoðunluk haritasý çýkarabiliriz.

sp <- ggplot(faithful, aes(x=eruptions, y=waiting)) +
  geom_point()
sp + geom_density_2d()

# Noktalarýmýzý bir daire etrafýna alabiliriz. Bu daha derli toplu grafiði 
#okumamýza yardýmcý olur.

ggplot(faithful, aes(waiting, eruptions))+
  geom_point()+
  stat_ellipse()

#GEOM-LINE FONKSIYONU#

#Ýþe Kütüphanemizi import ederek baþlýyoruz.

library(ggplot2)

#Verimiz hayvanýn diþinin uzamasý için verilen C vitamini dozlarýný içeriyor.
#Datayý import ediyoruz.

df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))

#Standart temel bir çizgi grafiði çizelim.

ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line()+
  geom_point()

#Çizgimizin tipini deðiþtirebiliriz linetype komutuyla.

ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(linetype = "dashed")+
  
  
  #Grafikteki çizgimizin rengini deðiþtirebiliriz.
  
  ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(color="red")+
  geom_point()
geom_point()





#*********************************Ahmet Çetinkaya*******************************


# ggplot ile ýsý haritasý (heatmap) çizimi

library(ggplot2)
# melt()fonksiyonu için reshape2 kütüphanesini yükle
install.packages("reshape2")
library(reshape2)

data("mtcars")
View(mtcars)


# melt fonksiyonu degiþkenleri 2 sütuna ayýrýr deðiþken adý ve deðeri
araba_verisi <- melt(mtcars)
View(araba_verisi)

# tabloda degiþken olmayan araç adlarini sutun olarak ekle
# mtcars'ta toplam 32 araç için 11 degiþken sutunu deðeri vardýr 
araba_verisi$araba <-rep(row.names(mtcars),11)
View(araba_verisi)

# sütun adlarýný türkçeleþtir
colnames(araba_verisi) = c("ozellikler", "deger", "araba")
View(araba_verisi)

# ýsý haritasýnda düþük deðerler için mavi yüksek deðerler için kýrmýzý göster
dusukRenk = "white"
yuksekRenk = "darkred"


# ggplot() a veriyi yükle
ggplot(araba_verisi)

# heatmap çizimi eksenleri ve deðiþkenleri çiz
ggplot(araba_verisi, aes(x = ozellikler, y = araba))

# sonra geom_tile() ile ýsý haritasýný çiz geom_tile kareli grafik çizer
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) 

# düþük ve yüksek renkleri seçtiðimiz renklerimiz olarak deðiþtir
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk)

# her kutunun deðerini yaz
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) 

# grafiðin dýþ etiketlerini ekle
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalarýn Özellikleri", y = "Araba Modeli", 
       title = "mtcars Isý Haritasý",
       subtitle = "Örnek ýsý haritasý grafiðidir",
       caption = "Veri seti: mtcar")

# tema ekle etiketleri renklendir ve açýsýný degiþtir.
ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalarýn Özellikleri", y = "Araba Modeli", 
       title = "mtcars Isý Haritasý",
       subtitle = "Örnek ýsý haritasý grafiðidir",
       caption = "Veri seti: mtcar") +
  theme_light() +
  theme(
    plot.title = element_text(color = "red", face = "bold"),
    plot.subtitle = element_text(color = "blue"),
    plot.caption = element_text(color = "brown",  face = "italic")) + 
  theme(axis.text.x=element_text(angle=90)) 

# ggsave ile kaydet.
# formatlar: "png",eps", "ps", "tex" (pictex), "pdf", "jpeg", 
#           "tiff", "png", "bmp", "svg" or "wmf"

p_arabagrafigi <- ggplot(araba_verisi, aes(ozellikler, araba)) + 
  geom_tile(aes(fill = deger)) +
  scale_fill_continuous(low = dusukRenk, high = yuksekRenk) +
  geom_text(aes(label = deger)) +
  labs(x = "Arabalarýn Özellikleri", y = "Araba Modeli", 
       title = "mtcars Isý Haritasý",
       subtitle = "Örnek ýsý haritasý grafiðidir",
       caption = "Veri seti: mtcar") +
  theme_light() +
  theme(
    plot.title = element_text(color = "red", face = "bold"),
    plot.subtitle = element_text(color = "blue"),
    plot.caption = element_text(color = "brown",  face = "italic")) + 
  theme(axis.text.x=element_text(angle=90)) 
p_arabagrafigi

ggsave("p_arabagrafigi.png")
ggsave("p_arabagrafigi.pdf")
ggsave("p_arabagrafigi.jpg")




# CoordSf grubu geom_sf(), coord_sf() fonksiyonlarý ile harita çizimi

# OpenStreetMaps (OSM) https://www.openstreetmap.org/copyright
# Dünyadaki tüm þehirler için veri içerir
# Kullanýmý serbest ve açýk lisans altýnda olan bir dünya haritasýdýr
#
install.packages("osmdata")
install.packages("sf")
library(osmdata)
library(ggplot2)



# key value pair olarak tüm fiziksel nesneleri içerir.
# yollar, restoranlar, okullar, dükkanlar, nehirler, parklar,  
# trafik lambalarý, metro istasyonlarý..vs) içerir.

# var olan özellikleri göster.
View(available_features())

# var olan özellikler altýndaki gruplarý görmek için - örn: dükkanlar
# key - value
View(available_tags("shop"))


# getbb getboundingbox-> sehri seç x:boylam(longitude) y:enlem(latitude)
# [bbox:south,west,north,east]
izmir <- getbb("Izmir")
izmir

# izmirin uç koordinatlarýný adlandýr.
bati <- izmir[1,1]
dogu <- izmir[1,2]
guney <- izmir[2,1]
kuzey <- izmir[2,2]

# izmirdeki yerleri seçmek için https://rdrr.io/cran/osmdata/man/opq.html 
# Overpass API (OSM Server Side Scripting) openstreetmaps'in serverside API dir. 
# overpassquery opq() fonksiyonu ile istek clienta gönderilir.
# default response XML olup, json ve csv desteði vardýr.
sokaklar <- izmir %>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()

# sokak bilgilerini göster
sokaklar

# izmirdeki kuyumcularin noktalarýný belirle
kuyumcu <- izmir %>%
  opq()%>%
  add_osm_feature(key = "shop", 
                  value = c("jewelry")) %>%
  osmdata_sf()

kuyumcu

# izmirdeki metro istasyonlarýnýn noktalarýný belirle 
metro_istasyonlari <- izmir %>%
  opq()%>%
  add_osm_feature(key = "station", 
                  value = c("subway")) %>%
  osmdata_sf()
metro_istasyonlari

#izmirin sokaklarýný, kuyumcularýný ve metro istasyonlarýný haritada göster
#CoordSf grubu geom_sf(), coord_sf() ve statsf() fonksiyonlarý ile  basit noktalar, çizgiler, poligonlar çizilebilir.
#geom_sf'te inherit.aes = FALSE is defaultlarý uygulamaz. mesela ilsýnýrlarýný çizmez. alfa arttýkça koyuluk artar.


  #sokaklarý haritada göstermek için sokaklarýn line olan verisini kullan
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6)
#ve izmirin koordinatlarý için sokaklarý haritada göster
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = FALSE) 

#kuyumcularýn konumlarýný nokta(point) olarak al ve sokaklarla beraber göster
  
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    geom_sf(data = kuyumcu$osm_points,
            inherit.aes = FALSE,
            color = "blue",
            size = 1,
            alpha = .8) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = TRUE) 
  
  
#metro istasyonlarýný ekle
  ggplot() +
    geom_sf(data = sokaklar$osm_lines,
            inherit.aes = FALSE,
            color = "gray",
            size = .6,
            alpha = .6) +
    geom_sf(data = kuyumcu$osm_points,
            inherit.aes = FALSE,
            color = "blue",
            size = 1,
            alpha = .8) +
    geom_sf(data = metro_istasyonlari$osm_points,
            inherit.aes = FALSE,
            color = "red",
            size = 1.2,
            alpha = 1) +
    coord_sf(xlim = c(bati, dogu), 
             ylim = c(guney, kuzey),
             expand = FALSE) 
  

