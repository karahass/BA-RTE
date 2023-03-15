### Skript 3.3 ### Kara Hass, Bachelor-Arbeit, 2023
# Dieses Skript laeuft unabhaengig von den vorherigen
# NUR Daten mit Vorbedingung V einlesen fuer Permutationstest nach Gondan & Minakata (2016)

# 7.1 Arbeitsverzeichnis einstellen
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_combined_preceding_stim') 


# 7.2 Liste der Dateien
file_list <- list.files(pattern='.csv')

# 7.3 Loop durch einzelne Dateien zum einlesen

# 7.3.1
# Leere Dataframes als Platzhalter fuer die kommende Information
df_data_p_V <- data.frame() 

# 7.3.2 loop durch VP-Dateien:
for (i in 1:length(file_list)) {
  
  # 7.3.2.1 Dataframe fuer eine VP
  subj_df <- read.csv(file_list[i], sep = ",")
  
  # 7.3.2.2 Dateinamen als ID hinzufuegen, da nicht im Datensatz enthalten
  id <- file_list[i]
  
  # 7.3.2.3 Reaktionszeit und Bedingung holen:

  col_cond <- which(names(subj_df) == "condition")
  col_RTs <- which(names(subj_df) == "duration")
  col_pre_stim <- which(names(subj_df) == "pre_stim")
  RT_data <- subset(subj_df, sender == "Reaction")[c(col_cond, col_RTs, col_pre_stim)]
  
  RT_data <- as.data.frame(RT_data)
  
  #umbenennen "duration" -> "reaction_time
  names(RT_data) <- c("condition", "reaction_time", "pre_stim")
  
  # 7.3.2.4 Nach Gondan & Minakata (2016) die grossen Reaktionszeiten auf unendlich setzen, die zu kurzen Reaktionszeiten bleiben drin
  RT_data$reaction_time[RT_data$reaction_time > 1500] = Inf
  
  # 7.3.2.5 Datenatz erstellen

  participant_ID <- c(rep(id, times = length(RT_data$condition)))
  RT_data <- as.data.frame(cbind(participant_ID, RT_data))
  df_data_p_V <- as.data.frame(rbind(df_data_p_V, RT_data))
  
} # Ende der Schleife 

# nur die mit V als Vorbedingung
df_data_p_V <- subset(df_data_p_V, pre_stim == "V")
df_data_p_V <- subset(df_data_p_V, select = -pre_stim) #Pre_Stim-Spalte aus Datensatz loeschen (ist hier ja konstant V)

# 8. Bereitmachen fur RMI Skript von Gondan & Minakata
# 8.1 Spalten richtig benennen: Obs (<- participant_ID), Cond (<- condition), RT (<- reaction_time) 
names(df_data_p_V) <- c("Obs", "Cond", "RT")

# 8.2 Versuchspersonencodes in Nummern von 1 bis 20 umwandeln
df_data_p_V$Obs[df_data_p_V$Obs == "AN02EC04--2022-07-04--19_00_40_cp.csv"] <- 1
df_data_p_V$Obs[df_data_p_V$Obs == "AS16NO12-2022-06-03--13_17_09_cp.csv"] <- 2
df_data_p_V$Obs[df_data_p_V$Obs == "AS19EL28--2022-06-24--14_45_04_cp.csv"] <- 3
df_data_p_V$Obs[df_data_p_V$Obs == "ED06EC24--2022-06-27--18_25_07_cp.csv"] <- 4
df_data_p_V$Obs[df_data_p_V$Obs == "EL27SE03--2022-07-04--18_12_21_cp.csv"] <- 5
df_data_p_V$Obs[df_data_p_V$Obs == "ER26BE31--2022-07-04--17_37_00_cp.csv"] <- 6
df_data_p_V$Obs[df_data_p_V$Obs == "HA25HA07--2022-07-18--17_16_42_cp.csv"] <- 7
df_data_p_V$Obs[df_data_p_V$Obs == "ND07NU02--2022-07-15--17_21_31_cp.csv"] <- 8
df_data_p_V$Obs[df_data_p_V$Obs == "NG02KI18--2022-07-14--18_10_00_cp.csv"] <- 9
df_data_p_V$Obs[df_data_p_V$Obs == "NG06HE06--2022-06-27--17_37_07_cp.csv"] <- 10
df_data_p_V$Obs[df_data_p_V$Obs == "PH24AA18--2022-06-24--14_09_10_cp.csv"] <- 11
df_data_p_V$Obs[df_data_p_V$Obs == "RD28KI25-2022-06-10--18_12_42_cp.csv"] <- 12
df_data_p_V$Obs[df_data_p_V$Obs == "RT21GR26--2022-07-11--17_49_48_cp.csv"] <- 13
df_data_p_V$Obs[df_data_p_V$Obs == "UT01KI10-2022-06-03--14_53_29_cp.csv"] <- 14
df_data_p_V$Obs[df_data_p_V$Obs == "UT10HA20--2022-07-14--17_46_55_cp.csv"] <- 15
df_data_p_V$Obs[df_data_p_V$Obs == "UT29PI01-2022-06-10--17_44_35_cp.csv"] <- 16
df_data_p_V$Obs[df_data_p_V$Obs == "WE26MA16--2022-07-01--14_04_56_cp.csv"] <- 17
df_data_p_V$Obs[df_data_p_V$Obs == "WE27EC21--2022-07-04--18_48_03_cp.csv"] <- 18
df_data_p_V$Obs[df_data_p_V$Obs == "XXXXIRXX--2022-06-24--13_38_54_cp.csv"] <- 19
df_data_p_V$Obs[df_data_p_V$Obs == "XXXXXXXX--2022-07-01--13_57_10_cp.csv"] <- 20
df_data_p_V$Obs <- as.integer(df_data_p_V$Obs)

# Arbeitsverzeichnis neu einstellen; Unterordner 01_perm
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_perm') 

#Fuer Permutationstest-Skript als .txt abspeichern: write.table ueber haven-Paket
library(haven)
write.table(df_data_p_V, file="perm_data_V.txt", dec=".", sep="\t")

