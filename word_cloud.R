getwd()
setwd("C:\\Users\\Steven\\Documents\\Junior Year\\Random Stuff\\RapGenius")
library(RCurl)
library(XML)

newslaves = "newslaves.txt"
control = "control.txt"
rapgod = "rapgod.txt"
blood = "bloodontheleaves.txt"
badguy = "badguy.txt"
bound2 = "bound2.txt"
numbers = "numbers.txt"
poundcake = "poundcake.txt"
powertrip = "powertrip.txt"
black = "blackskinhead.txt"
collardgreens = "collardgreens.txt"
onetrain = "onetrain.txt"
holygrail = "holygrail.txt"
cocoabutterkisses = "cocoabutterkisses.txt"
t3005 = "3005.txt"
bottom = "bottom.txt"
lovegame = "lovegame.txt"
hive = "hive.txt"
worst = "worst.txt"
berzerk = "berzerk.txt"
letnasdown = "letnasdown.txt"
shabba = "shabba.txt"
holdon = "holdon.txt"
juice = "juice.txt"

download.file("http://www.azlyrics.com/lyrics/kanyewest/newslaves.html", destfile = newslaves)
download.file("http://www.azlyrics.com/lyrics/bigsean/controlhof.html", destfile = control)
download.file("http://www.azlyrics.com/lyrics/eminem/rapgod.html", destfile = rapgod)
download.file("http://www.azlyrics.com/lyrics/kanyewest/bloodontheleaves.html", destfile = blood)
download.file("http://www.azlyrics.com/lyrics/eminem/badguy.html", destfile = badguy)
download.file("http://www.azlyrics.com/lyrics/kanyewest/bound2.html", destfile = bound2)
download.file("http://www.azlyrics.com/lyrics/pushat/numbersontheboards.html", destfile = numbers)
download.file("http://www.azlyrics.com/lyrics/drake/poundcakeparismortonmusic2.html", destfile = poundcake)
download.file("http://www.azlyrics.com/lyrics/jcole/powertrip.html", destfile = powertrip)
download.file("http://www.azlyrics.com/lyrics/kanyewest/blackskinhead.html", destfile = black)
download.file("http://www.azlyrics.com/lyrics/schoolboyq/collardgreens.html", destfile = collardgreens)
download.file("http://www.azlyrics.com/lyrics/asaprocky/1train.html", destfile = onetrain)
download.file("http://www.azlyrics.com/lyrics/jayz/holygrail.html", destfile = holygrail)
download.file("http://www.azlyrics.com/lyrics/chancetherapper/cocoabutterkisses.html", destfile = cocoabutterkisses)
download.file("http://www.azlyrics.com/lyrics/childishgambino/3005.html", destfile = t3005)
download.file("http://www.azlyrics.com/lyrics/drake/startedfromthebottom.html", destfile = bottom)
download.file("http://www.azlyrics.com/lyrics/eminem/lovegame.html", destfile = lovegame)
download.file("http://www.azlyrics.com/lyrics/earlsweatshirt/hive.html", destfile = hive)
download.file("http://www.azlyrics.com/lyrics/drake/worstbehavior.html", destfile = worst)
download.file("http://www.azlyrics.com/lyrics/eminem/berzerk.html", destfile = berzerk)
download.file("http://www.azlyrics.com/lyrics/jcole/letnasdown.html", destfile = letnasdown)
download.file("http://www.azlyrics.com/lyrics/asapferg/shabba.html", destfile = shabba)
download.file("http://www.azlyrics.com/lyrics/drake/holdonweregoinghome.html", destfile = holdon)
download.file("http://www.azlyrics.com/lyrics/chancetherapper/juice.html", destfile = juice)

newslaves <- readLines(newslaves)
control <- readLines(control)
rapgod <- readLines(rapgod)
blood <- readLines(blood)
badguy <- readLines(badguy)
bound <- readLines(bound2)
numbers <- readLines(numbers)
poundcake <- readLines(poundcake)
powertrip <- readLines(powertrip)
black <- readLines(blackskinhead)
collardgreens <- readLines(collardgreens)
onetrain <- readLines(onetrain)
holygrail <- readLines(holygrail)
cocoabutterkisses <- readLines(cocoabutterkisses)
t3005 <- readLines(t3005)
bottom <- readLines(bottom)
lovegame <- readLines(lovegame)
hive <- readLines(hive)
worst <- readLines(worst)
berzerk <- readLines(berzerk)
letnasdown <- readLines(letnasdown)
shabba <- readLines(shabba)
holdon <- readLines(holdon)
juice <- readLines(juice)

newslaves <- newslaves[90:158]
control <- control[90:245]
rapgod <- rapgod[90:304]
blood <- blood[89:161]
badguy <- badguy[90:247]
bound <- bound[90:166]
numbers <- numbers[89:130]
poundcake <- poundcake[90:188]
powertrip <- powertrip[90:151]
black <- black[89:148]
collardgreens <- collardgreens[90:159]
onetrain <- onetrain[90:225]
holygrail <- holygrail[90:200]
cocoabutterkisses <- cocoabutterkisses[90:158]
t3005 <- t3005[90:149]
bottom <- bottom[92:158]
lovegame <- lovegame[90:220]
hive <- hive[90:172]
worst <- worst[90:177]
berzerk <- berzerk[90:164]
letnasdown <- letnasdown[90:180]
shabba <- shabba[90:174]
holdon <- holdon[89:143]
juice <- juice[90:168]

rapgenius <- as.list(c(newslaves, control, rapgod, blood, badguy, numbers, poundcake, powertrip, black, collardgreens, onetrain, holygrail, cocoabutterkisses, t3005, bottom, lovegame, hive, worst, berzerk, letnasdown, shabba, holdon, juice))
rapgenius <- gsub(pattern = "<br />", replacement = "", x = rapgenius)
rapgenius <- gsub(pattern = "<i>", replacement = "", x = rapgenius)
rapgenius <- gsub(pattern = "</i>", replacement = "", x = rapgenius)

library(tm)
doc.vec.rapgenius <- VectorSource(rapgenius)
doc.corpus.rapgenius <- Corpus(doc.vec.rapgenius)

words <- c(stopwords("english"), "and", "but", "or", "if", "then", "on", "the", "now", "get", "got", "hook", "verse")
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, removeWords, words)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, tolower)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, removePunctuation)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, removeNumbers)

library(SnowballC)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, stemDocument)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, stripWhitespace)
doc.corpus.rapgenius <- tm_map(doc.corpus.rapgenius, stemCompletion, dictionary=doc.corpus.rapgenius)

TDM.rapgenius <- TermDocumentMatrix(doc.corpus.rapgenius)

library(slam)
TDM.dense.rapgenius <- as.matrix(TDM.rapgenius)
TDM.dense.rapgenius <- addmargins(TDM.dense.rapgenius, FUN = list(Total = sum), quiet = TRUE)
TDM.dense.rapgenius2 <- data.frame(Words = TDM.dense.rapgenius[,0], Counts = TDM.dense.rapgenius[,2135])

