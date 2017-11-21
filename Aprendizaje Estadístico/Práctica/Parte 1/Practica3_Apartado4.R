#############################
##########Apartado4##########
#############################
library(ElemStatLearn)
data(prostate)
prostate.train <- prostate[which(prostate$train==TRUE),]
prostate.train
prostate.test <- prostate[which(prostate$train==FALSE),]
prostate.test
