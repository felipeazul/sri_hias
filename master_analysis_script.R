
# Packages and data loading -----------------------------------------------

source("00_R/01_load_packages.R")
source("00_R/02_functions.R")

# Data cleaning and preparation -------------------------------------------

source("01_data/03_load_data.R")
source("01_data/04_clean_data.R")
source("01_data/05_recodes.R")

# Report writing in RMarkdown ---------------------------------------------
rmarkdown::render('hias_guyana_round2.Rmd')
