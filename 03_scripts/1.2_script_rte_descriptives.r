### Skript 1.2 ### Kara Hass, Bachelor-Arbeit, 2023
# Skript 1.1_script_rte_read_in_data_descriptives_dem muss vor dem Runs dieses Skripts durchgelaufen sein

# 2. Deskriptive Statistik - Redundant-Target-Effekt

# 2.1 Median der Reaktionszeit und Standardabweichung fuer jede Versuchsperson in allen 3 Bedingungen (A, V, AV) 
agg_data_individual = aggregate(df_data$reaction_time,
                                    by = list(df_data$participant_ID, 
                                              df_data$condition),
                                    FUN = median)

SD_individual = aggregate(df_data$reaction_time,
                          by = list(df_data$participant_ID, 
                                    df_data$condition),
                          FUN = sd)$x
# beide zusammenfuegen:
agg_data_individual <- as.data.frame(cbind(agg_data_individual, SD_individual))

# Spalten benennen:
names(agg_data_individual) <- c("ID", "condition", "median", "SD")

#n pro Versuchsperson pro Bedingung fuer Tabelle im Anhang A:
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "AN02EC04--2022-07-04--19_00_40_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "AN02EC04--2022-07-04--19_00_40_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "AN02EC04--2022-07-04--19_00_40_cp.csv"]) #fuer jede VP-ID
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "AS16NO12-2022-06-03--13_17_09_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "AS16NO12-2022-06-03--13_17_09_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "AS16NO12-2022-06-03--13_17_09_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "AS19EL28--2022-06-24--14_45_04_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "AS19EL28--2022-06-24--14_45_04_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "AS19EL28--2022-06-24--14_45_04_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "ED06EC24--2022-06-27--18_25_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "ED06EC24--2022-06-27--18_25_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "ED06EC24--2022-06-27--18_25_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "EL27SE03--2022-07-04--18_12_21_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "EL27SE03--2022-07-04--18_12_21_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "EL27SE03--2022-07-04--18_12_21_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "ER26BE31--2022-07-04--17_37_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "ER26BE31--2022-07-04--17_37_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "ER26BE31--2022-07-04--17_37_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "HA25HA07--2022-07-18--17_16_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "HA25HA07--2022-07-18--17_16_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "HA25HA07--2022-07-18--17_16_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "ND07NU02--2022-07-15--17_21_31_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "ND07NU02--2022-07-15--17_21_31_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "ND07NU02--2022-07-15--17_21_31_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "NG02KI18--2022-07-14--18_10_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "NG02KI18--2022-07-14--18_10_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "NG02KI18--2022-07-14--18_10_00_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "NG06HE06--2022-06-27--17_37_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "NG06HE06--2022-06-27--17_37_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "NG06HE06--2022-06-27--17_37_07_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "PH24AA18--2022-06-24--14_09_10_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "PH24AA18--2022-06-24--14_09_10_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "PH24AA18--2022-06-24--14_09_10_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "RD28KI25-2022-06-10--18_12_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "RD28KI25-2022-06-10--18_12_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "RD28KI25-2022-06-10--18_12_42_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "RT21GR26--2022-07-11--17_49_48_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "RT21GR26--2022-07-11--17_49_48_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "RT21GR26--2022-07-11--17_49_48_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "UT01KI10-2022-06-03--14_53_29_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "UT01KI10-2022-06-03--14_53_29_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "UT01KI10-2022-06-03--14_53_29_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "UT10HA20--2022-07-14--17_46_55_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "UT10HA20--2022-07-14--17_46_55_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "UT10HA20--2022-07-14--17_46_55_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "UT29PI01-2022-06-10--17_44_35_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "UT29PI01-2022-06-10--17_44_35_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "UT29PI01-2022-06-10--17_44_35_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "WE26MA16--2022-07-01--14_04_56_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "WE26MA16--2022-07-01--14_04_56_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "WE26MA16--2022-07-01--14_04_56_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "WE27EC21--2022-07-04--18_48_03_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "WE27EC21--2022-07-04--18_48_03_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "WE27EC21--2022-07-04--18_48_03_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "XXXXIRXX--2022-06-24--13_38_54_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "XXXXIRXX--2022-06-24--13_38_54_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "XXXXIRXX--2022-06-24--13_38_54_cp.csv"])
length(df_data$reaction_time[df_data$condition == "A" & df_data$participant_ID == "XXXXXXXX--2022-07-01--13_57_10_cp.csv"])
length(df_data$reaction_time[df_data$condition == "V" & df_data$participant_ID == "XXXXXXXX--2022-07-01--13_57_10_cp.csv"])
length(df_data$reaction_time[df_data$condition == "AV" & df_data$participant_ID == "XXXXXXXX--2022-07-01--13_57_10_cp.csv"])


# 2.2 Mittelwerte, Standardabweichungen, Standardschaetzfehler der Mediane der Reaktionszeiten
M_A <- mean(agg_data_individual$median[agg_data_individual$condition == "A"]) # Mittelwert der Mediane der einzelnen VP der Bedingung A
M_V <- mean(agg_data_individual$median[agg_data_individual$condition == "V"]) # Mittelwert der Mediane der einzelnen VP der Bedingung V
M_AV <- mean(agg_data_individual$median[agg_data_individual$condition == "AV"]) # Mittelwert der Mediane der einzelnen VP der Bedingung AV
SD_A <- sd(agg_data_individual$median[agg_data_individual$condition == "A"]) # SD der Mediane der einzelnen VP der Bedingung A
SD_V <- sd(agg_data_individual$median[agg_data_individual$condition == "V"]) # SD der Mediane der einzelnen VP der Bedingung V
SD_AV <- sd(agg_data_individual$median[agg_data_individual$condition == "AV"]) # SD der Mediane der einzelnen VP der Bedingung AV
SEM_A <- SD_A / sqrt(length(agg_data_individual$median[agg_data_individual$condition == "A"])) #SEM der Mediane der einzelnen VP der Bedingung A
SEM_V <- SD_V / sqrt(length(agg_data_individual$median[agg_data_individual$condition == "V"])) #SEM der Mediane der einzelnen VP der Bedingung V
SEM_AV <- SD_AV / sqrt(length(agg_data_individual$median[agg_data_individual$condition == "AV"])) # SEM der Mediane der einzelnen VP der Bedingung AV
#in einen Datensatz packen
M <- c(M_A, M_V, M_AV)
SD <- c(SD_A, SD_V, SD_AV)
SEM <- c(SEM_A, SEM_V, SEM_AV)
condition <- c("A", "V", "AV")
agg_data_all <- as.data.frame(cbind(condition, M, SD, SEM))
names(agg_data_all) <- c("condition", "M", "SD", "SEM")
agg_data_all$M <- as.numeric(agg_data_all$M)
agg_data_all$SD <- as.numeric(agg_data_all$SD)
agg_data_all$SEM <- as.numeric(agg_data_all$SEM)

# 2.3 Aufraeumen: 
# alles aus Environment loeschen, was nicht mehr benoetigt wird:
rm(list = setdiff(ls(), c("df_data", "df_demographics", "agg_data_individual", "agg_data_all", "M_A", "M_V", "M_AV", "SEM_A", "SEM_V", "SEM_AV")))