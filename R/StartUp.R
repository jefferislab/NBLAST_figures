# Start up file for R

# set default all by all score matrix
options('flycircuit.scoremat'="allbyallblastcv4.5")

# load flycircuit package and make sure it is up to date
if(!require("flycircuit") || packageVersion('flycircuit')<package_version('0.5.3') ){
  message("Installing/Updating packages!")
  # use rstudio CRAN repository if none set
  if(is.null(getOption("repos")))
    options(repos="http://cran.rstudio.com")

  # install standard packages
  install.packages(c('doMC', 'dendroextras', 'rgl', 'ggplot2', 'spam'))

  if(!require(devtools)) install.packages('devtools')
  devtools::install_github("yihui/knitr")
  devtools::install_github("jefferis/nat")
  devtools::install_github(c("nat.nblast","nat.templatebrains","nat.flybrains"), username="jefferislab")
  devtools::install_github("jefferis/flycircuit")
}

# Load core nat package
library(nat)

# Load fly circuit neurons
if(!exists('dps'))
  dps<-read.neuronlistfh("http://flybrain.mrc-lmb.cam.ac.uk/si/nblast/flycircuit/dpscanon.rds",
                         localdir=getOption('flycircuit.datadir'))
# ... and set as default neuronlist for 3d plots
options('nat.default.neuronlist'='dps')

# Download SI data from Jefferis Lab webserver
apres16k.p0 <- load_si_data("apres16k.p0.rds")
data("annotation", package="flycircuit")
load_si_data("spatdist_jfrc.rda")
load_si_data("canondf.rda")
load_si_data("tophits.rda")
load_si_data("top80sym.rda")
load_si_data("glomdf.rda")
load_si_data("upnstophits_norm.rda")
load_si_data("upnstophits.rda")
load_si_data("picketplotdf.rda")
load_si_data("picketplotdfshort.rda")
good_images <- scan(fc_download_data("http://jefferislab.org/si/nblast/flycircuit/good_images.txt"), what='', quiet = TRUE)

# Load required packages
library(nat.nblast)
library(nat.flybrains)
library(dendroextras)
library(knitr)
library(ggplot2)

# multi-core processing to speed up nblast searches
library(doMC)
registerDoMC()

# function to find dendrogram cutting height
height_for_ngroups<-function(hc, k) {
  s=sort(hc$height, decreasing=TRUE)
  s[k]-1e-6
}


# knitr hook_rgl but with longer wait time
hook_rgl2<-function (before, options, envir) {
  library(rgl)
  if (before || rgl.cur() == 0)
    return()
  name = fig_path("", options)
  par3d(windowRect = 100 + options$dpi * c(0, 0, options$fig.width,
                                           options$fig.height))
  if(!is.null(w<-options$rgl.wait)) Sys.sleep(w) else Sys.sleep(0.05)

  for (dev in options$dev) switch(dev,
                                  postscript = rgl.postscript(stringr::str_c(name, ".eps"), fmt = "eps"),
                                  pdf = rgl.postscript(stringr::str_c(name, ".pdf"), fmt = "pdf"),
                                  rgl.snapshot(stringr::str_c(name, ".png"), fmt = "png"))
  options$fig.num = 1L
  hook_plot_custom(before, options, envir)
}
