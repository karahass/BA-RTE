### Skript 5.2 ### Kara Hass, Bachelor-Arbeit, 2023
# Dieses Skript laeuft unabhaengig von den vorherigen

# 16 Diagramme mit Race-Modell-Vorhersage und den kumulierten empirischen Verteilungsfunktionen nach Vorbedingung

#Times New Roman laden fuer Diagramm
install.packages("extrafont")
library(extrafont)
font_import() # nimmt einige Zeit in Anspruch, kann uebersprungen werden, wenn Default-Font ausreichend ist
loadfonts(device = "win")

# Arbeichtsverzeichnis einstellen
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_combined_preceding_stim') 

# 16.1   Datensatz einlesen, keine ausschließen, große Reaktionszeiten auf unendlich setzen

# Liste der Dateien
file_list <- list.files(pattern='.csv')

# Platzhalter
df_data_plot <- data.frame() 

# Schleife Daten einlesen
for (i in 1:length(file_list)) {
  
  subj_df <- read.csv(file_list[i], sep = ",")
  
  id <- file_list[i]
  
  col_cond <- which(names(subj_df) == "condition")
  col_RTs <- which(names(subj_df) == "duration")
  col_pre_stim <- which(names(subj_df) == "pre_stim")
  RT_data <- subset(subj_df, sender == "Reaction")[c(col_cond, col_RTs, col_pre_stim)]

  RT_data <- as.data.frame(RT_data)
  
  #umbenennen "duration" -> "reaction_time
  names(RT_data) <- c("condition", "reaction_time", "pre_stim")
  
  RT_data$reaction_time[RT_data$reaction_time > 1500] = 1500
  RT_data_clean <- subset(RT_data, pre_stim != 0) #die ersten Trials jeder VP ausschließen, da keine Vorbedingung vorhanden

  # Datensatz erstellen:
  participant_ID <- c(rep(id, times = length(RT_data_clean$condition)))

  RT_data_clean <- as.data.frame(cbind(participant_ID, RT_data_clean))

  df_data_plot <- as.data.frame(rbind(df_data_plot, RT_data_clean))
  
} # Ende der Schleife

# 16.2.  Subgruppe: pre_stim = A
# 16.2.1 Datensatz mit nur Subgruppe pre_stim = A
df_data_pre_A <- subset(df_data_plot, pre_stim == "A")

# 16.2.3  F(A)+F(V) erstellen und dem Datensatz zufuegen
x <- seq(0, 1500, 0.1) # in 1ms Schritten #existiert bereits aus Berechnung fuer gesamt und bleibt gleich fuer die anderen Bedingungen
fa_A <- ecdf(df_data_pre_A$reaction_time[df_data_pre_A$condition =="A"]) #Werte der Verteilungsfunktion von A
fv_A <- ecdf(df_data_pre_A$reaction_time[df_data_pre_A$condition =="V"]) #Werte der Verteilungsfunktion von V
fav_A <- ecdf(df_data_pre_A$reaction_time[df_data_pre_A$condition == "AV"]) # Werte der Verteilungsfunktion von AV
FA_A <- fa_A(x) #Verteilungsfunktion von A zu Zeitpunkt xi
FV_A <- fv_A(x) #Verteilungsfunktion von V zu Zeitpunkt xi
FAV_A <- fav_A(x) # Verteilungsfunktion von AV zu Zeitpunkt xi 
df_prediction_A <- data.frame(x, FA_A, FV_A, FAV_A) #Datensatz erstellen mit ms, F(A), F(V); zu jedem Zeitpunkt x in ms-Schritten von 0-1500
sums_A <- rowSums(df_prediction_A[2:3]) #Summe der 2. und 3. Spalte reihenweise (F(A)+F(V))
df_prediction_A <- as.data.frame(cbind(df_prediction_A, sums_A)) #Summenspalte zum df hinzufuegen
df_prediction_A$sums_A[df_prediction_A$sums_A > 1] = 1 # da Verteilungsfunktion nur bis 1 geht; alle Werte >1 auf =1 setzen
names(df_prediction_A) <- c("ms", "A", "V", "AV", "sum") # Spalten im Datensatz benennen

# 16.2.4  Diagramm unter Bedingung pre_stim = A, alle Verteilungsfunktionen (_A_all)
## F(A)       - rot
## F(V)       - lila
## F(AV)      - gruen 
## F(A) + F(V)- blau

library(ggplot2)
RMI_A_all <- ggplot()+
  stat_ecdf(data=df_data_pre_A, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  geom_step(data=df_prediction_A, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))
RMI_A_all

#gleiches Diagramm mit x (0,650)
RMI_A_all_650 <- ggplot()+
  stat_ecdf(data=df_data_pre_A, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  geom_step(data=df_prediction_A, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))+
  scale_x_continuous(limits= c(0, 650), breaks=seq(0, 650, 100))
RMI_A_all_650


#16.3   Subgruppe: pre_stim = V
#16.3.1  Datensatz mit nur Subgruppe pre_stim = V
df_data_pre_V <- subset(df_data_plot, pre_stim == "V")

#16.3.2  F(A)+F(V) erstellen und dem Datensatz zufuegen
# x <- seq(0, 1500, 0.1) # in 1ms Schritten #existiert bereits aus Berechnung fuer gesamt und bleibt gleich fuer die anderen Bedingungen
fa_V <- ecdf(df_data_pre_V$reaction_time[df_data_pre_V$condition =="A"]) #Werte der Verteilungsfunktion von A
fv_V <- ecdf(df_data_pre_V$reaction_time[df_data_pre_V$condition =="V"]) #Werte der Verteilungsfunktion von V
fav_V <- ecdf(df_data_pre_V$reaction_time[df_data_pre_V$condition == "AV"]) # Werte der Verteilungsfunktion von AV
FA_V <- fa_V(x) #Verteilungsfunktion von A zu Zeitpunkt xi
FV_V <- fv_V(x) #Verteilungsfunktion von V zu Zeitpunkt xi
FAV_V <- fav_V(x) #Verteilugnsfunktion von AV zu Zeitpunkt xi
df_prediction_V <- data.frame(x, FA_V, FV_V, FAV_V) #Datensatz erstellen mit ms, F(A), F(V); zu jedem Zeitpunkt x in ms-Schritten von 0-1500
sums_V <- rowSums(df_prediction_V[2:3]) #Summe der 2. und 3. Spalte reihenweise (F(A)+F(V))
df_prediction_V <- as.data.frame(cbind(df_prediction_V, sums_V)) #Summenspalte zum df hinzufuegen
df_prediction_V$sums_V[df_prediction_V$sums_V > 1] = 1 # da Verteilungsfunktion nur bis 1 geht; alle Werte >1 auf =1 setzen
names(df_prediction_V) <- c("ms", "A", "V","AV", "sum") # Spalten im Datensatz benennen

#16.3.3  Diagramm unter Bedingung pre_stim = A, alle Verteilungsfunktionen (_A_all)
## F(A)       - rot
## F(V)       - lila
## F(AV)      - gruen 
## F(A) + F(V)- blau

library(ggplot2)
RMI_V_all <- ggplot()+
  stat_ecdf(data=df_data_pre_V, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  geom_step(data=df_prediction_V, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))
RMI_V_all

RMI_V_all_650 <- ggplot()+
  stat_ecdf(data=df_data_pre_V, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  geom_step(data=df_prediction_V, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))+
  scale_x_continuous(limits= c(0, 650), breaks=seq(0, 650, 100))
RMI_V_all_650

# 16.4   Subgruppe: pre_stim = AV
# 16.4.1 Datensatz mit nur Subgruppe pre_stim = AV
df_data_pre_AV <- subset(df_data_plot, pre_stim == "AV")

# 16.4.2  F(A)+F(V) erstellen und dem Datensatz zufuegen
# x <- seq(0, 1500, 0.1) # in 1ms Schritten #existiert bereits aus Berechnung fuer gesamt und bleibt gleich fuer die anderen Bedingungen
fa_AV <- ecdf(df_data_pre_AV$reaction_time[df_data_pre_AV$condition =="A"]) #Werte der Verteilungsfunktion von A
fv_AV <- ecdf(df_data_pre_AV$reaction_time[df_data_pre_AV$condition =="V"]) #Werte der Verteilungsfunktion von V
fav_AV <- ecdf(df_data_pre_AV$reaction_time[df_data_pre_AV$condition =="AV"]) # Werte der Verteilungsfunktion von AV
FA_AV <- fa_AV(x) #Verteilungsfunktion von A zu Zeitpunkt xi
FV_AV <- fv_AV(x) #Verteilungsfunktion von V zu Zeitpunkt xi
FAV_AV <- fav_AV(x) # Verteilungsfunktion von AV zu Zeitpunkt xi
df_prediction_AV <- data.frame(x, FA_AV, FV_AV, FAV_AV) #Datensatz erstellen mit ms, F(A), F(V); zu jedem Zeitpunkt x in ms-Schritten von 0-1500
sums_AV <- rowSums(df_prediction_AV[2:3]) #Summe der 2. und 3. Spalte reihenweise (F(A)+F(V))
df_prediction_AV <- as.data.frame(cbind(df_prediction_AV, sums_AV)) #Summenspalte zum df hinzufuegen
df_prediction_AV$sums_AV[df_prediction_AV$sums_AV > 1] = 1 # da Verteilungsfunktion nur bis 1 geht; alle Werte >1 auf =1 setzen
names(df_prediction_AV) <- c("ms", "A", "V", "AV", "sum") # Spalten im Datensatz benennen

# 16.4.3  Diagramm unter Bedingung pre_stim = AV
## F(A)       - rot
## F(V)       - lila
## F(AV)      - gruen 
## F(A) + F(V)- blau

library(ggplot2)
RMI_AV_all <- ggplot()+
  stat_ecdf(data=df_data_pre_AV, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  geom_step(data=df_prediction_AV, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))
RMI_AV_all

#gleiches Diagramm mit x-Achse (0,650)
RMI_AV_all_650 <- ggplot()+
  stat_ecdf(data=df_data_pre_AV, aes(x = reaction_time,  colour=condition), geom = "step", size=0.5) +
  labs(title="",
       y = "F(Reaktionszeit)", x="Reaktionszeit (ms)", colour="")+
  theme_classic() + 
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  geom_step(data=df_prediction_AV, aes(x=ms, y=sum, colour = "F(A) + F(V)"), size=0.5) + #das ist die Vorhersage
  scale_color_manual(values =  c("#FF8247", "#458B00", "#63B8FF", "#7A378B"), labels=c("F(A)", "F(AV)", "F(A) + F(V)","F(V)"))+
  scale_x_continuous(limits= c(0, 650), breaks=seq(0, 650, 100))
RMI_AV_all_650