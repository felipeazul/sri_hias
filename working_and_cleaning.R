
rm(list = ls())

# Load packages
library(tidyverse)
library(readxl)
library(lubridate)
library(janitor)
library(showtext)
library(ggdist)

# Fonts
font_add_google(name = "Open Sans", family = "Open Sans")
font_add_google(name = "Roboto Mono", family = "Roboto Mono")
showtext_auto()

# Load raw data
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
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score,
         uuid)

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
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score,
         uuid)

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
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score,
         uuid)

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
         contains("_score"), -la_puntuacion_del_hogar_en_el_sri_es_hh_sri_total_score,
         uuid)

# Merge cleaned data into one dataset
sri_data <- bind_rows(
  "caminando" = caminando_clean,
  "hilton" = hilton_clean,
  "integra" = integra_clean,
  "prm" = prm_clean,
  .id = "project"
)

# Clean merged dataset
sri_data_clean <- sri_data %>%
  mutate(
    # Convert most text variables to factors
    across(
      .cols = c(project, genero_del_evaluador:interview_language, program_type),
      .fns = as.factor
    ),
    # Convert SRI score variables to numeric
    across(
      .cols = c(d1a_housing_score:hh_sri_total_score),
      .fns = as.numeric
    )) %>%
  # Clean time_in_country variable
  mutate(
    time_in_country = str_replace(time_in_country, "año", "Year"),
    time_in_country = na_if(time_in_country, "No Aplica")
  ) %>%
  # Clean enumerator names
  mutate(
    nombre_del_evaluador = tolower(nombre_del_evaluador),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "alexandra lópez", "alexandra lopez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "amelia bone oritz", "amelia bone"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "amelia bone ortiz", "amelia bone"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "amelia del rocio bone ortiz", "amelia bone"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "andreina mercedes sevillano molina", "andreina sevillano"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "andreina sevillano molian", "andreina sevillano"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "andreina sevillano molina", "andreina sevillano"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "arelis meza villacis", "arelis meza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "james fabricio cueva correa", "fabricio cueva"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "fabricio cuevas", "fabricio cueva"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "gabricio cueva", "fabricio cueva"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "gabriel soto", "gabriela soto"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "héctor bravo mendoza", "hector bravo mendoza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "johana quinalisa", "johana quinaluisa"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "johana quinaluisa.", "johana quinaluisa"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "john david ycaza porras", "john ycaza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "john ycaza p.", "john ycaza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "john ycaza porras", "john ycaza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "john ycaza p", "john ycaza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "john ycazarras", "john ycaza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "juan jose romero garcía", "juan jose romero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "juan josé romero garcía", "juan jose romero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "juan jose romero gracia", "juan jose romero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "juan jose romero garcia", "juan jose romero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "juan josé romero", "juan jose romero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "katerie alexandra lopez yépez", "katerine alexandra lopez yepez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "katerine alexandra lóopez yépez", "katerine alexandra lopez yepez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "katerine alexandra lopez yépez", "katerine alexandra lopez yepez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñguez", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñigue z", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñiguez brito", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñiguez", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñiguz", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "lorena iñiiguez", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "marcia lorena iniquez", "lorena iniguez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maría  esther gonzález jácome", "maria esther gonzalez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maria esther gonzález jácome", "maria esther gonzalez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maria esther gonzalez jácome", "maria esther gonzalez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maria esther gonzalez jacome", "maria esther gonzalez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maría esther gonzalez", "maria esther gonzalez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maría isabel vinueza rivera", "maria luisa vinueza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maria isabel vinueza rivera", "maria luisa vinueza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maria isabel vinueza", "maria luisa vinueza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "maría isabel vinueza", "maria luisa vinueza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mariuxi carranza intriago", "mariuxi carranza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mariuixi carranza", "mariuxi carranza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mariuxo carranza", "mariuxi carranza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mariuxi monserrate carranza intriago", "mariuxi carranza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mariuxi monserrate", "mariuxi carranza"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "marlene guallasamin ñacato", "marlene guallasamin"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "marlene guallasmin ñacato", "marlene guallasamin"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mayra samaniego tello", "mayra samaniego"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mayra samanniego tello", "mayra samaniego"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mayra violeta samaniego tello", "mayra samaniego"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "mishell yánez", "mishell yanez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "olivia  nazareno", "olivia nazareno"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "nazareno olivia", "olivia nazareno"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "pamela véliz ibarra", "pamela veliz"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "pamela vèliz", "pamela veliz"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "patricio jácome", "patricio jacome"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "raúl enrique calderón mero", "raul enrique calderon mero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "raúl calderón mero", "raul enrique calderon mero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "saskia lorena silva helguer0", "saskia lorena silva helguero"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "wemndy nazareno", "wendy nazareno"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "wendy nazarenno", "wendy nazareno"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "sánchez", "sanchez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "véliz", "veliz"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "jácome", "jacome"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "ramón", "ramon"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "briceño ordóñez", "briceno ordonez"),
    nombre_del_evaluador = str_replace(nombre_del_evaluador, "pazmiño", "pazmino")
  ) %>%
  # Shorten date variable name
  rename(fecha_encuesta = fecha_de_la_evaluacion) %>%
  # Clean codigo variable
  mutate(
    codigo = tolower(codigo),
    codigo = str_remove(codigo, "-"),
    codigo = str_remove(codigo, " "),
    codigo = str_remove(codigo, ":")
  )
  

# Deal with duplicates and wrong IDs
splits <- c("0738d58c-22c0-4a92-9922-d4cdf3e23816",
            "2f641a67-8647-47bd-9b4e-d9b2b6d8a2a4",
            "4fa5bac3-340e-4bbe-8d66-5ba504fa20d1",
            "1865ebf6-146e-45d5-8327-8b9aaef430e1",
            "0dd46466-1dfb-41b8-9deb-8dfa994d504d")

replacements <- tibble(c("rep_1", "rep_2", "rep_3", "rep_4", "rep_5"))

to_remove <- c("c7988739-c277-4f6e-bc16-9b1c33137c17",
               "fc2f54ce-ad43-4020-a58c-d18d27469353",
               "3bdb2279-7df9-4c9a-b861-024d109773a2",
               "1f3d4201-200a-491a-b6e7-d7ff13314a91",
               "d7e5dc4c-7aae-48dd-a0b3-245a89880593",
               "782efb12-f9bc-4c67-b7a6-9d9f52638a10",
               "fcc77193-ee90-460d-92bf-3bafe872680e",
               "39e27af6-1b22-4877-a9c8-372fa9f5246f",
               "a8905c3a-9953-4e2f-ab56-2cbb09c31b71",
               "4ef3cc92-2c38-4e30-a000-38a3d61112a9",
               "a8dc1068-5ff5-4f6a-b7ad-4aee65f6453f",
               "d26bd181-5773-40bd-8d0e-6b9ebcd16e6c",
               "91850753-e956-4b6c-9bdc-cc6c4b8ac5ac",
               "b4eaf0c1-76d0-4835-8dd6-5724e79c32f2",
               "471d6a2d-66b1-4a70-afa5-e0cde8c68d0c",
               "6c832b01-36ea-469f-9f67-ecde19602d83",
               "8983e53c-912d-4a1f-ae1d-3b81ad823882",
               "c6c7b6a8-3be4-4ceb-b972-3278dc9ba305",
               "7daa6395-3bdb-48ee-bcbb-d126d78383dd",
               "df2599a4-74f2-467d-ac65-cddb9abf9e41",
               "3b6e7b62-a6a9-49f7-8ccf-6b6f0e4600e6")

# Quickly remove problematic surveys (fix if Ecuador team has time to review)
sri_data_clean <- sri_data_clean %>%
  filter(!(uuid %in% to_remove))
sri_data_clean[sri_data_clean$uuid %in% splits, "codigo"] <- replacements

# Add variables for number of times a person is surveyed
sri_count <- sri_data_clean %>%
  arrange(fecha_encuesta) %>%
  group_by(codigo) %>%
  mutate(count = n()) %>%
  mutate(position = which(codigo == codigo)) %>%
  mutate(days_since_pre = as.numeric(fecha_encuesta - min(fecha_encuesta)) / 60 / 60 / 24) %>%
  ungroup() %>%
  arrange(codigo, fecha_encuesta) %>%
  mutate(
    measure_prop = position / count,
    in_program = count > 1
  )

# Create list of ids where surveys conducted after very short interval
ids_twos <- sri_count %>%
  filter(count == 2) %>%
  select(codigo, position, fecha_encuesta) %>%
  pivot_wider(names_from = position, values_from = fecha_encuesta) %>%
  mutate(days_diff = as.numeric(`2` - `1`) / 60 / 60 / 24) %>%
  filter(days_diff < 60) %>%
  pull(codigo)

# Create dataframe of problematic surveys to share with Ecaudor team
issues <- c("EC-0045255", "EC-0047632", "EC-0083024", "EC-0090595",
            "EC-0091882","EC-0092443", "Integra196", "Integra470", "Integra156",
            ids_twos)

sri_problems <- sri_count %>%
  arrange(codigo, fecha_encuesta) %>%
  filter(codigo %in% issues)

# Create wide dataset to calculate sri_change variable (ie, from BL to EL)
first_and_last <- sri_count %>%
  filter(
    count > 1,
    measure_prop == .25 | measure_prop == 1/3 | measure_prop == 1 | position == 1
  )

post_tests <- first_and_last %>%
  filter(position != 1) %>%
  select(codigo, fecha_post = fecha_encuesta,
         sri_post = hh_sri_total_score)

sri_wide <- first_and_last %>%
  filter(position == 1) %>%
  left_join(post_tests, by = "codigo") %>%
  mutate(
    time_period = as.numeric(fecha_post - fecha_encuesta),
    sri_change = sri_post - hh_sri_total_score
  )

# Save datasets to CSV (note, Spanish characters do not save well)
write_csv(sri_count, "sri_count.csv")
write_csv(sri_wide, "sri_wide.csv")

# Ad hoc graphs and analysis
sri_count %>%
  ggplot(aes(x = fecha_encuesta, y = hh_sri_total_score)) +
  geom_point(aes(color = project), alpha = .5) +
  geom_line(aes(group = codigo), alpha = .1) +
  theme_minimal(base_size = 18, base_family = "Open Sans") +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
#    legend.position = "none",
    axis.title = element_text(size = 12),
    axis.text = element_text(family = "Roboto Mono", size = 10),
#    axis.text.y = element_blank(),
    plot.caption = element_text(size = 9, color = "gray50"),
    panel.grid.minor.x = element_blank(),
    plot.background = element_rect(fill = "grey97", color = NA),
  )

sri_count %>%
  ggplot(aes(x = hh_sri_total_score, fill = project)) +
  stat_halfeye() +
  facet_wrap(~project) +
  theme_minimal()

sri_count %>%
  filter(count == 2) %>%
  group_by(position) %>%
  summarise(
    mean(hh_sri_total_score),
    n()
  )


sri_count %>%
  ggplot(aes(
    x = factor(position),
    y = hh_sri_total_score
    )) +
  geom_point(
    aes(color = factor(position)),
    alpha = .3
  ) +
  geom_line(aes(group = codigo), alpha = .1)

# Regression on wide data
mod <- lm(
  sri_change ~ hh_sri_total_score + nacionalidad + time_period + # project?
  nombre_del_evaluador,
  data = sri_wide
  )

mod %>% broom::tidy() %>% print(n = 43)
mod %>% broom::glance()
