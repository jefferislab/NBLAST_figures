#!/usr/bin/Rscript
library(methods)
library(rmarkdown)

root_dir <- getwd()
rmarkdown_files <- dir(pattern=".Rmd", recursive=TRUE)
rmarkdown_files <- file.path(root_dir, rmarkdown_files)
built_files <- sapply(rmarkdown_files, function(x) { setwd(dirname(x)); render(basename(x)) })

# built_files will not exist if a file failed to build
if(!exists("built_files"")) quit(status=1)
else quit(status=0)
