#### templates ####

library(tidyverse)
library(fabR)
library(madshapR)
library(harmonizR)
library(fs)

#### data_proc_elem_template ####
data_proc_elem_template <- 
  DEMO_files_harmo$`data_processing_elements - final` %>%
  as_data_proc_elem() %>%
  slice(4,8) %>%
  mutate(
    index = c(1,2) ,
    ss_table = c('STUDY_1','STUDY_1'),
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
  as_dataset(col_id = 'part_id') 

#### dossier_template ####
dossier_template <- 
  dossier_create(list(
    STUDY_1 = data_dict_apply(dataset_template, data_dict_template)))

#### harmonized_dossier_template ####
harmonized_dossier_template <- harmo_process(
  dossier = dossier_template,
  dataschema = dataschema_template,
  data_proc_elem = data_proc_elem_template)

#### test harmonization ####
show_harmo_error(harmonized_dossier_template)

#### ss_dataschema_template ####
ss_dataschema_template <- 
  data_dict_extract(harmonized_dossier_template$STUDY_1)

#### pooled_harmonized_dataset_template ####
pooled_harmonized_dataset_template <- 
  pooled_harmonized_dataset_create(harmonized_dossier_template)

#### harmonized_dataset_template ####
harmonized_dataset_template <- harmonized_dossier_template$STUDY_1

path = "C:/Users/guill/OneDrive/Bureau/R/harmonizR-documentation/"
try(dir_delete(paste0(path,'docs/templates/')))

write_excel_allsheets( dataschema_template,                paste0(path,"docs/templates/dataschema - template.xlsx"))
write_excel_allsheets( ss_dataschema_template,             paste0(path,"docs/templates/ss_dataschema - template.xlsx"))
write_excel_allsheets( data_dict_template,                 paste0(path,"docs/templates/data_dictionary - template.xlsx"))
write_excel_allsheets( dossier_template,                   paste0(path,"docs/templates/dossier - template.xlsx"))
write_excel_allsheets( harmonized_dossier_template,        paste0(path,"docs/templates/harmonized_dossier - template.xlsx"))
write_excel_csv2(na = '',   data_proc_elem_template,            paste0(path,"docs/templates/data_processing_elements - template.csv"))
write_excel_csv2(na = '',   dataset_template,                   paste0(path,"docs/templates/dataset - template.csv"))
write_excel_csv2(na = '',   harmonized_dataset_template,        paste0(path,"docs/templates/harmonized_dataset - template.csv"))
write_excel_csv2(na = '',   pooled_harmonized_dataset_template, paste0(path,"docs/templates/pooled_harmonized_dataset - template.csv"))  


dataschema_demo <- as_dataschema_mlstr(DEMO_files_harmo$`dataschema - final`)
data_proc_elem_demo <- as_data_proc_elem(DEMO_files_harmo$`data_processing_elements - final`)
dd_MELBOURNE_1_demo <- as_data_dict_mlstr(DEMO_files$dd_MELBOURNE_1_format_maelstrom)
dd_MELBOURNE_2_demo <- as_data_dict_mlstr(DEMO_files$dd_MELBOURNE_2_format_maelstrom)
dd_PARIS_demo <- as_data_dict_mlstr(DEMO_files$dd_PARIS_format_maelstrom)
dd_TOKYO_demo <- as_data_dict_mlstr(DEMO_files$dd_TOKYO_format_maelstrom_tagged)
dataset_MELBOURNE_1_demo <- DEMO_files$dataset_MELBOURNE_1
dataset_MELBOURNE_2_demo <- DEMO_files$dataset_MELBOURNE_2
dataset_PARIS_demo <- DEMO_files$dataset_PARIS
dataset_TOKYO_demo <- DEMO_files$dataset_TOKYO
study_specific_dossier_demo       <- 
  dossier_create(list(
    dataset_MELBOURNE_1 = dataset_MELBOURNE_1_demo,
    dataset_MELBOURNE_2 = dataset_MELBOURNE_2_demo,
    dataset_PARIS = dataset_PARIS_demo,
    dataset_TOKYO = dataset_TOKYO_demo))

write_excel_allsheets(    dataschema_demo,             paste0(path,"demo-files/dataschema - demo.xlsx"))
write_excel_allsheets(    dd_MELBOURNE_1_demo,         paste0(path,"demo-files/data dictionary MELBOURNE_1 - demo.xlsx"))
write_excel_allsheets(    dd_MELBOURNE_2_demo,         paste0(path,"demo-files/data dictionary MELBOURNE_2 - demo.xlsx"))
write_excel_allsheets(    dd_PARIS_demo,               paste0(path,"demo-files/data dictionary PARIS - demo.xlsx"))
write_excel_allsheets(    dd_TOKYO_demo,               paste0(path,"demo-files/data dictionary TOKYO - demo.xlsx"))
write_excel_allsheets(    study_specific_dossier_demo, paste0(path,"demo-files/study specific dossier - demo.xlsx"))
write_excel_csv2(na = '', data_proc_elem_demo,         paste0(path,"demo-files/data_processing_elements - demo.csv"))
write_excel_csv2(na = '', dataset_MELBOURNE_1_demo,    paste0(path,"demo-files/dataset MELBOURNE_1 - demo.csv"))
write_excel_csv2(na = '', dataset_MELBOURNE_2_demo,    paste0(path,"demo-files/dataset MELBOURNE_2 - demo.csv"))
write_excel_csv2(na = '', dataset_PARIS_demo,          paste0(path,"demo-files/dataset PARIS - demo.csv"))
write_excel_csv2(na = '', dataset_TOKYO_demo,          paste0(path,"demo-files/dataset TOKYO - demo.csv"))

files2zip <- dir('demo-files', full.names = TRUE)
zip(zipfile = 'demo-files', files = files2zip)
dir_delete('demo-files')
file_copy('demo-files.zip','docs/demo-files.zip',overwrite = TRUE)
file_delete('demo-files.zip')



