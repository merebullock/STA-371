all.nba.data <- read.csv('https://query.data.world/s/dpwb62nlk2jzaodjea7guzwy6tnbdt')

#assign correct height to data point that's missing it
all.nba.data$height[nba.data$name == 'George Karl'] <- '6-2'

#subset data with first column removed
nba.data <- all.nba.data[-c(1)]

#create blank column, set all data points as 0
nba.data$newheight <- 0

#if string height matches then assign correlating numeric height
nba.data$newheight[nba.data$height == ''] <- 'NA'
nba.data$newheight[nba.data$height == '5-3'] <- 63
nba.data$newheight[nba.data$height == '5-4'] <- 64
nba.data$newheight[nba.data$height == '5-5'] <- 65
nba.data$newheight[nba.data$height == '5-6'] <- 66
nba.data$newheight[nba.data$height == '5-7'] <- 67
nba.data$newheight[nba.data$height == '5-8'] <- 68
nba.data$newheight[nba.data$height == '5-9'] <- 69
nba.data$newheight[nba.data$height == '5-10'] <- 70
nba.data$newheight[nba.data$height == '5-11'] <- 71
nba.data$newheight[nba.data$height == '6-0'] <- 72
nba.data$newheight[nba.data$height == '6-1'] <- 73
nba.data$newheight[nba.data$height == '6-2'] <- 74
nba.data$newheight[nba.data$height == '6-3'] <- 75
nba.data$newheight[nba.data$height == '6-4'] <- 76
nba.data$newheight[nba.data$height == '6-5'] <- 77
nba.data$newheight[nba.data$height == '6-6'] <- 78
nba.data$newheight[nba.data$height == '6-7'] <- 79
nba.data$newheight[nba.data$height == '6-8'] <- 80
nba.data$newheight[nba.data$height == '6-9'] <- 81
nba.data$newheight[nba.data$height == '6-10'] <- 82
nba.data$newheight[nba.data$height == '6-11'] <- 83
nba.data$newheight[nba.data$height == '7-0'] <- 84
nba.data$newheight[nba.data$height == '7-1'] <- 85
nba.data$newheight[nba.data$height == '7-2'] <- 86
nba.data$newheight[nba.data$height == '7-3'] <- 87
nba.data$newheight[nba.data$height == '7-4'] <- 88
nba.data$newheight[nba.data$height == '7-5'] <- 89
nba.data$newheight[nba.data$height == '7-6'] <- 90
nba.data$newheight[nba.data$height == '7-7'] <- 91

#subset data with only those who went to college included
nba.ncaa.data <- subset(nba.data, college != '')

View(nba.ncaa.data)

write.csv(nba.ncaa.data, "C:\\ThisPC\\Documents\\nba_ncaa_data.csv")

#nba.ncaa.data is the data that will be used in the regression analysis








