# RTE Script Kara Hass (stu214923@mail.uni-kiel.de) (07/2022) on the basis of the script of Merle Schuckart (merle.schuckart@gmx.de) 03/2022

# 1. reading in data

# 1.1 set working directory
setwd('C:/Users/Kaks/Documents/Studium/Psychologie/PSY_B_K Forschungskolloquium/01_combined') 


# 1.2 get the list of files in the directory
file_list <- list.files(pattern='.csv')

# 1.3 loop through files to read in data

# 1.3.1
# create empty dataframes as placeholder for the df where you collect all our data & one for the demographic information
df_data <- data.frame() 
df_demographics <- data.frame()

# 1.3.2 loop datasets aka participants:
for (i in 1:length(file_list)) { # for the number of files in our directory...
  
  # 1.3.2.1 get dataframe for one participant
  subj_df <- read.csv(file_list[i], sep = ",")
  
  #1.3.2.2 add filename as id because there's no id in the set
  id <- file_list[i]
  
  # 1.3.2.3 now get data (RTs and condition names):
  
  # get position of column with reaction times (durations) and condition names
  col_cond <- which(names(subj_df) == "condition")
  col_RTs <- which(names(subj_df) == "duration")
  # get only a part of subj_df
  RT_data <- subset(subj_df, sender == "Reaction")[c(col_cond, col_RTs)] # get only a part of subj_df
  # covert  RT_data to a dataframe
  RT_data <- as.data.frame(RT_data)
  
  #rename "duration" -> "reaction_time
  names(RT_data) <- c("condition", "reaction_time")
  
  # 1.3.2.4 exclude all trials in which the reaction time is either too short (< 100 ms) or too long (> 700 ms). If the participant didn't react, the RT is 1500 ms, so we kick non-reactions out as well with these criteria.
  RT_data_clean <- subset(RT_data, reaction_time >= 100 & reaction_time <= 700)
  
  # number of trials that were excluded because they were too short or too long
  trials_excluded <- length(RT_data$reaction_time) - length(RT_data_clean$reaction_time)
  
  # 1.3.2.5 create 2 dfs: 
  # one with id & number of excluded trials, 
  # one with the RT-data, conditions and IDs.
  
  # df 1:
  # combine all information collecteded about the participant in a df  
  dem <- as.data.frame(cbind(id, trials_excluded))
  
  # add to big df with all participants as new row, so there's 1 row for each participant
  df_demographics <- as.data.frame(rbind(df_demographics, dem))
  
  
  # df 2: create a vector that contains the subject id, but repeat it so there's 1 value for each row in RT_data_clean:
  participant_ID <- c(rep(id, times = length(RT_data_clean$condition)))
  # append the ID vector to RT_data_clean 
  RT_data_clean <- as.data.frame(cbind(participant_ID, RT_data_clean))
  # append RT_data_clean to big df containing data from all participants
  df_data <- as.data.frame(rbind(df_data, RT_data_clean))
  
} # END loop files in directory  

# 1.3 clean up a: 
# remove everything from environment except for the things still needed
rm(list = setdiff(ls(), c("df_data", "df_demographics")))

# 2. descriptive Statistics

# 2.1 get median RT of RTs for each participant in each of the 3 conditions (A, V and VA):

# aggregate data:

agg_data = aggregate(df_data$reaction_time,
                     by = list(df_data$participant_ID, 
                               df_data$condition),
                     FUN = median)

SD = aggregate(df_data$reaction_time,
               by = list(df_data$participant_ID, 
                         df_data$condition),
               FUN = sd)$x
# bind them together
agg_data <- as.data.frame(cbind(agg_data, SD))

# name columns:
names(agg_data) <- c("ID", "condition", "median", "SD")

#agg_data contains median and sd for any chosen participant in the three conditions
