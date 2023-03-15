### Skript 1.1 ### Kara Hass, Bachelor-Arbeit, 2023

# 1. Daten einlesen

# 1.1 Arbeitsverzeichnis einstellen
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_combined_preceding_stim') 


# 1.2 Liste der Datein im Arbeitsverzeichnis
file_list <- list.files(pattern='.csv')


# 1.3 Schleife zum Daten einlesen

# 1.3.1
# Leere Datensaetze zur Vorbereitung
df_data <- data.frame() 
df_demographics <- data.frame()

# 1.3.2 Schleife durch die Datensaetze der einzelnen Versuchspersonen
for (i in 1:length(file_list)) { 
  
  # 1.3.2.1 Datensatz fuer eine Versuchsperson
  subj_df <- read.csv(file_list[i], sep = ",")
  col_gender <- which(names(subj_df) == "sex")
  col_age <- which(names(subj_df) == "age")
  col_occ <- which(names(subj_df) == "occ")
  gender <- subset(subj_df, sender_id == "2_0_0_0")[c(col_gender)]
  age <- subset(subj_df, sender_id == "2_0_0_0")[c(col_age)]
  occ <- subset(subj_df, sender_id == "2_0_0_0") [c(col_occ)]
  
  #1.3.2.2 Dateinahme als ID abspeichern
  id <- file_list[i]
  
  # 1.3.2.3 Reaktionszeiten und Stimulus-Bedingungen
  
  # Positionen der Spalten mit Reaktionszeiten und Namen der Bedingungen
  col_cond <- which(names(subj_df) == "condition")
  col_RTs <- which(names(subj_df) == "duration")
  col_pre_stim <- which(names(subj_df) == "pre_stim")
  
    # Teilauswahl von subj_df
  RT_data <- subset(subj_df, sender == "Reaction")[c(col_cond, col_RTs, col_pre_stim)] 
  RT_data <- as.data.frame(RT_data) # von Matrix zu Dataframe
  
  # Spaltennamenaenderung: "duration" -> "reaction_time
  names(RT_data) <- c("condition", "reaction_time", "pre_stim")
  
  # 1.3.2.4 Alle Trials ausschließen, in denen die Reaktionszeit zu kurz (< 100 ms) oder zu lang (> 700 ms) ist.
  RT_data_clean <- subset(RT_data, reaction_time >= 100 & reaction_time <= 700)
  RT_data_clean <- subset(RT_data_clean, pre_stim != 0) # die ersten Trials zu Beginn jeder VP ausschließen, da fuer spaetere Analyse keine Vorbedingung vorhanden ist
  
  # Wie viele Trials wurden pro Person ausgeschlossen?
  trials_excluded <- length(RT_data$reaction_time) - length(RT_data_clean$reaction_time)
  
    # 1.3.2.5 2 Dataframes erstellen: 
  # einen mit ID, Geschlecht, Alter, Beschaeftigung und ausgeschlossener Trial-Anzahl
  # einen mit Reaktionszeitdaten, Bedingungen und ID
  
  # df 1:
    dem <- as.data.frame(cbind(id, gender, age, occ, trials_excluded))
  names(dem) <- c("id", "gender", "age", "occupation", "trials_excluded")
  
  # zu großem Dataframe hinzufuegen
  df_demographics <- as.data.frame(rbind(df_demographics, dem))
  
  
  # df 2: 
  # ID wiederholen, damit sie in jeder Reaktionszeitzeile auftaucht
  participant_ID <- c(rep(id, times = length(RT_data_clean$condition)))
  # zu RT_data_clean hinzufuegen
  RT_data_clean <- as.data.frame(cbind(participant_ID, RT_data_clean))
  # RT_data_clean zu großem Datensatz hinzufuegen
  df_data <- as.data.frame(rbind(df_data, RT_data_clean))
  
} # Ende der Schleife zum Einlesen der Daten 

# 1.3 Aufraeumen: 
# alles aus Environment loeschen, was nicht mehr benoetigt wird:
rm(list = setdiff(ls(), c("df_data", "df_demographics")))

df_demographics$age <- as.numeric(df_demographics$age) # sicherstellen, dass das Alter als Zahl und nicht als Character abgespeichert ist

# 2. Deskriptive Statistik - Beschreibung der Stichprobe

#Demographische Daten:
summary(df_demographics) # Altersspanne und Md
sd(df_demographics$age) # Standardabweichung Alter
table(df_demographics$gender) # Anzahl je Geschlecht
table(df_demographics$occupation) #Anzahl je Beschaeftigung; 0 = Studium, 1 = Ausbildung, 2 = berufstaetig, 3 = arbeitslos / Arbeit suchend, 4 = etwas anderes