
data_targeting_clean_recoded <- data_targeting_clean %>% 
  # manual recodes
  mutate(followup = case_when(
    str_detect(followup, "No – It's the first interview conducted with this household") ~ FALSE,
    str_detect(followup, "Yes – It is a follow up visit") ~ TRUE)
  ) %>% 
  mutate_at(vars("doc_held_id", "doc_held_unhcr", "doc_held_other","doc_required_id",
                 "doc_required_unhcr", "doc_required_other",
                 "domain8_assistance", "domain8_borrow", "domain8_sell", "domain8_savings", "domain8_friends", "domain8_work",
                 "domain9_no", "domain9_food", "domain9_utilities", "domain9_healthcare", "domain9_o",
                 "domain10_none", "domain10_food", "domain10_utilities", "domain10_healthcare", "domain10_educ", "domain10_transport", "domain10_invest"),
            recode, "Yes" = TRUE, "No" = FALSE) %>% 
  mutate(across(c(doc_held_other_exp, doc_required_other_exp, nationality_o, domain9_o_explain, referrals,
                  help_self_reliance), as.character)) %>% 
  mutate(across(starts_with("hh_gender_"), as.character)) %>% 
  mutate(across(ends_with("comment"), as.character))

data_followup_clean_recoded <- data_followup_clean %>% 
  # manual recodes
  mutate(followup = case_when(
    str_detect(followup, "No – It's the first interview conducted with this household") ~ FALSE,
    str_detect(followup, "Yes – It is a follow up visit") ~ TRUE)
  ) %>% 
  mutate_at(vars("doc_held_id", "doc_held_unhcr", "doc_held_other","doc_required_id",
                 "doc_required_unhcr", "doc_required_other",
                 "domain8_assistance", "domain8_borrow", "domain8_sell", "domain8_savings", "domain8_friends", "domain8_work",
                 "domain9_no", "domain9_food", "domain9_utilities", "domain9_healthcare", "domain9_o",
                 "domain10_none", "domain10_food", "domain10_utilities", "domain10_healthcare", "domain10_educ", "domain10_transport", "domain10_invest"),
            recode, "Yes" = TRUE, "No" = FALSE) %>% 
  mutate(across(c(doc_held_other_exp, doc_required_other_exp, nationality_o, domain9_o_explain, referrals,
                  help_self_reliance), as.character)) %>% 
  mutate(across(starts_with("hh_gender_"), as.character)) %>% 
  mutate(across(ends_with("comment"), as.character))

data_round2_recoded <- data_targeting_clean_recoded %>% 
  full_join(data_followup_clean_recoded, by = "id", suffix = c("_targ", "_fol")) %>% 
  select(-starts_with(c("assessor_name", "agency", "interview_platform", "followup",
                        "language", "doc_held", "doc_required", "adult_legal_doc",
                        "interview_language", "interpreter", "hh_", "n_", "living_length")),
         -respondent_sex_fol, -targeted_fol, -nationality_fol, -nationality_o_fol,
         -arrival_date_fol)


# Write to Stata .dta file per Ilana's request
write_dta(data_targeting_clean_recoded, "./01_data/processed/guyana_round2_targeting.dta")
write_dta(data_followup_clean_recoded, "./01_data/processed/guyana_round2_followup.dta")
write_dta(data_round2_recoded, "./01_data/processed/guyana_round2_combined.dta")
