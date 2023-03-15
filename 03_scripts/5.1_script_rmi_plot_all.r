### Skript 5.1 ### Kara Hass, Bachelor-Arbeit, 2023
# Dieses Skript laeuft unabhaengig von den vorherigen

#Times New Roman laden fuer Diagramm
install.packages("extrafont")
library(extrafont)
font_import() # nimmt einige Zeit in Anspruch, kann uebersprungen werden, wenn Default-Font ausreichend ist
loadfonts(device = "win")

# 15 Diagramm mit Race-Modell-Vorhersage und den kumulierten empirischen Verteilungsfunktionen

# 15.1 Datensatz als Datensatz einlesen, der nicht in Liste umgewandelt wird
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_perm')
perm_data <- read.delim("~/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_perm/perm_data.txt")

# 15.2 Inf auf 1500 setzen, damit die Funktionen abbildbar sind
perm_data$RT[perm_data$RT > 1500] = 1500

# 15.3 Datensatz in Liste einlesen
rmiread = function(fname)
{
  d = read.table(fname, header=TRUE)
  Obs = split(d[, c('Cond', 'RT')], d$Obs)
  lapply(Obs, function(x) split(x$RT, x$Cond))
} # rmiread
data_p = rmiread("perm_data.txt")
d <- data_p

#15.4 F(A)+F(V) erstellen und dem Datensatz zufuegen
x <- seq(0, 1500, 0.1) # in 1ms Schritten
fa <- ecdf(perm_data$RT[perm_data$Cond =="A"]) #Werte der Verteilungsfunktion von A
fv <- ecdf(perm_data$RT[perm_data$Cond =="V"]) #Werte der Verteilungsfunktion von V
fav <- ecdf(perm_data$RT[perm_data$Cond =="AV"]) # Werte der Verteilungsfunktion von AV
FA <- fa(x) #Verteilungsfunktion von A zu Zeitpunkt xi
FV <- fv(x) #Verteilungsfunktion von V zu Zeitpunkt xi
FAV <- fav(x) # Verteilungsfunktion von AV zu Zeitpunkt xi
df_prediction <- data.frame(x, FA, FV, FAV) #Datensatz erstellen mit ms, F(A), F(V), F(AV); zu jedem Zeitpunkt x in ms-Schritten von 0-1500
sums <- rowSums(df_prediction[2:3]) #Summe der 2. und 3. Spalte reihenweise (F(A)+F(V))
df_prediction <- as.data.frame(cbind(df_prediction, sums)) #Summenspalte zum df hinzufuegen
df_prediction$sums[df_prediction$sums > 1] = 1 # da Verteilungsfunktion nur bis 1 geht; alle Werte >1 auf = 1 setzen
names(df_prediction) <- c("ms", "A", "V", "AV", "sum") # Spalten im Datensatz benennen


# 15.5 Diagramm alle Bedingungen, alle Verteilungsfunktionen
## F(A)       - rot
## F(V)       - lila
## F(AV)      - gruen 
## F(A) + F(V)- blau

library(ggplot2)
RMI_all <- ggplot()+
  stat_ecdf(data=perm_data, aes(x = RT,  colour=Cond), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + #bis hierhin wie aus Script 4 die F(A), F(V) und F(AV), folgend nun Vorhersage
  geom_step(data=df_prediction, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) +
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))
RMI_all

#das gleiche nochmal mit X-Achse im 0-650ms-Abschnitt
RMI_all_650 <- ggplot()+
  stat_ecdf(data=perm_data, aes(x = RT,  colour=Cond), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + #bis hierhin wie aus Script 4 die F(A), F(V) und F(AV), folgend nun Vorhersage
  geom_step(data=df_prediction, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) +
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))+
  scale_x_continuous(limits= c(0, 650), breaks=seq(0, 650, 100))+
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5))
RMI_all_650