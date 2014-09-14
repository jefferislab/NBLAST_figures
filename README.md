# NBLAST figures

This repository contains the [knitr](http://yihui.name/knitr/) documents used to make the figure panels for [Costa et al. (2014) NBLAST: Rapid, sensitive comparison of neuronal structure and construction of neuron family databases](http://dx.doi.org/10.1101/006346).

Watch a video demo [here](http://youtu.be/KaCkZKPaDgE).

## Prerequisites
All of our analysis uses the statistical programming environment, R, for which RStudio
is a convenient cross-platform IDE.

1. Install R from http://www.r-project.org/ (you need at least R 3.0.2, latest R recommended)
2. Install RStudio from http://www.rstudio.com

## Setting Up

1. Git clone or [download](https://github.com/jefferislab/NBLAST_figures/archive/master.zip) and unzip this repository
2. Double click on `nblast_figures.Rproj` to start a clean R session in RStudio
3. Open `R/Startup.R` and source it (Code ... Source File) or button with pale blue arrow at top right
   (details [here](https://support.rstudio.com/hc/en-us/articles/200484448-Editing-and-Executing-Code))
4. Check that there were no error messages while installing packages or downloading data

## Running a report

1. Double click on `nblast_figures.Rproj` to start RStudio
2. Open one of the Rmd files under the `fig/` folder and click the 'Knit HTML' button to begin. 
When this process has finished, a web page containing text and images will be produced.
3. You can also run the chunks in the report one by one in an interactive R session.
   Use the green "Chunks" button at the top right of the source file window. Choose for example
   "Run Current Chunk". You can step through the whole report chunk by chunk or line by line inspecting the
   intermediate results in R. This includes interactive 3D renderings of the plots of neurons
   which you can rotate and zoom, likely revealing many small details.


## Contact

Please feel free to:

* submit a [bug report](https://github.com/jefferislab/NBLAST_figures/issues) (recommended for faster response from team)
* or contact Greg directly (details in [paper](http://dx.doi.org/10.1101/006346))

should you have any difficulties
