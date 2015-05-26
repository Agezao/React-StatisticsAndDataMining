library("lattice")
library(jsonlite)
Sys.setlocale("LC_TIME", "C")


#---Directives
   "%discretePercentage%" <- function(slice,hundred){slice * 100 / hundred}
   "%discreteRoundPercentage%" <- function(slice,hundred){round(slice * 100 / hundred, digits = 0)}
   
   "%rowsPercentage%" <- function(slice,hundred){nrow(slice) * 100 / nrow(hundred)}
   "%rowsRoundPercentage%" <- function(slice,hundred){round(nrow(slice) * 100 / nrow(hundred), digits = 0)}


#---Functions

   #---DataMining helper functions
      calculateAverageTimePlayingPerUser <- function(sourceData){
         uniqueUsers <- unique(sourceData[,"uid"])
         timePlayingPerUser <- data.frame(uid = c(0), playTime = c(0))
         
         for(user in uniqueUsers){
            timePlayingPerUser <- rbind(timePlayingPerUser,c(user,max(sourceData[which(sourceData[["uid"]] == user),"timePlaying"])))
         }
         
         timePlayingPerUser
      }

#---Functions

   #---Plotting
      generateDefaultBarChard <- function(dataFrame, label, ylabel, horizontal = TRUE){
         mypath <- file.path("C:","Dev","R","React","Plots",paste(label, ".jpg", sep = ""))
         jpeg(file=mypath,width = 900,height = 700,quality = 100)
         if(horizontal)
            barchart(data ~ labels,data=dataFrame, main = label,type="l",scales=list(relation="free",tick.number=30,tck=1.5),box.ratio=0.5,ylab=ylabel,col=25,panel = function(x,y,...){panel.barchart(x, y, ...);panel.grid(h = -6, v = 0, col = 25);panel.text(x, y, label = y, pos = 3,cex = 1.2)})
         else
            barchart(data ~ labels,horizontal=FALSE,data=dataFrame, main = label,type="l",scales=list(relation="free",tick.number=30,tck=1.5),box.ratio=0.5,ylab=ylabel,col=25,panel = function(x,y,...){panel.barchart(x, y, ...);panel.grid(h = -6, v = 0, col = 25);panel.text(x, y, label = y, pos = 3,cex = 1.2)})
      }



