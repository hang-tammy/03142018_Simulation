result.scores <- transmute(scores, 
                    hometeam = HomeTeam, 
                    Homegoals = HomeGoal,
                    awaygoals = AwayGoal,
                    Result = Result)

result.scores <- result.scores %>% group_by(hometeam) %>% count(n=(Result))
result.scores$Location <- result.scores$n
result.scores$WinCount<- result.scores$nn


result.scores <- (result.scores %>% 
              filter(Location == "H") %>% 
                arrange(desc(WinCount)))

result.scores2 <- select(result.scores, 
                                hometeam = hometeam,
                                Location = Location,
                                WinCount= WinCount)
# home wins ratio 
result.scores2$homewin.ratio <- (result.scores2$WinCount/HomeStats$GP)

   
plot(result, sort(rounds)

     