###### Arda ÖRER ######
#### forcats kütüphanesi kullanimi ####

# Kütüphanemizi ve örneklerde kullanacagimiz diger kütüphaneler ile data setimizi yükleyelim.

library(forcats)
library(dplyr)
library(ggplot2)
data("iris")
data("mpg")
data("gss_cat")


# Faktörler, sirali veya sirasiz kategorik verileri temsil etmek için kullanilir.


# as_factor() 
# Girdimizi faktöre çevirmek için kullaniyoruz.

a <- c("ali", "kitap", "oku")
class(a)

a <- as_factor(a)
class(a)

# fct_count()
# Faktörleri saymak için kullaniyoruz.

gss_cat$relig %>%
  fct_count(sort = T)

# fct_match()
# Faktör içinde herhangi bir seviye olup olmadigini kontrol etmek için kullaniyoruz.

gss_cat$relig %>%
  fct_match("Protestant") %>%
  table()

# fct_unique()
# Faktördeki benzersiz degerleri bulmak için kullaniyoruz.

gss_cat$relig %>%
  fct_unique()

# Faktör birlesimleri için kullanilabilecek fonksiyonlar

# fct_c()
# Faktörleri ve seviyeleri birlestirmek için kullaniyoruz.

fa <- factor("a")
fb <- factor("b")
fab <- factor(c("a", "b"))
fct_c(fa,fb,fab)

# fct_cross()
# 2 veya daha fazla faktörü birlestirmek için kullaniyoruz.

a <- factor(c("a","b","a", "b"))
b <- factor(c("x","x","y", "x" ))
fct_cross(a,b)

# Seviye sirasini degistiren fonksiyonlar
# fct_relevel()
# Faktör seviyelerini elle yeniden siralamak için kullaniyoruz.

# "a" seviyesini en basa atiyoruz.

f <- factor(c("a", "b", "c", "d"), levels = c("b", "c", "d", "a"))
fct_relevel(f, "a")

# 2 adet seviyeyi yazarsak, yazdigimiz sirada bu seviyeleri basa atar.

fct_relevel(f, "b", "a")

# 3. seviyeye "a" faktörünü atar.

fct_relevel(f, "a", after = 2)

# seviyeleri sort fonksiyonuna göre siralamak

fct_relevel(f, sort)

# "a" seviyesini sonuncu seviyeye atar.

fct_relevel(f, "a", after = Inf)

# seviyelerin yerlerini rastgele atar.

fct_relevel(f, sample)

# seviyeleri tam tersi sekilde siralar.

fct_relevel(f, rev)

# fct_inorder()
# fct_inorder fonksiyonu ise seviyeleri ilk görüldükleri siraya göre yapar.

f <- factor(c("g", "f", "g", "a", "c", "f", "b", "d", "d", "e"))
fct_inorder(f)

# fct_infreq()
# fct_infreq foksiyonu, bize verileri görülme sikligina göre büyükten küçüge dogru siralar.

ggplot(mpg, aes(class)) +
  geom_bar()

# Küçükten büyüge dogru siralamasi için 
# fct_infreq fonksiyonundan önce fct_rev fonksiyonu kullanilmalidir.

# Count'a göre büyükten küçüge

mpg <- mpg %>% mutate(class = factor(class))
ggplot(mpg, aes(x = fct_infreq(class))) +
  geom_bar()

# Count'a göre küçükten büyüge siralama

ggplot(mpg, aes(x = fct_rev(fct_infreq(class)))) +
  geom_bar()

# fct_shuffle()
# fct_suffle fonksiyonu, faktör seviyelerini rastgele siralamak için kullanilir.
f <- factor(c("a", "b", "c"))
f
fct_shuffle(f)
fct_shuffle(f)
fct_shuffle(f)
# Görüldügü üzere fonksiyonu her çagirisimizda seviyeler rastgele siralanmaktadir.

# fct_rev()
# Faktörün seviyelerini tersten siralar.
fct_rev(f)

# fct_shift()
# Faktör seviyelerini kaydirmak için kullanilmaktadir.
renk <- factor(
  c("pazartesi", "sali", "çarsamba"),
  levels = c("pazartesi", "sali", "çarsamba", "persembe", "cuma", "cumartesi", "pazar"),
  ordered = T) 
renk

fct_shift(renk)

fct_shift(renk, 2)

fct_shift(renk, -1)

# Seviyelerin degerini degistiren fonksiyonlar
# fct_anon()
# Faktör seviyelerini anonim hale getirir. Içerisine bir karakter yazdigimizda ise örnekteki gibi bir faktör haline gelir.
gss_cat$relig %>%
  fct_count()

gss_cat$relig %>%
  fct_anon() %>%
  fct_count()

gss_cat$relig %>%
  fct_anon("X") %>%
  fct_count()

# fct_collapse
# Faktörü belirli gruplara ayirmamizi saglar.
gss_cat$partyid %>%
  fct_unique()

gss_cat$partyid %>%
  fct_collapse(
    missing = c("No answer", "Don't know"),
    other = "Other party",
    rep = c("Strong republican", "Not str republican"),
    ind = c("Ind,near rep", "Independent", "Ind,near dem"),
    dem = c("Not str democrat", "Strong democrat")) %>%
  fct_count()

# fct_lump()
# fct_lump belirli kriterleri saglayan seviyeleri(levels) bir araya getiren bir fonksiyondur.
# fct_lump fonksiyonu artik kullanilan bir fonksiyon degildir ancak baktigimiz zaman 
# bize çagirdigimiz elemanlari getirir geri kalanlari ise diger (other) olarak adlandirir.
gss_cat %>%
  mutate(relig = fct_lump(relig)) %>%
  count(relig)

gss_cat %>%
  mutate(relig = fct_lump(relig, n = 5)) %>%
  count(relig, sort = T)

# fct_lump_n()
# fct_lump_n bize sayisi en fazla olan n kadar kategoriyi getirir.

gss_cat$relig %>%
  fct_lump_n(3)%>%
  table()

# Eger -n olarak yazarsak sayisi en az olan n kadar kategoriyi getirir.

gss_cat$relig %>%
  fct_lump_n(-3)%>%
  table()

# fct_lump_prop()
# fct_lump_prop fonksiyonu bize belirledigimiz yüzdeden fazla olanlari getirir geri kalanlari diger (other) olarak adlandirir.

gss_cat$relig %>%
  fct_lump_prop(.1)%>%
  table()

# fct_lump_min()
# fct_lump_min fonksiyonu bize minimum n kadar olan degiskenleri çagirmamizi saglar. 
# Örnegin n = 100 için 100'den fazla olan tüm kategorileri getir.

gss_cat$relig %>%
  fct_lump_min(100)%>%
  table()


# seviye ekleme ve kaldirma
# fct_expand()
# Bir faktöre yeni seviyeler ekler.

f <- factor(c("a", "b", "c", "c","a","a", "b"))
f

fct_expand(f, "d", "e", "f")

# fct_explicit_na()
# Eksik verileri vektör olarak verir ve grafiklerde görülmesini saglar.

f <- factor(c("a","a","b","c","a",NA,"b","c", NA))
f

f %>%
  fct_explicit_na() %>%
  fct_count()


# fct_drop()
# Kullanilmayan seviyeleri atar.

f <- factor(c("a","b","c"), levels = c("a", "b", "c", "d", "e", "f"))
f

fct_drop(f)

# "only" argümani ile istedigimiz baska seviyeleri de çikarabiliriz.
fct_drop(f, only = "d")

# fct_unify()
# Bir listedeki faktörlerin seviyelerini birlestirir.

factor_list <- list(factor("a"), factor("b"), factor(c("a", "b", "c")))
factor_list

fct_unify(factor_list)




