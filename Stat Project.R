data <- read.csv("https://raw.githubusercontent.com/merebullock/STA-371/master/statprojectdata.csv")
View(data)

library(car)
plot(regsubsets(NBA_ppg ~ NCAA_games + position + NCAA_ft + NCAA__3ptpct + NCAA_fgpct + NCAA_ppg + height.inches, data = data), scale = 'adjr2')

#data analytics for NCAA Games indicator variable
plot(nba.ncaa.data$NCAA_games, (nba.ncaa.data$NBA_ppg),
     xlab = 'NCAA Games Played', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA Games Played')
mean(data$NCAA_games)
median(data$data$NCAA_games)
sd(data$data$NCAA_games)
boxplot(data$NCAA_games, horizontal = T)

#data analytics for NCAA Free Throw Percent indicator variable
plot(nba.ncaa.data$NCAA_ftpct, (nba.ncaa.data$NBA_ppg),
     xlab = 'NCAA Free Throw Percent', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA Free Throw Percent')
mean(data$NCAA_ftpct)
median(data$NCAA_ftpct)
sd(data$NCAA_ftpct)
boxplot(data$NCAA_ftpct, horizontal = T)

#data analytics for NCAA 3 Point Percent indicator variable
plot(nba.ncaa.data$NCAA__3ptpct, (nba.ncaa.data$NBA_ppg),
     xlab = 'NCAA 3 Point Percent', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA 3 Point Percent')
mean(data$NCAA__3ptpct)
median(data$NCAA__3ptpct)
sd(data$NCAA__3ptpct)
boxplot(data$NCAA__3ptpct, horizontal = T)

#data analytics for NCAA Field Goal Percentage indicator variable
plot(data$NCAA_fgpct, (data$NBA_ppg),
     xlab = 'NCAA Field Goal Percent', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA Field Goal Percent')
mean(data$NCAA_fgpct)
median(data$NCAA_fgpct)
sd(data$NCAA_fgpct)
boxplot(data$NCAA_fgpct, horizontal = T)

#data anaylytics for NCAA Points Per Game indicator variable
plot(nba.ncaa.data$NCAA_ppg, (nba.ncaa.data$NBA_ppg),
     xlab = 'NCAA Points Per Game', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA Points Per Game')
mean(data$NCAA_ppg)
median(data$NCAA_ppg)
sd(data$NCAA_ppg)
boxplot(data$NCAA_ppg, horizontal = T)

#data analytics for NCAA height in inches indicator variable
plot(nba.ncaa.data$height.inches, (nba.ncaa.data$NBA_ppg),
     xlab = 'NCAA Player Height', ylab = 'NBA Points Per Game',
     col = 'blue', pch = 20,
     main = 'Scatterplot: NCAA Player Height')
mean(data$height.inches)
median(data$height.inches)
sd(data$height.inches)
boxplot(data$height.inches, horizontal = T)

#height.inches and college are not successful in predicting NBA Points Per Game

#remove college because too many categories and remove height because insignificant
model1 <- lm(NBA_ppg ~ NCAA_ftpct + NCAA_fgpct + NCAA_ppg + NCAA__3ptpct + NCAA_games + position, data = data)
summary(model1)

#create interaction
model2 <- lm(NBA_ppg ~ NCAA_ftpct * NCAA_fgpct + NCAA_ppg + NCAA__3ptpct + NCAA_games + position, data = data)
summary(model2)

#remove 3ptpct because not significant, keep interaction
model3 <- lm(NBA_ppg ~ NCAA_ftpct * NCAA_fgpct + NCAA_ppg + NCAA_games, data = data)
summary(model3)

#remove interaction, trasnform free throw percentage
model4 <- lm(NBA_ppg ~ log(NCAA_ftpct) + NCAA_fgpct + NCAA_ppg + NCAA_games, data = data)
summary(model4)

#transform NBA ppg, keep transformation on free throw percentage
model5 <- lm(log(NBA_ppg) ~ log(NCAA_ftpct) + NCAA_fgpct + NCAA_ppg + NCAA_games, data = data)
summary(model5)

#transform NBA ppg, remove transformation on free throw percentage
model6 <- lm(log(NBA_ppg) ~ NCAA_ftpct + NCAA_fgpct + NCAA_ppg + NCAA_games, data = data)
summary(model6)

#remove transformation on NBA ppg; this is our final model with no transformations or interactions
model7 <- lm(NBA_ppg ~ NCAA_ftpct + NCAA_fgpct + NCAA_ppg + NCAA_games, data = data)
summary(model7)

#create model plots
plot(model7, col = 'blue', pch = 20)
plot(resid(model7), ylab = 'Residuals', xlab = 'Model Predictions', col = 'blue', pch = 20)

#create prediction for college player with following stats
predict(model7, list(NCAA_ppg = 16, NCAA_games = 75, NCAA_ftpct = 0.85, NCAA_fgpct = .35), interval = "confidence")

#create confidence interval for coeffecients
confint(model7)


        