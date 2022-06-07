# Self-written functions -----------------------------------------------------------
clean_HIAS_data <- function(data) {
  # gets the string of the object name in data
  data_clean_str <- str_c(deparse(substitute(data)), "_clean")
  
  names(data) <- col_renames$new
  assign(data_clean_str, data[, -which(names(data) %in% c("delete"))])
  data_clean_str

  # Rename columns and get rid of the ones indicated for deletion.
  # Deleted variables are intermediate computation variables that are redundant with other
  # existing variables.
  data_clean <- get(data_clean_str) %>% 
    as_tibble() %>% 
    mutate_at(vars("language_es", "language_en", "language_other",
                   "doc_held_stay", "doc_held_id", "doc_held_unhcr", "doc_held_birth", "doc_held_other",
                   "doc_required_stay", "doc_required_id", "doc_required_unhcr", "doc_required_birth", "doc_required_other",
                   "domain8_assistance", "domain8_borrow", "domain8_sell", "domain8_savings", "domain8_friends", "domain8_work",
                   "domain9_no", "domain9_food", "domain9_utilities", "domain9_healthcare", "domain9_o",
                   "domain10_none", "domain10_food", "domain10_utilities", "domain10_healthcare", "domain10_educ", "domain10_transport", "domain10_invest",),
              recode, "1" = "Yes", "0" = "No") %>% 
    mutate_at(vars("assessor_sex", "respondent_sex"), recode, "F" = "Female", "M" = "Male") %>% 
    type_convert() %>% 
    set_variable_labels(.labels = col_renames_relevant$original)
}

# function to change defaults
hijack <- function (FUN, ...) {
  .FUN <- FUN
  args <- list(...)
  invisible(lapply(seq_along(args), function(i) {
    formals(.FUN)[[names(args)[i]]] <<- args[[i]]
  }))
  .FUN
}
