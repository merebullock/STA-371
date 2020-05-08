all.nba.data <- read.csv('https://query.data.world/s/dpwb62nlk2jzaodjea7guzwy6tnbdt')

#assign correct height to data point that's missing it
all.nba.data$height[all.nba.data$name == 'George Karl'] <- '6-2'

#subset data with first column removed
nba.data <- all.nba.data[-c(1)]

nba.data$position[nba.data$position == 'F-C'] <- 'C-F'
nba.data$position[nba.data$position == 'F-G'] <- 'G-F'


#create blank column, set all data points as 0
nba.data$height.inches <- 0

#if string height matches then assign correlating numeric height
nba.data$height.inches[nba.data$height == '5-3'] <- 63
nba.data$height.inches[nba.data$height == '5-4'] <- 64
nba.data$height.inches[nba.data$height == '5-5'] <- 65
nba.data$height.inches[nba.data$height == '5-6'] <- 66
nba.data$height.inches[nba.data$height == '5-7'] <- 67
nba.data$height.inches[nba.data$height == '5-8'] <- 68
nba.data$height.inches[nba.data$height == '5-9'] <- 69
nba.data$height.inches[nba.data$height == '5-10'] <- 70
nba.data$height.inches[nba.data$height == '5-11'] <- 71
nba.data$height.inches[nba.data$height == '6-0'] <- 72
nba.data$height.inches[nba.data$height == '6-1'] <- 73
nba.data$height.inches[nba.data$height == '6-2'] <- 74
nba.data$height.inches[nba.data$height == '6-3'] <- 75
nba.data$height.inches[nba.data$height == '6-4'] <- 76
nba.data$height.inches[nba.data$height == '6-5'] <- 77
nba.data$height.inches[nba.data$height == '6-6'] <- 78
nba.data$height.inches[nba.data$height == '6-7'] <- 79
nba.data$height.inches[nba.data$height == '6-8'] <- 80
nba.data$height.inches[nba.data$height == '6-9'] <- 81
nba.data$height.inches[nba.data$height == '6-10'] <- 82
nba.data$height.inches[nba.data$height == '6-11'] <- 83
nba.data$height.inches[nba.data$height == '7-0'] <- 84
nba.data$height.inches[nba.data$height == '7-1'] <- 85
nba.data$height.inches[nba.data$height == '7-2'] <- 86
nba.data$height.inches[nba.data$height == '7-3'] <- 87
nba.data$height.inches[nba.data$height == '7-4'] <- 88
nba.data$height.inches[nba.data$height == '7-5'] <- 89
nba.data$height.inches[nba.data$height == '7-6'] <- 90
nba.data$height.inches[nba.data$height == '7-7'] <- 91

#convert height into ints from factor
nba.data$height.inches <- as.integer(nba.data$height.inches)
View(nba.data)
nba.ncaa.data <- subset(nba.data, active_from >= 2004 & active_from <= 2010 & college != '' & NCAA__3ptpct != 'NA' & NCAA_ft != 'NA' & NCAA_fgpct != 'NA' & NCAA_ppg > 0 & position != 'NA')

View(nba.ncaa.data)


#nba.ncaa.data is the data that will be used in the regression analysis

model <- lm(NBA_ppg ~ position + college + NCAA_games + NCAA__3ptpct + NCAA_ppg + height.inches + NCAA_fgpct + NCAA_ft, data = nba.ncaa.data)
summary(model)
anova(model)


library(leaps)
plot(regsubsets(NBA_ppg ~ NCAA_games + NCAA_ft + NCAA__3ptpct + NCAA_fgpct + NCAA_ppg + height.inches, data = nba.ncaa.data), scale = 'adjr2')

model2 <- lm(sqrt(NBA_ppg) ~ NCAA_games  + NCAA_ppg + position, data = nba.ncaa.data)
summary(model2)
plot(model2)
plot(sqrt(NBA_ppg) ~ NCAA_games  + NCAA_ppg + position, data = nba.ncaa.data)
library(car)
vif(model2)
cor(nba.ncaa.data$NCAA_ppg, nba.ncaa.data$NCAA__3ptpct)

boxplot(nba.ncaa.data$NCAA_games ,horizontal = T)
boxplot(nba.ncaa.data$NCAA_ppg, horizontal = T)
boxplot(nba.ncaa.data$NCAA_fgpct, horizontal = T)

plot(nba.ncaa.data$NCAA_games, nba.ncaa.data$NBA_ppg, xlab = 'NCAA Games Played', ylab = 'NBA Points Per Game')
cor(nba.ncaa.data$NCAA_games, nba.ncaa.data$NBA_ppg)

plot(nba.ncaa.data$NCAA_ppg, nba.ncaa.data$NBA_ppg, xlab= 'NCAA Points Per Game', ylab = 'NBA Points Per Game')
cor(nba.ncaa.data$NCAA_ppg, nba.ncaa.data$NBA_ppg)
nrow(nba.ncaa.data)

plot(nba.ncaa.data$NCAA_fgpct, nba.ncaa.data$NBA_ppg, xlab= 'NCAA Field Goal Percentage', ylab = 'NBA Points Per Game')
cor(nba.ncaa.data$NCAA_fgpct, sqrt(nba.ncaa.data$NBA_ppg))

nba.ncaa.data2 <- subset(nba.ncaa.data, NCAA__3ptpct != 0 & NCAA__3ptpct != 1)
plot(nba.ncaa.data$NCAA__3ptpct, nba.ncaa.data$NBA_ppg)
plot(nba.ncaa.data2$NCAA__3ptpct, nba.ncaa.data2$NBA_ppg)

anova(lm(NBA_ppg ~ position, data = nba.ncaa.data))

View(nba.ncaa.data)

nba.ncaa.data$log.NBA_ppg <- log(nba.ncaa.data$NCAA_fgpg)
model7 <- lm(log(NBA_ppg) ~ position + NCAA_games + NCAA__3ptpct * NCAA_ft + NCAA_fgpct * NCAA_ppg, data = nba.ncaa.data)
summary(model7)
plot(model7)
library(leaps)
plot(regsubsets(NBA_ppg ~ position + NCAA_games + NCAA__3ptpct * NCAA_ft + height.inches + NCAA_fgpct * NCAA_ppg, data = nba.ncaa.data), scale = 'adjr2')

write.csv(nba.ncaa.data, "statprojectdata.csv", row.names = F)
write.csv(nba.ncaa.data, "C:\\ThisPC\\Documents\\nba_ncaa_data.csv")
