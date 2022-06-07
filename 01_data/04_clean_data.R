# Data cleaning -----------------------------------------------------------

# Uses the clean HIAS function to tidy the target and follow-up sheets
data_targeting_clean <- clean_HIAS_data(data_targeting) %>% 
  # truncates decimal points for nicer-looking output
  mutate_at(c("score_groupa", "SRI"), round, digits = 2) %>% 
  # the number of dependents is the number of children plus the number of seniors; should not be manually coded
  mutate(n_dependent = n_children + n_senior,
         dependency_ratio = n_dependent / n_adult) %>% 
  # shorten domain 11 because its responses are not being read correctly in R
  mutate(domain11 = str_sub(domain11, start = 1L, end = 10L)) %>% 
  # turns single-selection domain questions into their numerical response only
  mutate(across(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
                  domain11, domain12a, domain12b),
                ~ list(tibble(col1 = .) %>% 
                         separate(col1, into = c(cur_column(), NA), sep = "\\. ", convert = TRUE, extra = "drop")))) %>%
  mutate(across(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
                  domain11, domain12a, domain12b),
                ~ .[[1]])) %>% 
  unnest(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
           domain11, domain12a, domain12b)) %>% 
  set_value_labels(domain1a = c("No shelter" = 1, "Makeshift shelter" = 2, "Temporarily hosted" = 3,
                                "Inadequate apt/house" = 4, "Adequate apt/house" = 5),
                   domain1b = c("2-3 times" = 1, "1 time" = 2, "None" = 3, "Rent not applicable" = 4),
                   domain2 = c("Did not eat yesterday" = 1, "Not even a full meal" = 2,
                               "1 full meal" = 3, "2-3 full meals" = 4),
                   domain3 = c("No school-age children" = 0, "None in school" = 1, "Some in school" = 2, "All in school" = 3),
                   domain4 = c("Not needed" = 0, "Did not receive" = 1, "Received some" = 2, "Received all" = 3),
                   domain5 = c("Adult has health condition" = 1, "Dependent has health condition" = 2,
                               "None" = 3),
                   domain6 = c("Don't feel safe to pursue any" = 1, "Feel safe to pursue some" = 2,
                               "Feel safe to pursue all" = 3),
                   domain7 = c("None" = 1, "Temporary" = 2, "Regular part-time" = 3, "Full-time w/o documentation" = 4,
                               "Full-time w/documentation" = 5),
                   domain11 = c("No savings or sellable assets" = 1, "Not enough for 1 mo expenses" = 2,
                                "Enough for 1 mo expenses" = 3, "1 mo expenses plus asset" = 4),
                   domain12a = c("Knows no one" = 1, "Knows someone" = 2),
                   domain12b = c("Neither" = 0, "HH members ask other ONLY" = 1, "People ask HH members ONLY" = 2,
                                 "Both" = 3)) %>% 
  set_variable_labels(dependency_ratio = "Dependency ratio",
                      arrival_date = "Arrival date in host country") %>% 
  # step variables only need the actual value
  mutate(across(c(step_now, step_6mos), ~ str_extract(., "[[0-9]]"))) %>% 
  mutate(across(c(step_now, step_6mos), as.integer)) 

data_followup_clean <- clean_HIAS_data(data_followup) %>%  
  mutate_at(c("score_groupb", "SRI"), round, digits = 2) %>% 
  # the number of dependents is the number of children plus the number of seniors; should not be manually coded
  mutate(n_dependent = n_children + n_senior,
         dependency_ratio = n_dependent / n_adult) %>% 
  # shorten domain 11 because its responses are not being read correctly in R
  mutate(domain11 = str_sub(domain11, start = 1L, end = 10L)) %>% 
  # turns single-selection domain questions into their numerical response only
  mutate(across(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
                  domain11, domain12a, domain12b),
                ~ list(tibble(col1 = .) %>% 
                         separate(col1, into = c(cur_column(), NA), sep = "\\. ", convert = TRUE, extra = "drop")))) %>%
  mutate(across(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
                  domain11, domain12a, domain12b),
                ~ .[[1]])) %>% 
  unnest(c(domain1a, domain1b, domain2, domain3, domain4, domain5, domain6, domain7,
           domain11, domain12a, domain12b)) %>% 
  set_value_labels(domain1a = c("No shelter" = 1, "Makeshift shelter" = 2, "Temporarily hosted" = 3,
                                "Inadequate apt/house" = 4, "Adequate apt/house" = 5),
                   domain1b = c("2-3 times" = 1, "1 time" = 2, "None" = 3, "NA" = 4),
                   domain2 = c("Did not eat yesterday" = 1, "Not even a full meal" = 2,
                               "1 full meal" = 3, "2-3 full meals" = 4),
                   domain3 = c("NA" = 0, "None in school" = 1, "Some in school" = 2, "All in school" = 3),
                   domain4 = c("Not needed" = 0, "Did not receive" = 1, "Received some" = 2, "Received all" = 4),
                   domain5 = c("Adult has health condition" = 1, "Dependent has health condition" = 2,
                               "None" = 3),
                   domain6 = c("Don't feel safe to pursue any" = 1, "Feel safe to pursue some" = 2,
                               "Feel safe to pursue all" = 3),
                   domain7 = c("None" = 1, "Temporary" = 2, "Regular part-time" = 3, "Full-time w/o documentation" = 4,
                               "Full-time w/documentation" = 5),
                   domain11 = c("No savings or sellable assets" = 1, "Not enough for 1 mo expenses" = 2,
                                "Enough for 1 mo expenses" = 3, "1 mo expenses plus asset" = 4),
                   domain12a = c("Knows no one" = 1, "Knows someone" = 2),
                   domain12b = c("Neither" = 0, "HH members ask other ONLY" = 1, "People ask HH members ONLY" = 2,
                                 "Both" = 3)) %>% 
  set_variable_labels(dependency_ratio = "Dependency ratio",
                      arrival_date = "Arrival date in host country") %>% 
  # step variables only need the actual value
  mutate(across(c(step_now, step_6mos), ~ str_extract(., "[[0-9]]"))) %>% 
  mutate(across(c(step_now, step_6mos), as.integer)) 

# Create a combined wide dataset
data_round2 <- data_targeting_clean %>% 
  full_join(data_followup_clean, by = "id", suffix = c("_targ", "_fol")) %>% 
  select(-starts_with(c("assessor_name", "agency", "interview_platform", "followup",
                        "language", "doc_held", "doc_required", "adult_legal_doc",
                        "interview_language", "interpreter", "hh_", "n_", "living_length")),
         -respondent_sex_fol, -targeted_fol, -nationality_fol, -nationality_o_fol,
         -arrival_date_fol)
