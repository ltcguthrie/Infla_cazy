library(mmnet)
library(biom)
library("biomformat")
setwd("/Users/leahguthrie/Einstein/Kelly-Lab/Labnotebook/Projects/Infla_cazy/data/")
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
write.csv(low, "ctl_ko_netpoints.csv")

setwd("/Users/leahguthrie/Einstein/Kelly-Lab/Labnotebook/Projects/Infla_cazy/data/")
###read in file
mlow <- read.csv("KO_aa_count.csv")
###
KO <- mlow$State
abundance <- mlow$AA
abundance <- as.data.frame(abundance)
KO <- as.data.frame(KO)
biom.data <- make_biom(abundance, observation_metadata = KO)
biom.data$type <- "enzymatic genes abundance"

###Construct Low state specific network
ssn <- constructSSN(biom.data)
topologicalAnalyzeNet(ssn)


###read in file
mlow <- read.csv("KO_ca_count.csv")
###
KO <- mlow$State
abundance <- mlow$CA
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
write.csv(low, "aa_ko_netpoints.csv")

library(mmnet)
library(biom)
library("biomformat")
setwd("/Users/leahguthrie/Einstein/Kelly-Lab/Labnotebook/Projects/Infla_cazy/data/")
###read in file
mlow <- read.csv("ko_ibd_count.csv")
###
KO <- mlow$ID
abundance <- mlow$High_c
abundance <- as.data.frame(abundance)
KO <- as.data.frame(KO)
biom.data <- make_biom(abundance, observation_metadata = KO)
biom.data$type <- "enzymatic genes abundance"

###Construct Low state specific network
ssn <- constructSSN(biom.data)
topologicalAnalyzeNet(ssn)

###read in file

mlow <- read.csv("ko_healthy_ibd_count.csv")
###
KO <- mlow$ID
abundance <- mlow$Healthy_count
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
write.csv(low, "ibd_ko_netpoints.csv")


sessionInfo()
#R version 3.3.1 (2016-06-21)
#Platform: x86_64-apple-darwin13.4.0 (64-bit)
#Running under: OS X 10.11.6 (El Capitan)

#locale:
#  [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

#attached base packages:
#  [1] stats     graphics  grDevices utils     datasets  methods   base     

#other attached packages:
#  [1] mmnet_1.10.2         igraph_1.0.1         biomformat_1.0.2     biom_0.3.12          BiocInstaller_1.22.3

