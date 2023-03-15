### Skript 4.2 ### Kara Hass, Bachelor-Arbeit, 2023
# Skript 3.2_script_rmi_read_in_data_A muss durchgelaufen sein, vor Run dieses Skripts
# RMI-Permutationstest nur Vorbedingung A

# Dieses Skript basiert auf dem von Gondan & Minakata (2016) zur Verfuegung gestellten Skript:
# A tutorial on testing the race model inequality
#
# Supplemental material: Permutation test in R (Inequality 6)

# 12.1 Arbeitsverzeichnis
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_perm')

# 12.2 tmax Statistik Funktion uebernommen von Gondan & Minakata 2015

tmax = function(di)
{
  # t-Tests fuer jedes Perzentil
  tvalues = rowMeans(di) / apply(di, 1, sd) * sqrt(ncol(di))
  max(tvalues)
} # tmax

# 12.3 Der Signifikanztest - Permutationstest
#
# - d: Liste (nicht Datensatz!) mit Daten aller Vp
# - q: Quantile, an denen RMI getestet werden soll
# - nperm: Zahl der Permutationen, mit denen H0 simuliert werden soll
# - returns: tmax, kritischer Wert fuer einseitigen Test, p-Wert

rmiperm = function(d, q=seq(.05, .45, by=.05), nperm=10001) # 10.001 Permutationen
{
  # Quantile bestimmen aus Gesamtheit der Reaktionszeiten
  tmix     = lapply(d, unlist) 
  t        = lapply(tmix, function(x) quantile(x[x < Inf], q))
  
  # Verteilungsfunktionen schaetzen zu Zeitpunkt t
  FAV      = mapply(function(ti, qi) ecdf(ti$AV)(qi), d, t)
  FA       = mapply(function(ti, qi) ecdf(ti$A)(qi), d, t)
  FV       = mapply(function(ti, qi) ecdf(ti$V)(qi), d, t)
  
  # Bestimme di = FAV(t) - FA(t) - FV(t)
  di = matrix(FAV-FA-FV, nrow=length(q), ncol=length(d))
  
  # Empirische/Beobachtete Teststatistik
  stat     = tmax(di)
  
  # Permutationsverteilung der Teststatistik
  stati = numeric(nperm)
  for(i in 1:nperm)
    stati[i] = tmax(di %*% diag(sign(rnorm(d))))
  
  # Zusammenfassung grundsaetzlicher Statistiken 
  md        = function(x) median(x[x < Inf])
  mn        = function(x) mean(x[x < Inf])
  pc        = function(x) 100*mean(x < Inf)
  
  Median    = rowMeans(sapply(d, function(x) sapply(x, md)))
  Mean      = rowMeans(sapply(d, function(x) sapply(x, mn)))
  `Detect%` = rowMeans(sapply(d, function(x) sapply(x, pc)))
  
  list(Summary=round(rbind(Median, Mean, `Detect%`)), 
       Perm=round(c(tmax=stat, 
                    crit=quantile(stati, probs=0.95), 
                    P=mean(stat <= stati)), 20))
} # rmiperm

# 12.4 Daten einlesen aus txt-Datei
#
# Obs: Observer (= Vp)
# Cond: Condition (= Bedingung A, V oder AV)
# RT: Reaktionszeit (Inf: ausgelassene Antwort)
#
# Voraussetzungen Datensatz fuer dieses Skript des Permutationstests:
# Obs Cond   RT  # Diese Ueberschriften sollten vorhanden sein
#   1    A  245  # Response to A
#   1    V  281  # Response to V
#   1   AV  212  # Response to AV
#   1    V  Inf  # Omitted response to V
#   ...

rmiread = function(fname)
{
  d = read.table(fname, header=TRUE)
  Obs = split(d[, c('Cond', 'RT')], d$Obs)
  lapply(Obs, function(x) split(x$RT, x$Cond))
} # rmiread

# 12.5 Anwendung Permutationstest auf Datensatz

data_p_A = rmiread("perm_data_A.txt")
rmiperm(data_p_A)