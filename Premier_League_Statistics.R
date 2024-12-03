#DELIVERABLE 2: Asier Gomez, Enetz Quindimil, Iker Ibarrola
#In this deliverable we will be analysing different Premier League Statistics from the 2023/2024 season

#install.packages("dplyr")
library(dplyr)
library(purrr)

#2. LOADING THE DATASET INTO THE ENVIRONMENT
#As there are several csv from which we are going to extract the data, we will have to do it in different steps

#Load CSV with accurate crosses
accurate_cross <- read.csv("data/accurate_cross_team.csv")

#Load CSV with accurate long balls
accurate_long_balls <- read.csv("data/accurate_long_balls_team.csv")

#Load CSV with accurate passes 
accurate_passes <- read.csv("data/accurate_pass_team.csv")

#Load CSV with big chances missed 
big_chances_missed <- read.csv("data/big_chance_missed_team.csv")

#Load CSV with big chances 
big_chances <- read.csv("data/big_chance_team.csv")

#Load CSV with clean sheet 
clean_sheet <- read.csv("data/clean_sheet_team.csv")

#Load CSV with corner taken  
corner_taken <- read.csv("data/corner_taken_team.csv")

#Load CSV with effective clearances  
effective_clearances <- read.csv("data/effective_clearance_team.csv")

#Load CSV with conceded expected goals  
conceded_expected_goals <- read.csv("data/expected_goals_conceded_team.csv")

#Load CSV with expected goals  
expected_goals <- read.csv("data/expected_goals_team.csv")

#LOAD csv with fk foul lost team
fk_foul <- read.csv("data/fk_foul_lost_team.csv")

#LOAD csv with goals conceded team match
goals_conceded <- read.csv("data/goals_conceded_team_match.csv")

#LOAD csv with interception team
interception_team <- read.csv("data/interception_team.csv")

#LOAD csv with ontarget scoring att team
ontarget_scoring <- read.csv("data/ontarget_scoring_att_team.csv")

#LOAD csv with penalty conceded team
penalty_conceded <- read.csv("data/penalty_conceded_team.csv")

#LOAD csv with penalty won team
penalty_won <- read.csv("data/penalty_won_team.csv")

#LOAD csv with pl table 2023 24
pl_table_2023_24 <- read.csv("data/pl_table_2023_24.csv")

#Load CSV with premier league table based on away matches  
away_matches_based_table <- read.csv("data/pl_table_away_2023_24.csv")

#Load CSV with premier league table based on home matches  
home_matches_based_table <- read.csv("data/pl_table_home_2023_24.csv")

#Load CSV with premier league table based on expected goals  
expected_goals_based_table <- read.csv("data/pl_table_xg_2023_24.csv")

#Load CSV with possession percentage team
possession_percentage_team <- read.csv("data/possession_percentage_team.csv")

#Load CSV with possession won att 3rd team
possession_won_att_3rd_team <- read.csv("data/possession_won_att_3rd_team.csv")

#Load CSV with saves team
saves_team <- read.csv("data/saves_team.csv")

#Load CSV with team goals per match
team_goals_per_match <- read.csv("data/team_goals_per_match.csv")

#Load CSV with team ratings
team_ratings <- read.csv("data/team_ratings.csv")

#Load CSV with total red card team
total_red_card_team <- read.csv("data/total_red_card_team.csv")

#Load CSV with total yeñpwl card team
total_yel_card_team <- read.csv("data/total_yel_card_team.csv")

#Load CSV with touches in opp box team
touches_in_opp_box_team <- read.csv("data/touches_in_opp_box_team.csv")

#Load CSV with won tackle team
won_tackle_team <- read.csv("data/won_tackle_team.csv")

#3. DATA CLEANING (No need to change anything. Better explanation in the documentation)
#Still, we will check that there are no na values our outliers
is.na(touches_in_opp_box_team)

#4. DATA INTEGRATION
#create a list with all the data frames
dataframes <- list(
  pl_table_2023_24,
  away_matches_based_table,
  home_matches_based_table,
  expected_goals_based_table,
  accurate_cross,
  accurate_long_balls,
  accurate_passes,
  big_chances_missed,
  big_chances,
  clean_sheet,
  corner_taken,
  effective_clearances,
  conceded_expected_goals,
  expected_goals,
  fk_foul,
  goals_conceded,
  interception_team,
  ontarget_scoring,
  penalty_conceded,
  penalty_won,
  possession_percentage_team,
  possession_won_att_3rd_team,
  saves_team,
  team_goals_per_match,
  team_ratings,
  total_red_card_team,
  total_yel_card_team,
  touches_in_opp_box_team,
  won_tackle_team
)

#Delete the columns that are repeated in all the data frames (or the ones that we don't consider important)
cleaning <- function(x){
  if ("Rank" %in% colnames(x)){
    x$Rank <- NULL
  }
  if ("Matches" %in% colnames(x)){
    x$Matches <- NULL  
    }
  if ("Country" %in% colnames(x)){
    x$Country <- NULL
  }
  if ("played" %in% colnames(x)){
    x$played <- NULL
  }
  return(x)
}

#Apply the function to all the dataframes
dataframes <- lapply(dataframes, cleaning)
dataframes[[1]]

#Join them by the team column (using reduce to concatenate the results of each "iteration")
combined_df <- reduce(dataframes, full_join, by = "Team")
combined_df

#5. DATA TRANSFORMATION

#Function to return the provided metric ordered
order_column <- function(df, name_of_column, decreasing = F, full_dataframe = F){
  if (!name_of_column %in% colnames(df)){
    return ("The column is not present in the provided dataframe")
  }
  df_sorted <- df[order(df[[name_of_column]], decreasing = decreasing), ]
  if (full_dataframe){
    return(df_sorted)
  }
  return(df_sorted$Team)  # Return the sorted data frame  # Return the sorted column
}

#order_column(combined_df, "total_goalConDiff")

#Add a column with the percentaje of missed big chances
combined_df <- mutate(combined_df, big_chances_missed_percentaje = round(combined_df$Big.Chances.Missed / combined_df$Big.Chances, 2))

#Add a column with the percentaje of clean sheets 
combined_df <- mutate(combined_df, clean_sheets_percentaje = round(combined_df$Clean.Sheets / 38, 2))

#Get a data frame with the teams that has a value higher than the mean in an expecific parameter
above_media <- function(df,p){
  if(p %in% colnames(df)){
    mean_pd <- summarize(df,mean_p = mean(df$p))
    df <- filter(df,df$p > mean_pd$mean_p)
    return(df)
  }
  return (NULL)
}

#above_media(combined_df, "total_wins")

#Get a data frame with just the columns wanted
select_col <- function(df,...){
  args <- as.character(c(...))
  args_f <- args[args %in% colnames(df)]
  args_f <- c("Team", args_f)
  sub_df <- df %>% select(all_of(args_f))
  return(sub_df)
}

#select_col(combined_df, "total_wins", "total_draws", "total_losses")

#Function to calculate the dirtiest team
dirty_index <- function(x = 1, y = 2, z = 4) {
  combined_df$dirty_index <- combined_df$Fouls.per.Match * x + combined_df$Yellow.Cards * y + combined_df$Red.Cards.y * z
  return(combined_df)
}

combined_df <- dirty_index()

#Calculate expected goals difference, expected goals conceded difference and expected xg difference
combined_df <- mutate(combined_df, xgGoalsDiff = combined_df$Goals - combined_df$xg)
combined_df <- mutate(combined_df, xgConcededDiff = combined_df$Goals.Conceded - combined_df$xgConceded)
combined_df <- mutate(combined_df, xgDiff = combined_df$xg - combined_df$xgConceded)
combined_df