###################################################################################################
# Ders: Veri Odaklı Programlama
# Konu: Dönem Ödevi Sunumu (dplyr ve stringr)
# Öğrn: Berna Çakır, Hasan Perçin, Turgay Kibar
###################################################################################################
#
#
#
###################################################################################################
#######################################  dplyr  ###################################################
###################################################################################################
#
#
#
#--------------------------------------------------------------------------------------------------
################################ BERNA ÇAKIR ######################################################
#--------------------------------------------------------------------------------------------------
#
# dplyr Kütüphanesi
#
# dplyr yapılandırılmamış verileri işlemek, temizlemek, dönüştürmek ve özetlemek için güçlü bir R paketidir.
#
# R'daki en güçlü ve popüler paketlerden biridir, veri keşfini ve veri manipülasyonunu kolay ve hızlı hale getirir.
#
# Ggplot2, tidyr vb. birçok yararlı R paketi yazan R programcısı Hadley Wickham tarafından yazılmıştır.
#
# En önemli avantajlarından biri işlevlerini öğrenmenin ve kullanmanın çok kolay olmasıdır. 
# Bu işlevleri geri çağırmak da kolaydır.
#
# Dplyr işlevleri temel R işlevlerinden daha hızlı veriyi işler. 
# Bunun nedeni dplyr işlevlerinin hesaplama açısından verimli bir şekilde yazılmış olmasıdır.
#
# Ayrıca söz diziliminde daha kararlıdır ve dataframe’leri vektörlerden daha iyi destekler.
#
#
# Dplyr paketini (library) 5 ana fiilden oluşmaktadır. Bu fiiller;
#
# 1 - Filter Fiili ile dataset içerisindeki belirli kriterlere göre filtreleme yapılmaktadır.
# 2 - Select Fiili ile dataset içerisindeki belirli sütünler seçilir.
# 3 - Mutate fiili ile datasete yeni bir sütun eklenebilir.
# 4 - Arrange fiili ile belirli sütunlara göre data büyükten küçüğe ya da küçükten büyüğe göre sıralanır.
# 5 - Summarise fiili ile dataset içerisinden özet raporlar oluşturmamızı sağlayacaktır. 
#     Bu fiil sıklıkla group_by() fonksiyonu ile beraber kullanılmaktadır.
#
#
# Analizleri yapmak için datasetini incelemeye başlayabiliriz. 
# Uygulamamızda aşağıda linki paylaşılan adresten verimizi yüklüyoruz.
#
# Veri setimiz 2002-2015 yılları arasında eyaletlerin elde ettiği gelirleri içeriyor. 
# Bu veri kümesi 51 gözlem (satır) ve 16 değişken (sütun) içermektedir. 
# Not: Veriler eyaletlerin gerçek gelir rakamlarını içermemektedir.
# ("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")
#
#
# İlk olarak dplyr paketinin kurulumu ile yapılacaktır.
install.packages ("dplyr")
#
# Ardından kütüphane aktif edilmelidir.
library (dplyr)
#
#
#
#--------------------------------------------------------------------------------------------------
################################ TURGAY KİBAR #####################################################
#--------------------------------------------------------------------------------------------------

getwd()
setwd("d:/drv/src/R/")

# Dplyr paketini kurmak için aşağıdaki komutu çalıştırabiliriz.
install.packages ("dplyr")
# Dplyr paketini yüklemek için aşağıdaki komutu çalıştırabiliriz.
library (dplyr)

#--------------------------------------------------------------------------------------------------

# verilerimizi ilgili adresten yüklüyoruz ve inceliyoruz
mydata = read.csv ("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")

# veya lokale indirilmiş kopyasını çalışma dizininden yükleyebiliriz
mydata = read.csv ("sampledata.csv")

str(mydata)
View(mydata)
summary(mydata)
glimpse(mydata)

#--------------------------------------------------------------------------------------------------

# Örnek 1: Rastgele N Satır Seçme
# Selecting Random N Rows
# Dataframe'den veya tablodan rastgele ikinci parametresindeki adet kadar satır seçer.
help(sample_n)

sample_n(mydata, 3)

#--------------------------------------------------------------------------------------------------

# Örnek 2: Rastgele Yüzdeye göre Seçme 
# Selecting Random Fraction of Rows
# Dataframe'den veya tablodan rastgele ikinci parametresindeki yüzdesi (%10) kadar satır seçer.
help(sample_frac)

sample_frac(mydata,0.1)

#--------------------------------------------------------------------------------------------------

# Örnek 3: Tüm değişkenlere göre Yinelenen Satırları Kaldırma (Tam Satır)
# Remove Duplicate Rows based on all the variables (Complete Row)
# Veri seti içerisinde yenilenen benzer satırları ortadan kaldırır
help(distinct)

x1 = distinct(mydata)

str(mydata)
str(x1)

#--------------------------------------------------------------------------------------------------

# Örnek 4: Bir değişkene bağlı olarak Yinelenen Satırları Kaldırma
# Remove Duplicate Rows based on a variable
# Belirtilen değişkene göre yenilenen benzer satırları ortadan kaldırır
# .Keep_all parametresi dataframe'deki tüm diğer değişkenleri fonksiyon çıktısında tutmak için kullanılır.

x2 = distinct(mydata, Index, .keep_all= TRUE)

str(mydata)
str(x2)

#--------------------------------------------------------------------------------------------------

# Örnek 5: Birden çok değişkene dayalı olarak Yinelenen Satırları Kaldırma
# Remove Duplicates Rows based on multiple variables
# Belirtilen değişkenlere göre yenilenen benzer satırları ortadan kaldırır

x3 = distinct(mydata, Index, Y2010, .keep_all= TRUE)

str(mydata)
str(x3)

#--------------------------------------------------------------------------------------------------

# Örnek 6: Değişkenleri (veya Sütunları) Seçme
# Selecting Variables (or Columns)
# Belirtilen değişkenlerle veya değişken aralığıyla seçim yapar
help(select)

mydata2 = select(mydata, Index, State:Y2008)

str(mydata)
str(mydata2)

#--------------------------------------------------------------------------------------------------

# Örnek 7: Değişkenleri Kaldırmak
# Dropping Variables
# Belirtilen değişkenler veya değişken aralıkları hariç seçim yapar

mydata2 = select(mydata, -Index, -State)
mydata2 = select(mydata, -c(Index, State))

str(mydata)
str(mydata2)

#--------------------------------------------------------------------------------------------------

# Örnek 8: Değişkenleri Seçmek veya Kaldırmak ('Y' ile başlayan)
# Selecting or Dropping Variables starts with 'Y'
# Belirtilen karakterle başlayan değişkenleri seçer veya - ile hariçleri seçer

mydata3 = select(mydata, starts_with("Y"))
mydata33 = select(mydata, -starts_with("Y"))

str(mydata)
str(mydata33)

# Seçimler için diğer seçenekler
# ------------------------------
# starts_with()	Starts with a prefix
# ends_with()	Ends with a prefix
# contains()	Contains a literal string
# matches()	Matches a regular expression
# num_range()	Numerical range like x01, x02, x03.
# one_of()	Variables in character vector.
# everything()	All variables.

#--------------------------------------------------------------------------------------------------

# Örnek 9: Değişkenleri Seçmek veya Kaldırmak (İçinde 'I' bulunanlar)
# Selecting Variables contain 'I' in their names

mydata4 = select(mydata, contains("I"))

str(mydata)
str(mydata4)

#--------------------------------------------------------------------------------------------------

# Örnek 10: Değişkenleri Yeniden Sıralama
# Reorder Variables
# Belirtilen değişkeni en başa diğer değişkenleri sırayla yanına ekler

mydata5 = select(mydata, State, everything())

str(mydata)
str(mydata5)

#--------------------------------------------------------------------------------------------------

# Örnek 11: Değişkenleri Yeniden Adlandırın
# Rename Variables
# Belirtilen değişkenin adını değiştirir
help(rename)

mydata6 = rename(mydata, Index1=Index)

str(mydata)
str(mydata6)

#--------------------------------------------------------------------------------------------------

# Örnek 12: Satırları Filtrele
# Filter Rows
# Index değişkeninin A'ya eşit olduğu satırları getirir
help(filter)

mydata7 = filter(mydata, Index == "A")

str(mydata)
str(mydata7)

#--------------------------------------------------------------------------------------------------

# Örnek 13: Çoklu Seçim Kriterleri
# Multiple Selection Criteria
# İçinde %in% operatörü birden fazla değeri seçmek için kullanılır

mydata7 = filter(mydata, Index %in% c("A", "C"))

str(mydata)
str(mydata7)


#--------------------------------------------------------------------------------------------------

# Örnek 14: Seçim Kriterlerinde 'VE' Koşulu
# 'AND' Condition in Selection Criteria
# Ve - AND - & operatörü aynı anda birden fazla koşulu sağlayanları getirir

mydata8 = filter(mydata, Index %in% c("A", "C") & Y2002 >= 1300000 )

str(mydata)
str(mydata8)

#--------------------------------------------------------------------------------------------------

# Örnek 15: Seçim Kriterlerinde 'VEYA' Koşulu
# 'OR' Condition in Selection Criteria
# Veya - OR - | operatörü birden fazla koşuldan aynı anda en az birini sağlayanları getirir

mydata9 = filter(mydata, Index %in% c("A", "C") | Y2002 >= 1300000)

str(mydata)
str(mydata9)

#--------------------------------------------------------------------------------------------------

# Örnek 16: NOT Koşulu
# NOT Condition
# ! operatörü ile ilgili koşulu sağlayanlar haricindeki satırları getirir

mydata10 = filter(mydata, !Index %in% c("A", "C"))

str(mydata)
str(mydata10)

#--------------------------------------------------------------------------------------------------

# Örnek 17: CONTAINS Koşulu
# CONTAINS Condition
# grepl ile ikinci parametredeki değişkende birinci parametredeki değer içeren satırları getirir

mydata10 = filter(mydata, grepl("Ar", State))

str(mydata)
str(mydata10)

#--------------------------------------------------------------------------------------------------

# Örnek 18: Seçili değişkenleri Özetleme
# Summarize selected variables
# Belirtilen değişkene göre ortalama ve medyan hesaplabiliriz
help(summarise)

summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med = median(Y2015))

#--------------------------------------------------------------------------------------------------

# Örnek 19: Çoklu Değişkenleri Özetleme
# Summarize Multiple Variables
# vars ile seçtiğimiz değişkenlerin list ile belirtiğimiz hesaplamaları yaptırabiliriz
help(summarise_at)

# funs gelecekteki sürümlerde kaldıracağı için list kullanmamız daha doğrudur
summarise_at(mydata, vars(Y2005, Y2006), funs(n(), mean, median))

summarise_at(mydata, vars(Y2005, Y2006), list(n=~n(), mean=mean, median=median))

# isim vermeden hesaplamak için ~ parametresini kullanabiliriz
summarise_at(mydata, vars(Y2005, Y2006), list(~n(), ~mean(.), ~median(.)))



# Base R Style
summarise_at(mydata, vars(Y2005, Y2006), function(x) length(unique(x)))
# purrr Style anonymous function
summarise_at(mydata, vars(Y2005, Y2006), ~length(unique(.)))

#--------------------------------------------------------------------------------------------------

# Örnek 20: Özel İşlevlerle Özetleme
# Summarize with Custom Functions
# na.rm parametresi ile eksik değerleri hesaplamalarda hariç tutuyoruz

summarise_at(mydata, vars(Y2011, Y2012), list(mean, median), na.rm = TRUE)

# Y2011 ve Y2012 için eksik değerlerin sayısı ile ortalama ve medyanı hesaplıyoruz
summarise_at(mydata, vars(Y2011, Y2012), list(~n(), missing = ~sum(is.na(.)), ~mean(., na.rm = TRUE), ~median(.,na.rm = TRUE)))

#--------------------------------------------------------------------------------------------------

# Örnek 21: Tüm Sayısal Değişkenleri Özetleme
# Summarize all Numeric Variables
# İkinci parametredeki is.numeric vb koşullara göre hesaplamaları yapar

summarise_if(mydata, is.numeric, funs(n(), mean, median))
summarise_if(mydata, is.numeric, list(n=~n(), mean, median))

# Uzun yoldan yaparsak, önce tüm sayısal değerler seçilip sonra tüm özet istatistikler hesaplanır
numdata = mydata[sapply(mydata, is.numeric)]
summarise_all(numdata, funs(n(), mean, median))
summarise_all(numdata, list(n=~n(), mean, median))

#--------------------------------------------------------------------------------------------------

# Örnek 22: Faktör Değişkenini Özetleme
# Summarize Factor Variable
# Kategorik (factor) bir değişkendeki seviyeleri ve kayıp gözlemleri sayar


# Değişkenimiz faktör tipinde olmadığı için öncelikle hesaplamalar 0 çıkmaktadır
str(mydata)
summarise_all(mydata["Index"], funs(nlevels(.), nmiss=sum(is.na(.))))

# Değişkenimizi faktöre çevirip o şekilde hesapladığımızda doğru sonuçlar alırız
mydata$Index = as.factor(mydata$Index)
str(mydata)
summarise_all(mydata["Index"], funs(nlevels(.), nmiss=sum(is.na(.))))

#--------------------------------------------------------------------------------------------------

# Örnek 23: Verileri Birden Çok Değişkene Göre Sıralama
# Sort Data by Multiple Variables
# Birden çok değişkene göre verileri artan veya azalan (desc) şekilde sıralayabiliriz
help(arrange)

arrange(mydata, Index, Y2011)

arrange(mydata, desc(Index), Y2011)

#--------------------------------------------------------------------------------------------------

# Boru İşlemcisi %>% (Pipe Operator)
# dplyr, gerekirse başka bir paketteki (magrittr) boru operatörünü %>% kullanabilir
# Birden fazla işlevi sarıp tek seferde çalıştırmamızı sağlar, aşağıda örnekleri mevcuttur

filter(mydata, Index == "A")
mydata %>% filter(Index == "A")

sample_n(select(mydata, Index, State),10)
mydata %>% select(Index, State) %>% sample_n(10)

group_by(mydata, Index)
mydata %>% group_by(Index)

#--------------------------------------------------------------------------------------------------

# Örnek 24: Verileri Kategorik Değişkene Göre Özetleme
# Summarise Data by Categorical Variable
# Indeks değişkenine göre Y2011 ve Y2012 değişkenlerinin sayısını ve ortalamasını hesaplayabiliriz

summarise_at(group_by(mydata, Index), vars(Y2011, Y2012), funs(n(), mean(., na.rm = TRUE)))

mydata %>% group_by(Index) %>% summarise_at(vars(Y2011:Y2012), funs(n(), mean(., na.rm = TRUE)))

#--------------------------------------------------------------------------------------------------

# Örnek 25: Bir Kategorik Değişken içindeki Verileri Filtreleme
# Filter Data within a Categorical Variable
# Index değişkenin 'A', 'C' ve 'I' kategorilerinden sadece o kategorinin ilk 2 satırını çekebiliriz

mydata %>% filter(Index %in% c("A", "C", "I")) %>% group_by(Index) %>% do(head(., 2))

#--------------------------------------------------------------------------------------------------

# Örnek 26: Kategorik Değişkenle 3.Maksimum Değeri Seçme
# Selecting 3rd Maximum Value by Categorical Variable
# Index değişkenin Y2015 değerinin üçüncü maksimum değerini hesaplayabiliriz
# İlk olarak yalnızca iki değişken Index ve Y2015 seçilir
# Ardından Index değişkenini 'A', 'C' ve 'I' ile filtrelenir
# Sonra Index değişkenine göre gruplandırırız
# Ve Y2015 değişkenini azalan sırada sıralayıp
# Sonunda üçüncü sırayı seçeriz

mydata %>% 
  select(Index, Y2015) %>% 
  filter(Index %in% c("A", "C","I")) %>% 
  group_by(Index) %>% 
  do(arrange(.,desc(Y2015))) %>%
  slice(3)

# Benzer sonuca ulaşmak için min_rank() window function ınını kullanabiliriz
mydata %>% 
  select(Index, Y2015) %>%
  filter(Index %in% c("A", "C","I")) %>%
  group_by(Index) %>%
  filter(min_rank(desc(Y2015)) == 3)

#--------------------------------------------------------------------------------------------------

# Örnek 27: Özetleme, Gruplama ve Birlikte Sıralama
# Summarize, Group and Sort Together
# Index değişkenine göre gruplayıp Y2014 ve Y2015 değişkenlerinin ortalamasını hesaplayabiliriz
# Ardından hesaplanan Y2015 ortalama değişkenine göre sıralayabiliriz

mydata %>% 
  group_by(Index) %>% 
  summarise(Mean_2014 = mean(Y2014, na.rm=TRUE), Mean_2015 = mean(Y2015, na.rm=TRUE)) %>% 
  arrange(desc(Mean_2015))

#--------------------------------------------------------------------------------------------------

# Örnek 28: Yeni bir değişken oluşturma
# Create a new variable
# Veri setine Y2015/Y2014 bölüm değerini yeni bir değişken olarak ekleyebiliriz
help(mutate)

mutate(mydata, change=Y2015/Y2014)

#--------------------------------------------------------------------------------------------------

# Örnek 29: Tüm değişkenleri 1000 ile çarpma
# Multiply all the variables by 1000
help(mutate_all)

# Veri setinde kategorik ve karakter değişkenleri olduğu için tüm veri setinde hata verir
mutate_all(mydata, funs("new" = .* 1000))

# Ama sadece sayısal değer içeren Y ile başlayan değişkenlerini çarpabiliriz
mutate_all(mydata, funs("new" = select(mydata, starts_with("Y")) * 1000))

#--------------------------------------------------------------------------------------------------

# Örnek 30: Değişkenler için Sırayı Hesaplama
# Calculate Rank for Variables
# Y2008 Y2009 Y2010 değişkenlerinin kendi içerisindeki sırasını 1'den başlayarak 
# artan veya azalan şekilde yeni bir değişken gibi çıkarabiliriz

mutate_at(mydata, vars(Y2008:Y2010), funs(Rank=min_rank(.)))

mutate_at(mydata, vars(Y2008:Y2010), funs(Rank=min_rank(desc(.))))

#--------------------------------------------------------------------------------------------------

# Örnek 31: 'Index' değişkeni arasından en yüksek geliri sağlayan Eyaleti seçme
# Select State that generated highest income among the variable 'Index'
# Index değişkenlerini en yüksek Y2015 gelirine sahip eyaleti ile birlikte getirebiliriz

mydata %>% 
  group_by(Index) %>% 
  filter(min_rank(desc(Y2015)) == 1) %>% 
  select(Index, State, Y2015)

#--------------------------------------------------------------------------------------------------

# Örnek 32: 'Index' değişkeninin Kümülatif Geliri
# Cumulative Income of 'Index' variable
# cumsum ile bir değişkenin kümülatif toplamını hesaplayabiliriz

mydata %>% 
  group_by(Index) %>% 
  mutate(Total=cumsum(Y2015)) %>%
  select(Index, Y2015, Total)

#--------------------------------------------------------------------------------------------------

# Örnek 33: Her iki tablodaki ortak satırlar
# Common rows in both the tables
# inner_join her iki tabloda da bir eşleşme olduğunda eşleşen satırları döndürür
# df1 ve df2'yi ortak değişken ID ile birleştiriyoruz.
help(inner_join)

df1 = data.frame(ID = c(1, 2, 3, 4, 5),
                 w = c('a', 'b', 'c', 'd', 'e'),
                 x = c(1, 1, 0, 0, 1),
                 y = rnorm(5),
                 z = letters[1:5])

df2 = data.frame(ID = c(1, 7, 3, 6, 8),
                 a = c('z', 'b', 'k', 'd', 'l'),
                 b = c(1, 2, 3, 0, 4),
                 c = rnorm(5),
                 d = letters[2:6])

df3 = inner_join(df1, df2, by = "ID")

str(df1)
str(df2)
str(df3)

# ID her iki tabloda aynı ada sahip değilse, aşağıdaki yolu kullanabiliriz
# inner_join(df1, df2, by = c("ID"="ID1"))

#--------------------------------------------------------------------------------------------------

# Örnek 34: LEFT JOIN uygulaması
# Applying LEFT JOIN
# left_join ile sağ tabloda hiç eşleşme olmasa bile soldaki tabloda yer alan tüm satırları döndürebiliriz
help(left_join)

left_join(df1, df2, by = "ID")

#--------------------------------------------------------------------------------------------------

# Örnek 35: INTERSECT'in uygulanması
# Applying INTERSECT
# intersect ile her iki veri seti için ortak olan benzersiz satırları seçebiliriz

mtcars$model <- rownames(mtcars)
first <- mtcars[1:20, ]
second <- mtcars[10:32, ]
intersect(first, second)

#--------------------------------------------------------------------------------------------------

# Örnek 36: UNION'ın Uygulanması
# Applying UNION
# union ile her iki tablodaki tüm satırları birleştirip yinelenen kayıtları kaldırırarak listeleyebiliriz
# Union_all işlevini kullanarak ise birleştirilmiş veri kümesinde yinelenen satırlara izin verebiliriz
help(union_all)

x=data.frame(ID = 1:6, ID1= 1:6)
y=data.frame(ID = 1:6,  ID1 = 1:6)
union(x,y)
union_all(x,y)

#--------------------------------------------------------------------------------------------------

# Örnek 37: Bir tabloda görünüp ancak diğer tabloda görünmeyen Satırlar
# Rows appear in one table but not in other table
# İlk parametredeki veri setinde olup ikinci parametredeki veri setinde olmayan satırları getirebiliriz

setdiff(first, second)

#--------------------------------------------------------------------------------------------------

# Örnek 38: EĞER DEĞİLSE İfadesi
# IF ELSE Statement
# Veri seti içerisinde koşula göre değişkenleri tespit edebiliriz
# Eğer değişken değer içermiyorsa missing parametresi ile yakalayabiliriz
help(if_else)

df <- c(-10,2, NA)
if_else(df < 0, "negative", "positive", missing = "missing value")



# IF_ELSE ile yeni bir değişken oluşturma
# Create a new variable with IF_ELSE
# Değişken 5'ten küçükse 1 eklenir, 5'ten büyük veya eşitse 2 eklenir, aksi takdirde missing olur ve 0 olur

df =data.frame(x = c(1,5,6,NA))
df %>% mutate(newvar=if_else(x<5, x+1, x+2, 0))



# İç içe EĞER DEĞİLSE
# Nested IF ELSE

mydf =data.frame(x = c(1:5,NA))
mydf %>% mutate(newvar= if_else(is.na(x),"I am missing",
                                if_else(x==1,"I am one",
                                        if_else(x==2,"I am two",
                                                if_else(x==3,"I am three","Others")))))



# SQL-Style CASE WHEN İfadesi
# SQL-Style CASE WHEN Statement
help(case_when)

mydf %>% mutate(flag = case_when(is.na(x) ~ "I am missing",
                                 x == 1 ~ "I am one",
                                 x == 2 ~ "I am two",
                                 x == 3 ~ "I am three",
                                 TRUE ~ "Others"))

#--------------------------------------------------------------------------------------------------

# Örnek 39: ROW WISE İşlemini Uygulama
# Apply ROW WISE Operation
# rowwise ile 2012,2013,2014,2015 değişkenlerinin her satırı için içlerindeki en büyüğünü bulabiliriz
help(rowwise)

mydata %>%
  rowwise() %>% 
  mutate(Max= max(Y2012,Y2013,Y2014,Y2015)) %>%
  select(Y2012:Y2015,Max)

#--------------------------------------------------------------------------------------------------

# Örnek 40: Veri Çerçevelerini Birleştirme
# Combine Data Frames
help(bind_rows)

df1 = data.frame(ID = 1:6,  x=letters[1:6])
df2 = data.frame(ID = 7:12, x=letters[7:12])

# bind_rows fonksiyonu iki veri setini satır bazında bir araya getirir
bind_rows(df1,df2)

# Base R'da benzeri olan rbind fonksiyonu
rbind(df1,df2)



# bind_cols fonksiyonu iki veri setini kolon bazında bir araya getirir
bind_cols(x,y)

# Base R'da benzeri olan cbind fonksiyonu
cbind(x,y)

#--------------------------------------------------------------------------------------------------

# Örnek 41: Yüzdelik Değerleri Hesaplama
# Calculate Percentile Values
# Quantile ile Index değişkenine göre yüzdelik değerleri hesaplayabiliriz
help(quantile)

mydata %>% 
  group_by(Index) %>%
  summarise(
            Pecentile_25=quantile(Y2015, probs=0.25),
            Pecentile_50=quantile(Y2015, probs=0.50),
            Pecentile_75=quantile(Y2015, probs=0.75),
            Pecentile_99=quantile(Y2015, probs=0.99))



# ntile ile veri setini 5 ayrı gruba ayırmak için kullanabiliriz
help(ntile)

x = data.frame(N = 1:10)
mutate(x, pos = ntile(x$N,5))

#--------------------------------------------------------------------------------------------------

# Örnek 42: Model Oluşturmayı Otomatikleştirme (do)
# Automate Model Building
# Kategorik bir değişkenin her seviyesi için doğrusal regresyon modelini do ile oluşturabiliriz

# cyl değişkenin mtcars veri setinde 3 seviyesi vardır
length(unique(mtcars$cyl))

by_cyl <- group_by(mtcars, cyl)
models <- by_cyl %>% do(mod = lm(mpg ~ disp, data = .))
summarise(models, rsq = summary(mod)$r.squared)
models %>% do(data.frame(
  var = names(coef(.$mod)),
  coef(summary(.$mod)))
)

#--------------------------------------------------------------------------------------------------

# Örnek 43: Yalnızca sayısal sütunları seçin
# Select only numeric columns
# İkinci parametre ile sadece numerik veya faktör değişkenlerini seçebiliriz
help(select_if)

str(mydata)

mydata2 = select_if(mydata, is.numeric)
str(mydata2)

mydata3 = select_if(mydata, is.factor)
str(mydata3)

#--------------------------------------------------------------------------------------------------

# Örnek 44: Faktör değişkenlerindeki düzey sayısı
# Number of levels in factor variables
# İkinci parametrede belirtilen faktör değişkenleri için düzey sayısını hesaplayabiliriz
help(summarise_if)

# State değişkenini de Index gibi faktöre çevirelim öncelikle
mydata$State = as.factor(mydata$State)

# Index değişkenin 19 seviyesi, State'in ise 51 seviyesi vardır
summarise_if(mydata, is.factor, funs(nlevels(.)))

#--------------------------------------------------------------------------------------------------

# Örnek 45: 1000 ile sayısal değişkenleri çarpın
# Multiply by 1000 to numeric variables
# Sayısal olan tüm değişkenleri 1000 ile çarpıp sonuçları yeni kolon olarak ekleyebiliriz
help(mutate_if)

mutate_if(mydata, is.numeric, funs("new" = .* 1000))

#--------------------------------------------------------------------------------------------------

# Örnek 46: Değeri NA'ya dönüştürme
# Convert value to NA
# na_if ile ikinci parametredeki değerleri NA olarak değiştirebiliriz
help(na_if)

k <- c("a", "b", "", "d")
na_if(k, "")

#--------------------------------------------------------------------------------------------------

# Örnek 47: pull () işlevinin kullanımı
# Use of pull( ) function
# Sorgu sonucunun dataframe olarak değilde vektör olmasını istiyorsanız pull kullanabiliriz
help(pull)

str(iris)

iris %>% 
  filter(Sepal.Length > 5.5) %>% 
  pull(Species)

mtcars %>% pull(-1)
mtcars %>% pull(1)
mtcars %>% pull(cyl)

starwars %>% pull(height, name)

#--------------------------------------------------------------------------------------------------
#
###################################################################################################
#######################################  dplyr SON  ###############################################
###################################################################################################
