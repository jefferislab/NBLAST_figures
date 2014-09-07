library(nat)
# set default score matrix
options('flycircuit.scoremat'="allbyallblastcv4.5")
# load flycircuit package
if(!require("flycircuit")){
  if(interactive())
    browseURL('https://github.com/jefferis/flycircuit')
  stop("Please install flycircuit R package\nSee https://github.com/jefferis/flycircuit")
}
minFlycircuitVersion=package_version('0.5.2')
if(packageVersion('flycircuit')<minFlycircuitVersion){
  if(interactive())
    browseURL('https://github.com/jefferis/flycircuit#installation')
  message('flycircuit package version: ', flycircuitVersion,' is behind required version: ',minFlycircuitVersion)
  message("Please update flycircuit R package\nSee https://github.com/jefferis/flycircuit#installation")
  stop()
}

# this is a flycircuit import, but we'd like the functions to be visible
library(dendroextras)

if(!exists('dps'))
  dps<-read.neuronlistfh("http://flybrain.mrc-lmb.cam.ac.uk/si/nblast/flycircuit/dpscanon.rds",
                         localdir=getOption('flycircuit.datadir'))

# set default neuronlist
options('nat.default.neuronlist'='dps')
