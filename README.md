# sri-hias
This folder processes and cleans the SRI dataset collected by HIAS Guyana from 2021-03-17 to 2021-04-26.

# Directory
* __00_R__
  * 01_load_packages.R: loads necessary R packages
  * 02_functions.R: user-written functions
* __01_data__
  * [folder] raw: contains unedited KOBO files received directly from HIAS
  * 03_load_data.R: loads data, with column names defined according to *column_translations.xlsx*
  * 04_clean_data.R: standardizes data, especially for SRI domain scoring
  * 05_recodes.R: performs a few recodes
  * column_translations.xlsx: changes Excel column names in the raw file to R column names for processing
* __master_analysis_script.R__: runs all R scripts to process from Excel raw file to processed Stata .dta files
* __hias_guyana_round2.Rmd__: creates report file for HIAS
* __Round 2.Rproj__: RStudio project file useful for managing file locations
