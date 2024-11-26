#DELIVERABLE 2: Asier Gomez, Enetz Quindimil, Iker Ibarrola
#In this deliverable we will be analysing different Premier League Statistics from the 2023/2024 season

#install.packages("dplyr")
#library(dplyr)


#Load CSV with accurate crosses
accurate_cross <- read.csv("data/accurate_cross_team.csv")
accurate_cross <- accurate_cross %>% arrange(Team)

#Load CSV with accurate long balls
accurate_long_balls <- read.csv("data/accurate_long_balls_team.csv")
accurate_long_balls <- accurate_long_balls %>% arrange(Team)

#Load CSV with accurate passes 
accurate_passes <- read.csv("data/accurate_pass_team.csv")
accurate_passes <- accurate_passes %>% arrange(Team)

#Load CSV with big chances missed 
big_chances_missed <- read.csv("data/big_chance_missed_team.csv")
big_chances_missed <- big_chances_missed %>% arrange(Team)

#Load CSV with big chances 
big_chances <- read.csv("data/big_chance_team.csv")
big_chances <- big_chances[order(big_chances$Team), ]
big_chances <- big_chances %>% arrange(Team)

#Load CSV with clean sheet 
clean_sheet <- read.csv("data/clean_sheet_team.csv")
clean_sheet <- clean_sheet %>% arrange(Team)

#Load CSV with corner taken  
corner_taken <- read.csv("data/corner_taken_team.csv")
corner_taken <- corner_taken %>% arrange(Team)

#Load CSV with effective clearances  
effective_clearances <- read.csv("data/effective_clearance_team.csv")
effective_clearances <- effective_clearances %>% arrange(Team)

#Load CSV with conceded expected goals  
conceded_expected_goals <- read.csv("data/expected_goals_conceded_team.csv")
conceded_expected_goals <- conceded_expected_goals %>% arrange(Team)

#Load CSV with expected goals  
expected_goals <- read.csv("data/expected_goals_team.csv")
expected_goals <- expected_goals %>% arrange(Team)

#LOAD csv with fk foul lost team
fk_foul <- read.csv("data/fk_foul_lost_team.csv")
fk_foul <- fk_foul %>% arrange(Team)

#LOAD csv with goals conceded team match
goals_conceded <- read.csv("data/goals_conceded_team_match.csv")
goals_conceded <- goals_conceded %>% arrange(Team)

#LOAD csv with interception team
interception_team <- read.csv("data/interception_team.csv")
interception_team <- interception_team %>% arrange(Team)

#LOAD csv with ontarget scoring att team
ontarget_scoring <- read.csv("data/ontarget_scoring_att_team.csv")
ontarget_scoring <- ontarget_scoring %>% arrange(Team)

#LOAD csv with penalty conceded team
penalty_conceded <- read.csv("data/penalty_conceded_team.csv")
penalty_conceded <- penalty_conceded %>% arrange(Team)

#LOAD csv with penalty won team
penalty_won <- read.csv("data/penalty_won_team.csv")
penalty_won <- penalty_won %>% arrange(Team)

#LOAD csv with pl table 2023 24
pl_table_2023_24 <- read.csv("data/pl_table_2023_24.csv")
pl_table_2023_24 <- pl_table_2023_24 %>% arrange(Team)

#Load CSV with premier league table based on away matches  
away_matches_based_table <- read.csv("data/pl_table_away_2023_24.csv")
away_matches_based_table <- away_matches_based_table %>% arrange(Team)

#Load CSV with premier league table based on home matches  
home_matches_based_table <- read.csv("data/pl_table_home_2023_24.csv")
home_matches_based_table <- home_matches_based_table %>% arrange(Team)

#Load CSV with premier league table based on expected goals  
expected_goals_based_table <- read.csv("data/pl_table_xg_2023_24.csv")
expected_goals_based_table <- expected_goals_based_table %>% arrange(Team)

#Load CSV with possession percentage team
possession_percentage_team <- read.csv("data/possession_percentage_team.csv")
possession_percentage_team <- possession_percentage_team %>% arrange(Team)

#Load CSV with possession won att 3rd team
possession_won_att_3rd_team <- read.csv("data/possession_won_att_3rd_team.csv")
possession_won_att_3rd_team <- possession_won_att_3rd_team %>% arrange(Team)

#Load CSV with saves team
saves_team <- read.csv("data/saves_team.csv")
saves_team <- saves_team %>% arrange(Team)

#Load CSV with team goals per match
team_goals_per_match <- read.csv("data/team_goals_per_match.csv")
team_goals_per_match <- team_goals_per_match %>% arrange(Team)

#Load CSV with team ratings
team_ratings <- read.csv("data/team_ratings.csv")
team_ratings <- team_ratings %>% arrange(Team)

#Load CSV with total red card team
total_red_card_team <- read.csv("data/total_red_card_team.csv")
total_red_card_team <- total_red_card_team %>% arrange(Team)

#Load CSV with total yel card team
total_yel_card_team <- read.csv("data/total_yel_card_team.csv")
total_yel_card_team <- total_yel_card_team %>% arrange(Team)

#Load CSV with touches in opp box team
touches_in_opp_box_team <- read.csv("data/touches_in_opp_box_team.csv")
touches_in_opp_box_team <- touches_in_opp_box_team %>% arrange(Team)

#Load CSV with won tackle team
won_tackle_team <- read.csv("data/won_tackle_team.csv")
won_tackle_team <- won_tackle_team %>% arrange(Team)

