library(mmnet)
library(biom)

setwd("/Users/leahguthrie/Documents/2016/Labnotebook/Projects/Infla_cazy/data/")
###read in file
mlow <- read.csv("KO_ctl_count.csv")
###
KO <- mlow$State
abundance <- mlow$Ctl
abundance <- as.data.frame(abundance)
KO <- as.data.frame(KO)
biom.data <- make_biom(abundance, observation_metadata = KO)
biom.data$type <- "enzymatic genes abundance"

###Construct Low state specific network
ssn <- constructSSN(biom.data)
topologicalAnalyzeNet(ssn)

###turn into a dataframe
low <- as_long_data_frame(ssn)

setwd("/Users/leahguthrie/Documents/2016/Labnotebook/Projects/Gutmicrobes_sig_CPT11_metabo/EMP2015/data")
##write to file
write.csv(low, "low_netpoints.csv")


