###### Arda �RER ######
#### forcats k�t�phanesi kullanimi ####

# K�t�phanemizi ve �rneklerde kullanacagimiz diger k�t�phaneler ile data setimizi y�kleyelim.

library(forcats)
library(dplyr)
library(ggplot2)
data("iris")
data("mpg")
data("gss_cat")


# Fakt�rler, sirali veya sirasiz kategorik verileri temsil etmek i�in kullanilir.


# as_factor() 
# Girdimizi fakt�re �evirmek i�in kullaniyoruz.

a <- c("ali", "kitap", "oku")
class(a)

a <- as_factor(a)
class(a)

# fct_count()
# Fakt�rleri saymak i�in kullaniyoruz.

gss_cat$relig %>%
  fct_count(sort = T)

# fct_match()
# Fakt�r i�inde herhangi bir seviye olup olmadigini kontrol etmek i�in kullaniyoruz.

gss_cat$relig %>%
  fct_match("Protestant") %>%
  table()

# fct_unique()
# Fakt�rdeki benzersiz degerleri bulmak i�in kullaniyoruz.

gss_cat$relig %>%
  fct_unique()

# Fakt�r birlesimleri i�in kullanilabilecek fonksiyonlar

# fct_c()
# Fakt�rleri ve seviyeleri birlestirmek i�in kullaniyoruz.

fa <- factor("a")
fb <- factor("b")
fab <- factor(c("a", "b"))
fct_c(fa,fb,fab)

# fct_cross()
# 2 veya daha fazla fakt�r� birlestirmek i�in kullaniyoruz.

a <- factor(c("a","b","a", "b"))
b <- factor(c("x","x","y", "x" ))
fct_cross(a,b)

# Seviye sirasini degistiren fonksiyonlar
# fct_relevel()
# Fakt�r seviyelerini elle yeniden siralamak i�in kullaniyoruz.

# "a" seviyesini en basa atiyoruz.

f <- factor(c("a", "b", "c", "d"), levels = c("b", "c", "d", "a"))
fct_relevel(f, "a")

# 2 adet seviyeyi yazarsak, yazdigimiz sirada bu seviyeleri basa atar.

fct_relevel(f, "b", "a")

# 3. seviyeye "a" fakt�r�n� atar.

fct_relevel(f, "a", after = 2)

# seviyeleri sort fonksiyonuna g�re siralamak

fct_relevel(f, sort)

# "a" seviyesini sonuncu seviyeye atar.

fct_relevel(f, "a", after = Inf)

# seviyelerin yerlerini rastgele atar.

fct_relevel(f, sample)

# seviyeleri tam tersi sekilde siralar.

fct_relevel(f, rev)

# fct_inorder()
# fct_inorder fonksiyonu ise seviyeleri ilk g�r�ld�kleri siraya g�re yapar.

f <- factor(c("g", "f", "g", "a", "c", "f", "b", "d", "d", "e"))
fct_inorder(f)

# fct_infreq()
# fct_infreq foksiyonu, bize verileri g�r�lme sikligina g�re b�y�kten k���ge dogru siralar.

ggplot(mpg, aes(class)) +
  geom_bar()

# K���kten b�y�ge dogru siralamasi i�in 
# fct_infreq fonksiyonundan �nce fct_rev fonksiyonu kullanilmalidir.

# Count'a g�re b�y�kten k���ge

mpg <- mpg %>% mutate(class = factor(class))
ggplot(mpg, aes(x = fct_infreq(class))) +
  geom_bar()

# Count'a g�re k���kten b�y�ge siralama

ggplot(mpg, aes(x = fct_rev(fct_infreq(class)))) +
  geom_bar()

# fct_shuffle()
# fct_suffle fonksiyonu, fakt�r seviyelerini rastgele siralamak i�in kullanilir.
f <- factor(c("a", "b", "c"))
f
fct_shuffle(f)
fct_shuffle(f)
fct_shuffle(f)
# G�r�ld�g� �zere fonksiyonu her �agirisimizda seviyeler rastgele siralanmaktadir.

# fct_rev()
# Fakt�r�n seviyelerini tersten siralar.
fct_rev(f)

# fct_shift()
# Fakt�r seviyelerini kaydirmak i�in kullanilmaktadir.
renk <- factor(
  c("pazartesi", "sali", "�arsamba"),
  levels = c("pazartesi", "sali", "�arsamba", "persembe", "cuma", "cumartesi", "pazar"),
  ordered = T) 
renk

fct_shift(renk)

fct_shift(renk, 2)

fct_shift(renk, -1)

# Seviyelerin degerini degistiren fonksiyonlar
# fct_anon()
# Fakt�r seviyelerini anonim hale getirir. I�erisine bir karakter yazdigimizda ise �rnekteki gibi bir fakt�r haline gelir.
gss_cat$relig %>%
  fct_count()

gss_cat$relig %>%
  fct_anon() %>%
  fct_count()

gss_cat$relig %>%
  fct_anon("X") %>%
  fct_count()

# fct_collapse
# Fakt�r� belirli gruplara ayirmamizi saglar.
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
# bize �agirdigimiz elemanlari getirir geri kalanlari ise diger (other) olarak adlandirir.
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
# fct_lump_prop fonksiyonu bize belirledigimiz y�zdeden fazla olanlari getirir geri kalanlari diger (other) olarak adlandirir.

gss_cat$relig %>%
  fct_lump_prop(.1)%>%
  table()

# fct_lump_min()
# fct_lump_min fonksiyonu bize minimum n kadar olan degiskenleri �agirmamizi saglar. 
# �rnegin n = 100 i�in 100'den fazla olan t�m kategorileri getir.

gss_cat$relig %>%
  fct_lump_min(100)%>%
  table()


# seviye ekleme ve kaldirma
# fct_expand()
# Bir fakt�re yeni seviyeler ekler.

f <- factor(c("a", "b", "c", "c","a","a", "b"))
f

fct_expand(f, "d", "e", "f")

# fct_explicit_na()
# Eksik verileri vekt�r olarak verir ve grafiklerde g�r�lmesini saglar.

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

# "only" arg�mani ile istedigimiz baska seviyeleri de �ikarabiliriz.
fct_drop(f, only = "d")

# fct_unify()
# Bir listedeki fakt�rlerin seviyelerini birlestirir.

factor_list <- list(factor("a"), factor("b"), factor(c("a", "b", "c")))
factor_list

fct_unify(factor_list)




