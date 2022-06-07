# read data -------------------------------------------------------------

# Password received from organization
pw <- "KOBOHGysri"

# Load column renames Excel file to make data cleaning easier
col_renames <- read_xlsx("./01_data/column_translations.xlsx")

col_renames_relevant <- col_renames %>% 
  filter(!new %in% c("delete"))

# Read data. Two tabs on this file; unbalanced cross-sectional data.
data_targeting <- xl.read.file(filename = "./01_data/raw/SRI Data Guyana Dec 2021 KOBO report.xlsx",
                               xl.sheet = "1. targeting",
                               password = pw)

data_followup <- xl.read.file(filename = "./01_data/raw/SRI Data Guyana Dec 2021 KOBO report.xlsx",
                              xl.sheet = "2. follow-up",
                              password = pw)
