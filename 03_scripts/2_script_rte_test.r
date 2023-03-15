### Skript 2 ### Kara Hass, Bachelor-Arbeit, 2023
# Skript 1.1_script_rte_read_in_data_descriptives_dem und 
# Skript 1.2_script_rte_descriptives muessen vor dem Runs dieses Skripts durchgelaufen sein

# 3. RTE-Test
# wissenschaftliche Zahlenschreibweise ausschalten:
options(scipen = 999)

# Vorbereitung: Pakete installieren bzw. laden
pkgs <- c("ggplot2", # fuer Diagramme
          "car", # fuer Shapiro-Wilk-Test
          'stats', #fuer Friedman-Test
          "haven") #fuer Export als .txt in Script 3
# Pakete laden, installieren, falls nicht vorhanden
for (pkg in pkgs){
  if(!require(pkg, character.only = TRUE)){
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

#3.1 Voraussetzungen fuer parametrische Tests testen
# Test auf Normalverteilung mit Shapiro-Wilk-Test
# Wenn nicht signifikant, koennen parametrische Tests genutzt werden (ANOVA, t-Tests)

shapiro.test(subset(agg_data_individual, condition == "A")$median)

shapiro.test(subset(agg_data_individual, condition == "V")$median)

shapiro.test(subset(agg_data_individual, condition == "AV")$median)


#3.2 Gruppen-Unterschiede non-parametrisch testen

#3.2.1 Friedman-Test
# H0: Es besteht kein Unterschied zwischen den Gruppen (A, V, AV)
# H1: Mindestens eine Gruppe unterscheidet sich von den anderen (A, V, AV)

friedman.test(median ~ condition | ID, data=agg_data_individual)

#3.2.2 Post-Hoc-Tests: rechtsseitige Wilcoxon Rangsummen-Tests mit Bonferroni-Korrektur (Signifikanzniveau: 0,05 / 3 = 0,0166667)
## H0: kein Unterschied zwischen A und V oder A < V
## H1: A > V
wilcox.test(subset(agg_data_individual, condition == "A")$median, # H1: ist > als ...
            subset(agg_data_individual, condition == "V")$median, 
            alternative = "greater",
            paired = T, # abhaengig
            exact = T)

## H0: kein Unterschied zwischen A und AV oder AV > A
## H1: A > AV
wilcox.test(subset(agg_data_individual, condition == "A")$median, # H1: ist > als ...
            subset(agg_data_individual, condition == "AV")$median, 
            alternative = "greater",
            paired = T, # abhaengig
            exact = T)

## H0: kein Unterschied zwischen V und AV oder AV > V
## H1: V > AV
wilcox.test(subset(agg_data_individual, condition == "V")$median, # H1: ist > als ...
            subset(agg_data_individual, condition == "AV")$median, 
            alternative = "greater",
            paired = T, # dependent sample, so T
            exact = T)


#3.3 Diagramm: Mittelwerte der Mediane mit Fehlerbalken SEM

#Vorbereitung fuer Fehlerbalken
errorbar_upper_A <- M_A + SEM_A
errorbar_lower_A <- M_A - SEM_A
errorbar_upper_V <- M_V + SEM_V
errorbar_lower_V <- M_V - SEM_V
errorbar_upper_AV <- M_AV + SEM_AV
errorbar_lower_AV <- M_AV - SEM_AV

#Datensatz mit diesen Werten
errorbars_lower <- c(errorbar_lower_A, errorbar_lower_V, errorbar_lower_AV)
errorbars_upper <- c(errorbar_upper_A, errorbar_upper_V, errorbar_upper_AV)

agg_data_all <- as.data.frame(cbind(agg_data_all, errorbars_lower, errorbars_upper))

# Diagramm: Mittelwerte der Mediane mit Fehlerbalken SEM der Mediane
#Times New Roman laden
install.packages("extrafont")
library(extrafont)
font_import() # nimmt einige Zeit in Anspruch, kann uebersprungen werden, wenn Default-Font ausreichend ist
loadfonts(device = "win")

ggplot(agg_data_all, aes(x = condition, 
                                y = M, 
                                color = condition)) +
  geom_point()+
  geom_errorbar(aes(ymin=errorbars_lower, ymax=errorbars_upper, width=.2))+
  ylim(0, 200) +
  # Achsen beschriften
  ylab(label = "Reaktionszeit (ms)") +
  xlab(label = "") +
  # set title
  ggtitle(" ") + 
  # Font-Eigenschaften fuer Achsen:
  theme(text = element_text(family = "Times New Roman"),
        axis.text = element_text(color = "black"),
        axis.title.x = element_text(size = 12), 
        axis.text.x = element_text(size=12),
        axis.title.y = element_text(size = 12), 
        axis.text.y = element_text(size=12),
        plot.title = element_text(size=20, hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
   scale_color_manual(values =  c("#2E8B57", "#00008B", "#CD3333")) +
  theme(legend.position = "none")