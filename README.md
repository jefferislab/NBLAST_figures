# NBLAST figures
[![Build Status](https://travis-ci.org/jefferislab/NBLAST_figures.svg?branch=master)](https://travis-ci.org/jefferislab/NBLAST_figures)

This repository contains the [knitr](http://yihui.name/knitr/) documents used to make the figure panels for [Costa et al. (2014) NBLAST: Rapid, sensitive comparison of neuronal structure and construction of neuron family databases](http://dx.doi.org/10.1101/006346).

Watch a video demo of how to run code [here](http://youtu.be/LJgZejabqqg). Read on for the details.

## Prerequisites
All of our analyses use the statistical programming environment, R. RStudio
is a convenient cross-platform IDE with excellent support for authoring
[R Markdown](http://rmarkdown.rstudio.com/) documents, which combine text
written in Markdown with embedded R code chunks.

Some scripts depend on an installation of the image registration toolkit CMTK in order to transform neurons from one space to another. 


1. Install R from http://www.r-project.org/ (you need at least R 3.0.2, latest R recommended).
2. Install RStudio from http://www.rstudio.com.
3. Optionally on MacOS X install XQuartz to use X11 for 3D visualisation (this used to be packaged with MacOS X but is now available only from http://xquartz.macosforge.org/)
4. Optionally install CMTK from http://www.nitrc.org/projects/cmtk (to transform some neurons)

## Setting Up

1. [Download](https://github.com/jefferislab/NBLAST_figures/archive/master.zip) and unzip this repository (or `git clone` if you prefer).
2. Double click on `NBLAST_figures.Rproj` to start a clean R session in RStudio.
3. Open `R/Startup.R` and source it (Code ... Source File) or press the button with a pale blue arrow at top right
   (details [here](https://support.rstudio.com/hc/en-us/articles/200484448-Editing-and-Executing-Code)).
4. Check that there were no error messages while installing packages or downloading data.

## Running a report

1. Double click on `NBLAST_figures.Rproj` to start RStudio.
2. Open one of the Rmd files under the `fig/` folder.
3. Click the 'Knit HTML' button to begin. 
When this process has finished, a web page containing text and images will be produced.
3. You can also run the chunks in the report one by one in an interactive R session.
  1. Use the green "Chunks" button at the top right of the source file window. Choose for example
   "Run Current Chunk". 
  2. You can step through the whole report chunk by chunk or line by line inspecting the
   intermediate results in R. 
  3. This includes interactive 3D renderings of the plots of neurons
   which you can rotate and zoom; this will likely reveal additional information beyond
   the static projection view in the HTML report created earlier.

## Contact

Please feel free to:

* submit a [bug report](https://github.com/jefferislab/NBLAST_figures/issues) (recommended for faster response from team),
* or contact Greg directly (details in [paper](http://dx.doi.org/10.1101/006346))

should you have any difficulties.
