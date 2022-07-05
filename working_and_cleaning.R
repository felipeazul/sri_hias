
rm(list = ls())

library(tidyverse)
library(readxl)
library(janitor)

# Load data
prm_raw <- read_excel("./01_data/raw/sri_prm_ecuador.xlsx")
hilton_raw <- read_excel("./01_data/raw/sri_hilton_ecuador.xlsx")
caminando_raw <- read_excel("./01_data/raw/sri_caminando_ecuador.xlsx")
integra_raw <- read_excel("./01_data/raw/sri_integra_ecuador.xlsx")

# Easy variable name check code
prm_raw %>%
  clean_names() %>%
  colnames() %>%
  tibble() %>%
  print(n = 376)

# Clean imported data
prm_clean <- prm_raw %>%
  clean_names() %>%
  select(codigo = codigo_sistema_hias,
         fecha_de_la_evaluacion, nombre_del_evaluador, genero_del_evaluador,
         interview_modality = la_entrevista_se_realiza_de_manera_presencial_via_telefonica_por_skype_zoom_o_alguna_otra_plataforma,
         nacionalidad,
         gender = genero_del_entrevistado_principal,
         program_type = el_cliente_es_focalizado_para,
         follow_up = estas_hablando_con_el_mismo_cliente_con_el_que_hablaste_durante_la_primera_visita,
         hh_language = idioma_principal_del_hogar,
         document = documentacion_con_la_que_cuenta_el_entrevistado_principal,
         interview_language = idioma_en_el_que_se_llevo_a_cabo_la_entrevista_del_indice_de_autosuficiencia,
         children = composicion_del_hogar_cuantos_ninos_hay_en_el_hogar,
         seniors = composicion_del_hogar_cuantos_adultos_mayores_hay_en_el_hogar,
         dependents = composicion_del_hogar_cuantos_dependientes_hay_en_el_hogar,
         adults = composicion_del_hogar_cuantos_adultos_hay_en_el_hogar,
         time_in_country = cuanto_tiempo_lleva_viviendo_aqui,
         date_of_arrival = fecha_de_llegada_mas_reciente_al_pais_de_acogida,
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score)

hilton_clean <- hilton_raw %>%
  clean_names() %>%
  select(codigo = caso_numero_de_identidad,
         fecha_de_la_evaluacion, nombre_del_evaluador, genero_del_evaluador,
         interview_modality = la_entrevista_se_realiza_de_manera_presencial_via_telefonica_por_skype_zoom_o_alguna_otra_plataforma,
         nacionalidad,
         gender = genero_del_entrevistado_principal,
#         program_type = el_cliente_es_focalizado_para,
         follow_up = estas_hablando_con_el_mismo_cliente_con_el_que_hablaste_durante_la_primera_visita,
         hh_language = idioma_principal_del_hogar,
         document = documentacion_con_la_que_cuenta_el_entrevistado_principal,
         interview_language = idioma_en_el_que_se_llevo_a_cabo_la_entrevista_del_indice_de_autosuficiencia,
         children = composicion_del_hogar_cuantos_ninos_hay_en_el_hogar,
         seniors = composicion_del_hogar_cuantos_adultos_mayores_hay_en_el_hogar,
         dependents = composicion_del_hogar_cuantos_dependientes_hay_en_el_hogar,
         adults = composicion_del_hogar_cuantos_adultos_hay_en_el_hogar,
         time_in_country = cuanto_tiempo_lleva_viviendo_aqui,
         date_of_arrival = fecha_de_llegada_mas_reciente_al_pais_de_acogida,
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score)

caminando_clean <- caminando_raw %>%
  clean_names() %>%
  select(codigo = codigo_sistema_hias,
         fecha_de_la_evaluacion, nombre_del_evaluador, genero_del_evaluador,
         interview_modality = la_entrevista_se_realiza_de_manera_presencial_via_telefonica_por_skype_zoom_o_alguna_otra_plataforma,
         nacionalidad,
         gender = genero_del_entrevistado_principal,
#         program_type = el_cliente_es_focalizado_para,
         follow_up = estas_hablando_con_el_mismo_cliente_con_el_que_hablaste_durante_la_primera_visita,
         hh_language = idioma_principal_del_hogar,
         document = documentacion_con_la_que_cuenta_el_entrevistado_principal,
         interview_language = idioma_en_el_que_se_llevo_a_cabo_la_entrevista_del_indice_de_autosuficiencia,
         children = composicion_del_hogar_cuantos_ninos_hay_en_el_hogar,
         seniors = composicion_del_hogar_cuantos_adultos_mayores_hay_en_el_hogar,
         dependents = composicion_del_hogar_cuantos_dependientes_hay_en_el_hogar,
         adults = composicion_del_hogar_cuantos_adultos_hay_en_el_hogar,
         time_in_country = cuanto_tiempo_lleva_viviendo_aqui,
         date_of_arrival = fecha_de_llegada_mas_reciente_al_pais_de_acogida,
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score)

integra_clean <- integra_raw %>%
  clean_names() %>%
  select(codigo = caso_numero_de_identidad,
         fecha_de_la_evaluacion, nombre_del_evaluador, genero_del_evaluador,
         interview_modality = la_entrevista_se_realiza_de_manera_presencial_via_telefonica_por_skype_zoom_o_alguna_otra_plataforma,
         nacionalidad,
         gender = genero_del_entrevistado_principal,
#         program_type = el_cliente_es_focalizado_para,
         follow_up = estas_hablando_con_el_mismo_cliente_con_el_que_hablaste_durante_la_primera_visita,
         hh_language = idioma_principal_del_hogar,
         document = documentacion_con_la_que_cuenta_el_entrevistado_principal,
         interview_language = idioma_en_el_que_se_llevo_a_cabo_la_entrevista_del_indice_de_autosuficiencia,
         children = composicion_del_hogar_cuantos_ninos_hay_en_el_hogar,
         seniors = composicion_del_hogar_cuantos_adultos_mayores_hay_en_el_hogar,
         dependents = composicion_del_hogar_cuantos_dependientes_hay_en_el_hogar,
         adults = composicion_del_hogar_cuantos_adultos_hay_en_el_hogar,
         time_in_country = cuanto_tiempo_lleva_viviendo_aqui,
         date_of_arrival = fecha_de_llegada_mas_reciente_al_pais_de_acogida,
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score)

# Merge cleaned data into one dataset
sri_data <- bind_rows(
  "caminando" = caminando_clean,
  "hilton" = hilton_clean,
  "integra" = integra_clean,
  "prm" = prm_clean,
  .id = "project"
)

sri_data_clean <- sri_data %>%
  mutate(
    # Convert all variables to lower case
    across(
      .cols = everything(),
      .fns = tolower
    ),
    # Convert most text variables to factors
    across(
      .cols = c(project, genero_del_evaluador:interview_language, program_type),
      .fns = as.factor
    ),
    # Convert SRI score variables to numeric
    across(
      .cols = c(d1a_housing_score:hh_sri_total_score),
      .fns = as.numeric
    ))



