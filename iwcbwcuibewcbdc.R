#DELIVERABLE 2: Asier Gomez, Enetz Quindimil, Iker Ibarrola
#In this deliverable we will be analysing different Premier League Statistics from the 2023/2024 season

#Load CSV with possession percentage team
possession_percentage_team <- read.csv("data/possession_percentage_team.csv")
possession_percentage_team <- possession_percentage_team[order(possession_percentage_team$Team), ]

#Load CSV with possession won att 3rd team
possession_won_att_3rd_team <- read.csv("data/possession_won_att_3rd_team.csv")
possession_won_att_3rd_team <- possession_won_att_3rd_team[order(possession_won_att_3rd_team$Team), ]

#Load CSV with saves team
saves_team <- read.csv("data/saves_team.csv")
saves_team <- saves_team[order(saves_team$Team), ]

#Load CSV with team goals per match
team_goals_per_match <- read.csv("data/team_goals_per_match.csv")
team_goals_per_match <- team_goals_per_match[order(team_goals_per_match$Team), ]

#Load CSV with team ratings
team_ratings <- read.csv("data/team_ratings.csv")
team_ratings <- team_ratings[order(team_ratings$Team), ]

#Load CSV with total red card team
total_red_card_team <- read.csv("data/total_red_card_team.csv")
total_red_card_team <- total_red_card_team[order(total_red_card_team$Team), ]

#Load CSV with total yel card team
total_yel_card_team <- read.csv("data/total_yel_card_team.csv")
total_yel_card_team <- total_yel_card_team[order(total_yel_card_team$Team), ]

#Load CSV with touches in opp box team
touches_in_opp_box_team <- read.csv("data/touches_in_opp_box_team.csv")
touches_in_opp_box_team <- touches_in_opp_box_team[order(touches_in_opp_box_team$Team), ]

#Load CSV with won tackle team
won_tackle_team <- read.csv("data/won_tackle_team.csv")
won_tackle_team <- won_tackle_team[order(won_tackle_team$Team), ]
won_tackle_team

# Define the function
removeColumns <- function(df, removableColumns) {
  # Use foreach to iterate over the list of data frames
  updateddf <- foreach(df) %do% {
    # Ensure df is a data frame
    if (!is.data.frame(df)) return(NULL)
    
    # Remove specified columns if they exist
    df <- df[ , !(names(df) %in% removableColumns), drop = FALSE]
    return(df)
  }
  
  return(updateddf)
}

result <- (list(possession_percentage_team, possession_won_att_3rd_team, saves_team, team_goals_per_match, team_ratings, total_red_card_team, total_yel_card_team, touches_in_opp_box_team, won_tackle_team), c("Matches", "played", "Country"))