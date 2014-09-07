#start up file for R
source("FlyCircuitStartupLight.R")

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
library(devtools)
library(nat)
library(nat.nblast)
library(nat.flybrains)
library(doMC)
registerDoMC()
library(dendroextras)
library(rgl)
library(knitr)
library(ggplot2)

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
