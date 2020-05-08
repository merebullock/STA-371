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
nba.ncaa.data$NCAA_ftpct <- nba.ncaa.data$NCAA_ftpg / nba.ncaa.data$NCAA_ftapg
nba.ncaa.data <- subset(nba.data, NBA_ppg > 0 & active_from >= 2004 
                        & active_from <= 2010 & college != '' & 
                          NCAA__3ptpct != 'NA' & NCAA_ft != 'NA' & 
                          NCAA_fgpct != 'NA' & NCAA_ppg > 0 & 
                          position != 'NA' & NCAA__3ptpct != 0 & 
                          NCAA__3ptpct != 1)
View(nba.ncaa.data)