#----------------------------||--REACT DATA STATISTCS--||---------------------------------

   #Global variables / Enviroment variables
      #playdata <- read.csv("playdata.csv") #RawData from .csv, old method
      rawJsonPlayData <- readLines("~(I remove server address for the commit, but you can find a sample as playdata.json on root folder)~") # Fetching raw json data of the game from server
      rawJsonUserData <- readLines("~(I remove server address for the commit, but you can find a sample as userdata.json on root folder)~")      
      playdata = jsonlite::fromJSON(rawJsonPlayData) #and then parsing them from Json
      userdata = jsonlite::fromJSON(rawJsonUserData) 



   #----Filtered data
      playsNormal <- playdata[which(playdata[["gameMode"]] == "normal"),]
      playsBlack <- playdata[which(playdata[["gameMode"]] == "blacktheme"),]
      playsTimeless <- playdata[which(playdata[["gameMode"]] == "timeless"),]




   #----Thresholds/Constants

      #Average Scores
         averageScores <- data.frame(
               General = mean(playdata[,"score"], na.rm = TRUE),
               Normal = mean(playsNormal[,"score"], na.rm = TRUE),
               Black = mean(playsBlack[,"score"], na.rm = TRUE),
               Timeless = mean(playsTimeless[,"score"], na.rm = TRUE)
            )
         realPlaysAverageScores <- data.frame(                       #Real plays are plays grater than 0
               General = mean(playdata[which(playdata[["score"]] > 0),"score"], na.rm = TRUE),
               Normal = mean(playsNormal[which(playsNormal[["score"]] > 0),"score"], na.rm = TRUE),
               Black = mean(playsBlack[which(playsBlack[["score"]] > 0),"score"], na.rm = TRUE),
               Timeless = mean(playsTimeless[which(playsTimeless[["score"]] > 0),"score"], na.rm = TRUE)
            )


#-----------------------------------------------------------------

#-----------Mined Itens---------

      #Perceived performance between game modes
            ##Aux "anonymous" func
            bestPerformanceAgent <- function(expected = ""){
               if(identical(expected,"colname"))
                  return(colnames(realPlaysAverageScores)[apply(realPlaysAverageScores,1,which.max)])
               
               max(realPlaysAverageScores[apply(realPlaysAverageScores,2,which.max)[1],])
            }
         bestPerformance<-NA
         if(!identical(bestPerformanceAgent("colname"), "General")){ ## Just checking if the best performance isn't already on a general game mode aspect
            bestPerformance <- data.frame(gamemode = bestPerformanceAgent("colname"), score=bestPerformanceAgent(), performanceOverGeneral = NA)
            bestPerformance[,3]<-realPlaysAverageScores[,"General"] %discreteRoundPercentage% bestPerformance[,2] 
         }
         


      #Average Time Playing
         timePlayingPerUser <- calculateAverageTimePlayingPerUser(playdata)
         averageTimePlaying <- mean(as.numeric(timePlayingPerUser[,"playTime"]))



      #Score progress by the number of plays
            ##Aux "anonymous" func
            calcAverageScoresByNumberOfPlays <- function(nPlays){
               afirmativeGroup <- userdata[which(userdata[["numberOfPlays"]] >= nPlays),]
               negativeGroup <- userdata[which(userdata[["numberOfPlays"]] < nPlays),]
               
               afirmativeGroupAverage <- mean(afirmativeGroup[,"highscore"])
               negativeGroupAverage <- mean(negativeGroup[,"highscore"])
               
               c(nPlays,afirmativeGroupAverage,negativeGroupAverage, (afirmativeGroupAverage %discreteRoundPercentage% negativeGroupAverage - 100)) ##Discouting one part so it counts only the diference between scores
            }
         averageScoreByNumberOfPlays <- data.frame(
               playMoreThan = numeric(),
               score = numeric(),
               playLessThanScore = numeric(),
               averageProgress = numeric()
            )
         for(i in seq(10, 110, by=20))
            averageScoreByNumberOfPlays[nrow(averageScoreByNumberOfPlays) + 1,] <- calcAverageScoresByNumberOfPlays(i)

      #Plays by time of day
         playdata$date <- as.POSIXlt(playdata[,"date"], format="%a %b %d %Y %H:%M:%S")

         averagePlaysByTimeOfDay <- playdata
         averagePlaysByTimeOfDay <- data.frame(table(cut(averagePlaysByTimeOfDay[,"date"], breaks="hour")))
         averagePlaysByTimeOfDay <- tapply(averagePlaysByTimeOfDay[,2], as.POSIXlt(averagePlaysByTimeOfDay[,1])$hour, function(x){sum(x)})
         averagePlaysByTimeOfDay <- data.frame(
            hours = names(averagePlaysByTimeOfDay),
            plays = averagePlaysByTimeOfDay
         )
         #As percentage
         averagePlaysByTimeOfDayPercentage <- averagePlaysByTimeOfDay
         averagePlaysByTimeOfDayPercentage[,2] <- averagePlaysByTimeOfDayPercentage[,2] %discreteRoundPercentage% sum(averagePlaysByTimeOfDayPercentage[,2])

      #Average scores by time of day
         averageScoresByTimeOfDay <- data.frame(time = as.character(), score = as.numeric())
         for(i in seq(from=0,to=22, by=2)){
            averageForThatTime <- mean(playdata[which(playdata[["date"]]$hour >= i & playdata[["date"]]$hour < (i+2)),"score"])
            averageScoresByTimeOfDay <- rbind(averageScoresByTimeOfDay,data.frame(time = paste0(i,"-",(i+2)), score = averageForThatTime))
         }
         averageScoresByTimeOfDay[which(is.nan(averageScoresByTimeOfDay[[2]])),2] <- 0
         #As percentage
            averageScoresByTimeOfDayPercentage <- averageScoresByTimeOfDay
            averageScoresByTimeOfDayPercentage[,2] <- averageScoresByTimeOfDayPercentage[,2] %discreteRoundPercentage% averageScores[,"General"] - 100


      #Plays by week day
         averagePlaysByWeekDay <- playdata
         averagePlaysByWeekDay[,"date"] <- weekdays(averagePlaysByWeekDay[,"date"])
         averagePlaysByWeekDay <- data.frame(table(averagePlaysByWeekDay[,"date"]))
         averagePlaysByWeekDay <- data.frame(
               weekday = averagePlaysByWeekDay[,1],
               plays = averagePlaysByWeekDay[,2]
            )
         #As percentage
            averagePlaysByWeekDayPercentage <- averagePlaysByWeekDay
            averagePlaysByWeekDayPercentage[,2] <- averagePlaysByWeekDayPercentage[,2] %discreteRoundPercentage% sum(averagePlaysByWeekDayPercentage[,2])



#-----------------------------------------------------------------

   #-- Plots

      #Average scores
         plotableFrame <- data.frame(
            labels = names(realPlaysAverageScores),
            data = round(as.numeric(realPlaysAverageScores[1,]))
         )
         generateDefaultBarChard(plotableFrame,"1- Average score by game mode","rp") 
         dev.off()

      #Perceived performance progress between game modes
         if(!is.na(bestPerformance)){ ##Only plot if we have observed a better performance in one specific game mode
            plotableFrame <- data.frame(
               labels = paste("Plays on",as.character(bestPerformance[,1]),"mode scores",bestPerformance[,3],"% higher"),
               data = round(bestPerformance[,3])
            )
            generateDefaultBarChard(plotableFrame,"2- Average perceived score performance between game modes","rate") 
         }
         dev.off()

      #Average time playing
         plotableFrame <- data.frame(
            labels = "Time Playing",
            data = round(averageTimePlaying)
         )
         generateDefaultBarChard(plotableFrame,"3- Average time played per user","seconds") 
         dev.off()

      #Users vs Time playing
         plotableFrame <- data.frame(
            labels = as.character(round(as.numeric(timePlayingPerUser[,1]) / 100)),
            data = round(as.numeric(timePlayingPerUser[,2]) / 60)
         )
         mypath <- file.path("C:","Dev","R","react","Plots",paste("User - User vs Time Playing - General", ".jpg", sep = ""))
         jpeg(file=mypath,width = 900,height = 700,quality = 100)
         barchart(data ~ labels,data=plotableFrame,main = "User vs Time Playing - General",type="l",scales=list(x=list(rot=90),relation="free",tick.number=30,tck=1.5),box.ratio=0.5,ylab="Minutes",col=25,panel = function(x,y,...){panel.barchart(x, y, ...);panel.grid(h = -6, v = 0, col = 25);panel.text(x, y, label = y, pos = 3,cex = 1.2)})
         dev.off()
   
      
      #Score progress by the number of plays
         plotableFrame <- data.frame(
            labels = as.character(averageScoreByNumberOfPlays[,1]),
            data = round(averageScoreByNumberOfPlays[,2])
         )
         generateDefaultBarChard(plotableFrame,"4- Average score related to number of plays","rp") 
         dev.off()
   
         ##By rate
            plotableFrame <- data.frame(
               labels = as.character(averageScoreByNumberOfPlays[,1]),
               data = round(averageScoreByNumberOfPlays[,"averageProgress"])
            )
            generateDefaultBarChard(plotableFrame,"4- Average score progress related to number of plays","%") 
            dev.off()



      #Plays by time of day
         plotableFrame <- data.frame(
            labels = averagePlaysByTimeOfDay[,1],
            data = averagePlaysByTimeOfDay[,2]
         )
         generateDefaultBarChard(plotableFrame,"5- Plays by time of day - UTC+0","plays") 
         dev.off()

         #As percentage
            plotableFrame <- data.frame(
               labels = averagePlaysByTimeOfDayPercentage[,1],
               data = averagePlaysByTimeOfDayPercentage[,2]
            )
            generateDefaultBarChard(plotableFrame,"5- Plays by time of day, as rate - UTC+0","%") 
            dev.off()



      #Average scores by time of day
         plotableFrame <- data.frame(
            labels = averageScoresByTimeOfDay[,1],
            data = round(averageScoresByTimeOfDay[,2])
         )
         generateDefaultBarChard(plotableFrame,"6- Average score by time of day - UTC+0","plays") 
         dev.off()
         
         #As percentage
            plotableFrame <- data.frame(
               labels = averageScoresByTimeOfDayPercentage[,1],
               data = averageScoresByTimeOfDayPercentage[,2]
            )
            generateDefaultBarChard(plotableFrame,"6- Progress rate between general average and time of day average - UTC+0","%") 
            dev.off()


      #Plays by time of day
         plotableFrame <- data.frame(
            labels = averagePlaysByWeekDay[,1],
            data = averagePlaysByWeekDay[,2]
         )
         generateDefaultBarChard(plotableFrame,"7- Plays by week day - UTC+0","plays") 
         dev.off()
      
         #As percentage
            plotableFrame <- data.frame(
               labels = averagePlaysByWeekDayPercentage[,1],
               data = averagePlaysByWeekDayPercentage[,2]
            )
            generateDefaultBarChard(plotableFrame,"7- Plays by week day, as rate - UTC+0","%") 
            dev.off()


















