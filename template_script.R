#### templates ####

library(tidyverse)
library(fabR)
library(madshapR)
library(harmonizR)

#### data_proc_elem_template ####
data_proc_elem_template <- 
  DEMO_files_harmo$`data_processing_elements - final` %>% .[[1]] %>%
  as_data_proc_elem() %>%
  select(
    index,dataschema_variable,valueType, ss_table, ss_variables,
    `Mlstr::rule_category`,`Mlstr::algorithm`,`Mlstr::status`) %>%
  as_data_proc_elem() %>% 
  slice(4,8) %>%
  mutate(
    index = c(1,2) ,
    ss_table = c('DATASET','DATASET'),
    `Mlstr::algorithm` = c("part_id","'study_1'"))

#### dataschema_template ####
dataschema_template <- 
  list(Variables = 
         DEMO_files_harmo$`dataschema - final`$Variables %>%
         select(name, `label:en`,valueType) %>% slice(1,2),
       Categories = 
         DEMO_files_harmo$`dataschema - final`$Categories %>%
         select(variable, name, `label:en`, missing) %>% slice(1) %>%
         mutate(variable = 'adm_study', `label:en` = 'Study n. 1', name = 'study_1', missing = FALSE)) %>%
  as_data_dict_mlstr()

#### data_dict_template ####
data_dict_template <- 
  list(Variables = 
         DEMO_files$dd_TOKYO_format_maelstrom_tagged$Variables %>%
         select(name, `label:en`,valueType) %>% slice(1) %>%
         add_row(name = 'cat_example', 
                 `label:en` = "Categorical variable. See 'Categories'", 
                 valueType = 'integer'),
       Categories = 
         DEMO_files$dd_TOKYO_format_maelstrom_tagged$Categories %>%
         select(variable, name, `label:en`, missing) %>% slice(0) %>%
         add_row(variable = 'cat_example', 
                 `label:en` = 'First category' , 
                 name = '1'   , missing = FALSE) %>%
         add_row(variable = 'cat_example', 
                 `label:en` = 'Second category', 
                 name = '2'   , missing = FALSE) %>%
         add_row(variable = 'cat_example', 
                 `label:en` = 'Missing category (Do not want to answer, skip pattern, etc.)', 
                 name = '-77' , missing = TRUE)) %>%
  as_data_dict_mlstr()


#### dataset_template ####
dataset_template <- 
  DEMO_files$dataset_TOKYO %>%
  select(1) %>%
  slice(1) %>%
  add_column(cat_example = 1L) %>%
  as_dataset(col_id = 'part_id') %>%
  write_csv("templates/dataset - template.csv")

harmo_process(
  dossier = dossier_create(list(
    DATASET = data_dict_apply(dataset_template, data_dict_template))),
  dataschema = dataschema_template,
  data_proc_elem = data_proc_elem_template) %>% 
  show_harmo_error()

write_excel_allsheets(dataschema_template, "templates/dataschema - template.xlsx")
write_csv(data_proc_elem_template, "templates/data_processing_elements - template.csv")
write_excel_allsheets(data_dict_template, "templates/data_dictionary - template.xlsx")
write_csv(dataset_template, "templates/dataset - template.csv")
  
