#DELIVERABLE 2: Asier Gomez, Enetz Quindimil, Iker Ibarrola
#In this deliverable we will be analysing different Premier League Statistics from the 2023/2024 season

#Load CSV with accurate crosses
accurate_cross <- read.csv("data/accurate_cross_team.csv")
accurate_cross <- accurate_cross[order(accurate_cross$Team), ]

#Load CSV with accurate long balls
accurate_long_balls <- read.csv("data/accurate_long_balls_team.csv")
accurate_long_balls <- accurate_long_balls[order(accurate_long_balls$Team), ]

#Load CSV with accurate passes 
accurate_passes <- read.csv("data/accurate_pass_team.csv")
accurate_passes <- accurate_passes[order(accurate_passes$Team), ]

#Load CSV with big chances missed 
big_chances_missed <- read.csv("data/big_chance_missed_team.csv")
big_chances_missed <- big_chances_missed[order(big_chances_missed$Team), ]

#Load CSV with big chances 
big_chances <- read.csv("data/big_chance_team.csv")
big_chances <- big_chances[order(big_chances$Team), ]

#Load CSV with clean sheet 
clean_sheet <- read.csv("data/clean_sheet_team.csv")
clean_sheet <- clean_sheet[order(clean_sheet$Team), ]

#Load CSV with corner taken  
corner_taken <- read.csv("data/corner_taken_team.csv")
corner_taken <- corner_taken[order(corner_taken$Team), ]

#Load CSV with effective clearances  
effective_clearances <- read.csv("data/effective_clearance_team.csv")
effective_clearances <- effective_clearances[order(effective_clearances$Team), ]

#Load CSV with conceded expected goals  
conceded_expected_goals <- read.csv("data/expected_goals_conceded_team.csv")
conceded_expected_goals <- conceded_expected_goals[order(conceded_expected_goals$Team), ]

#Load CSV with expected goals  
expected_goals <- read.csv("data/expected_goals_team.csv")
expected_goals <- expected_goals[order(expected_goals$Team), ]







#Load CSV with premier league table based on away matches  
away_matches_based_table <- read.csv("data/pl_table_away_2023_24.csv")
away_matches_based_table
away_matches_based_table <- away_matches_based_table[order(away_matches_based_table$Team), ]

#Load CSV with premier league table based on home matches  
home_matches_based_table <- read.csv("data/pl_table_home_2023_24.csv")
home_matches_based_table <- home_matches_based_table[order(home_matches_based_table$Team), ]

#Load CSV with premier league table based on expected goals  
expected_goals_based_table <- read.csv("data/pl_table_xg_2023_24.csv")
expected_goals_based_table <- expected_goals_based_table[order(expected_goals_based_table$Team), ]



