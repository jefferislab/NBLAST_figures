#!/usr/bin/Rscript
library(methods)
library(rmarkdown)
library(nat)
library(flycircuit)

data_dir=getOption('flycircuit.datadir')
stopifnot(!is.null(data_dir))

if(!file.exists(file.path(data_dir, 'dpscanon.rds'))) {
	## save ourselves a lot of time by pre-fetching the neuron data we need
	# first download to temp location
	tf=tempfile(fileext = '.zip')
	# nb curl required for https, -L follows github redirect
	download.file("https://github.com/jefferislab/dpscanon/archive/master.zip", tf,
	              method = 'curl', extra="-L")
	# unzip to data dir
	unzip(tf, exdir = data_dir)
	# move files up one level
	ziprd=file.path(data_dir,'dpscanon-master')
	files_to_move=dir(ziprd, full.names = TRUE)
	file.rename(files_to_move, file.path(data_dir, basename(files_to_move)))
}

root_dir <- getwd()
rmarkdown_files <- dir(normalizePath("fig"), pattern=".Rmd", recursive=TRUE, full.names = T)
built_files <- sapply(rmarkdown_files, function(x) { setwd(dirname(x)); render(basename(x), envir=globalenv()) })

# built_files will not exist if a file failed to build
if(!exists("built_files")) quit(status=1) else quit(status=0)
