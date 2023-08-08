library(tidyverse)
library(DT)

#### glossary ####
glossary <-
  tribble(
    ~`Object`,
    ~`Requirement`,

    # dataschema
    '<h3>DataSchema</h3>
A DataSchema defines the harmonized variables to be generated, representing 
meta data of an associated harmonized dossier. It must be a 
list of data frame like objects with elements named "Variables" (required) 
and "Categories" (if any). The "Variables" element must contain at least the 
`name` column, and the "Categories" element must contain at least the 
`variable` and `name` columns to be usable in any function. To be considered 
as a minimum workable DataSchema, in "Variables" the `name` column must also 
have unique and non-null entries, and in "Categories" the combination of 
`variable` and `name` columns must also be unique.
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/dataschema%20-%20template.xlsx"
      download>Download template</a>
    </button>
    
    ',
    
    '<p style="color:red"><b>Variables</b></p>
      <ul>
        <li style="color:red">name</li>
        <li>label:xx</li> 
        <li>valueType</li>
      </ul>
     <p><b>Categories</b></p>
      <ul>
        <li style="color:red">variable</li>
        <li style="color:red">name</li> 
        <li>label::xx</li>
        <li>missing</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = data_dict_mlstr</li>
        <li style="color:red">harmonizR::class = Dataschema_mlstr</li>
      </ul>',
    
    # ss dataschema 
    '<h3>Study specific dataSchema</h3>

    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/ss_dataschema%20-%20template.xlsx"
      download>Download template</a>
    </button>

    ',

    '<p style="color:red"><b>Variables</b></p>
      <ul>
        <li style="color:red">name</li>
        <li>label:xx</li> 
        <li>valueType</li>
        <li>Mlstr::rule_category</li>
        <li>Mlstr::algorithm</li>                                               
        <li>Mlstr::status</li>                                               
        <li>Mlstr::status_detail</li>
        <li style="color:red">attributes madshapR::class = data_dict_mlstr</li>
        <li style="color:red">attributes harmonizR::class = Dataschema_mlstr</li>
      </ul>
    
     <p><b>Categories</b></p>
      <ul>
        <li style="color:red">variable</li>
        <li style="color:red">name</li> 
        <li>label::xx</li>
        <li>missing</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = data_dict_mlstr</li>
        <li style="color:red">harmonizR::class = Dataschema_mlstr</li>
      </ul>',
    
    # data processing elements
    '<h3>Data Processing Elements</h3>
    
The Data Processing Element (DPE) is a table that gathers all the harmonization 
rules used to create each variable defined in the dataSchema. This table is 
typically an Excel spreadsheet where each row indicates how the 
study-specific variables are processed to generate a harmonized variable. 
Once this table is filled, it is used in the harmo_process() function along with 
the other two parameters (data_schema and dossier) to create the 
harmonized_dossier. If harmonization cannot be performed correctly due to errors 
in the DPE, the harmonized_dossier generated can be sent to the 
show_harmo_error() function, allowing the user to correct the DPE and restart 
the process.
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/data_processing_elements%20-%20template.csv"
      download>Download template</a>
    </button>
    
    ',

    '<p><b><em>(Data processing elements name)</em></b></p>
      <ul>
        <li style="color:red">dataschema_variable</li>
        <li>label::xx</li>
        <li>valueType</li>
        <li style="color:red">ss_table</li>
        <li style="color:red">Mlstr::rule_category</li>
        <li style="color:red">Mlstr::algorithm</li>
        <li>Mlstr::status</li> 
        <li>Mlstr::status_detail</li>
        <li>missing</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">harmonizR::class = data_proc_elem</li>
      </ul>',
    
    # data_dict
    '<h3>Data dictionary</h3>
A data dictionary contains metadata about variables and can be associated 
with a dataset. It must be a list of data frame-like objects with elements 
named "Variables" (required) and "Categories" (if any). To be usable in any 
function, the "Variables" element must contain at least the `name` column, 
and the "Categories" element must contain at least the `variable` and `name` 
columns. To be considered as a minimum workable data dictionary, in 
"Variables" the `name` column must also have unique and non-null entries, 
and in "Categories" the combination of `variable` and `name` columns must 
also be unique.
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/data_dictionary%20-%20template.xlsx"
      download>Download template</a>
    </button>
    
    ',

    '<p style="color:red"><b>Variables</b></p>
      <ul>
        <li style="color:red">name</li>
        <li>label:xx</li> 
        <li>valueType</li>
      </ul>
     <p><b>Categories</b></p>
      <ul>
        <li style="color:red">variable</li>
        <li style="color:red">name</li> 
        <li>label::xx</li>
        <li>missing</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = data_dict_mlstr</li>
      </ul>',
    
    # dataset
    '<h3>Dataset</h3>
A dataset must be a data frame-like object and can be associated with a 
data dictionary. If no data dictionary is provided, a minimum workable 
data dictionary will be generated as needed by relevant functions. 
An identifier `id` column for sorting can be specified by the user. If 
specified, the `id` values must be non-missing and will be used in functions 
that require it. If no identifier column is specified, indexing is handled 
automatically by the function.
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/dataset%20-%20template.csv"
      download>Download template</a>
    </button>
    
    ',

    '<p><b><em>(Dataset name)</em></b></p>
      <ul>
         <li style="color:red">col_id</li>
         <li>col_2</li>
         <li>...</li>
       </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = dataset</li>
        <li style="color:red">madshapR::col_id</li>
      </ul>',
    
    # dossier
    '<h3>Dossier</h3>
A dossier must be a named list containing at least one data frame or
data frame extension (e.g. a tibble), each of them being datasets.
The name of each tibble will be use as the reference name of the dataset.
    
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/dossier%20-%20template.xlsx"
      download>Download template</a>
    </button>
    
    ',

    '<p><b><em>(Dossier name)</em></b></p>
      <ul>
        <li style="color:red">dataset 1</li>
        <li>dataset 2</li>
        <li>...</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = dossier</li>
      </ul>',
    
    # harmo_dataset
    '<h3>Harmonized dataset</h3>

    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/harmonized_dataset%20-%20template.csv"
      download>Download template</a>
    </button>
    
    ',

    '<p><b><em>(Harmonized dataset name)</em></b></p>
      <ul>
         <li style="color:red">dataschema_variable_id</li>
         <li>dataschema_variable_2</li>
         <li>...</li>
       </ul>
      
    <p><b>R attributes</b></p>
      <ul>
        <li style="color:red">madshapR::class = dataset</li>
        <li style="color:red">madshapR::col_id</li>
      </ul>',
    
    # pooled harmonized dataset
    '<h3>Harmonized dataset</h3>
The first column refers to the name of each dataset which is the name of each
tibble in the dossier. The second colunm refers to the column id in each 
harmonized dataset and  which identifies unique combination (concatenated)
observation/dataset. These two columns are added to ensure every information 
is safe during the process. The pooled_harmonized dataset comes with its 
data dictionary which is the harmonized dossier dataSchema, to which the 
two extra columns are added.
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/pooled_harmonized_dataset%20-%20template.csv"
      download>Download template</a>
    </button>
    
    ',
    
    '<p><b><em>(Pooled harmonized dataset name)</em></b></p>
      <ul>
         <li style="color:red">unique_col_id</li>
         <li style="color:red">unique_col_dataset</li>
         <li style="color:red">dataschema_variable_id</li>
         <li>dataschema_variable_2</li>
         <li>...</li>
       </ul>
      
    <p><b>R attributes</b></p>
      <ul>
         <li style="color:red">madshapR::class = dataset</li>
         <li style="color:red">madshapR::col_id</li>
         <li style="color:red">harmonizR::class = pooled_harmonized_dataset</li>
         <li style="color:red">harmonizR::unique_col_id</li>
         <li style="color:red">harmonizR::unique_col_dataset</li>
      </ul>',
    
    # harmo_dossier
    '<h3>Harmonized dossier</h3>
A harmonized dossier must be a named list containing at least one data frame 
or data frame extension (e.g. a tibble), each of them being 
harmonized dataset(s). It is generally the product of applying harmonization 
processing to a dossier object. The name of each tibble will be use as the 
reference name of the dataset. A harmonized dossier has four attributes :
`harmonizR::class` which is "harmonized_dossier" ; `harmonizR::Dataschema` 
(provided by user) ; `harmonizR::data processing elements` ; 
`harmonizR::harmonized_col_id` (provided by user) which refers to the column 
in each dataset which identifies unique combination observation/dataset. 
This id column name is the same across the dataset(s), the DataSchema and 
the data processing elements (created by using `id_creation`) and is used to 
initiate the process of harmonization.
    
    <br><br>
    
    <button><a 
      href="https://maelstrom-research.github.io/harmonizR-documentation/templates/harmonized_dossier%20-%20template.xlsx"
      download>Download template</a>
    </button>
    
    ',

    '<p><b><em>(Harmonized dossier name)</em></b></p>
      <ul>
        <li style="color:red">dataset 1</li>
        <li>dataset 2</li>
        <li>...</li>
        <li style="color:red">attributes harmonizR::class = harmonized_dossier</li>
      </ul>
      
    <p><b>R attributes</b></p>
      <ul>
         <li style="color:red">harmonizR::class = harmonized_dossier</li>
         <li style="color:red">harmonizR::Dataschema</li>
         <li style="color:red">harmonizR::harmonized_col_id</li>
      </ul>'
    
  )
  

#### data_proc_elem_def ####
data_proc_elem_def <- 
  tribble(
    ~`column name`,~`definition`, ~`mandatory`,
    '<code><b>dataschema_variable</b></code>' , 'Variable defined in the dataSchema'                         ,'<b>YES</b>',
    '<code><b>ss_table</b></code>'            , 'Study specific table where the <br>
                                                 study specific variable is taken from'                      ,'<b>YES</b>',
    '<code><b>ss_variables</b></code>'        , 'Study specific variable (name of the column in the dataset)','<b>YES</b>',
    '<code><b>Mlstr::rule_category</b></code>', 'Rule category'                                              ,'<b>YES</b>',
    '<code><b>Mlstr::algorithm</b></code>'    , 'Algorithm associated to the rule category'                  ,'<b>YES</b>',
    '<code><b>Mlstr::status</b></code>'       , 'Harmonization status.if the column<br>
                                                 is not provided or empty, it will<br>
                                                 be automatically generated during <br>
                                                 the process, and any empty cell<br>
                                                 will be filled with <code>complete</code><br>
                                                 or <code>impossible</code> accordingly'                      ,'NO')



mlstr_status <-
  tribble(
    ~`Mlstr::status`,~`definition`,~`Mlstr::status_detail`,
    '<code><b>complete</b></code>'      , 
    'Study-specific variable :
     <ul>
           <li>is the same</li>
           <li>Needs transformation</li> 
           <li>unknown</li>
     </ul>',
    
    '<br>
     <ul>
           <li><code>identical</code></li>
           <li><code>compatible</code></li>
           <li><code>unknown</code></li>
     </ul>',
    
    
    
    '<code><b>partial*</b></code>',
    'With loss of information, study-specific variable :
     <ul>
           <li>approximates results</li>
           <li>needs confirmation</li> 
           <li>unknown</li>
     </ul>',
    
    '<br>
     <ul>
           <li><code>proximate</code></li>
           <li><code>tentative</code></li>
           <li><code>unknown</code></li>
     </ul>',
    
    
    '<code><b>impossible</b></code>'       ,
    'The dataSchema variable :
     <ul>
           <li>is not collected</li>
           <li>cannot be used</li> 
           <li>unknown</li>
     </ul>',
    
    '<br>
     <ul>
           <li><code>unavailable</code></li>
           <li><code>incompatible</code></li>
           <li><code>unknown</code></li>
     </ul>',
    
    '<code><b>undetermined</b></code>'  , 'Harmonization status not determined.','',
    '<code><b>na</b></code>'            , 'Harmonization status is not relevant.','',
    '<code><b>error</b></code>'         , 'When error, the error message provided <brr>
                                           by R is stored here','') 

#### col_names_dpe ####

col_names_dpe <- c(
  '<b>dataschema_variable</b>',
  '<b>ss_table</b>', 
  '<b>ss_variables</b>', 
  '<b>Mlstr::rule_category</b>', 
  '<b>Mlstr::algorithm</b>', 
  '<b>Mlstr::status</em></b>')

#### id_creation ####
id_creation    = paste(
  '<code>',c(
    'variable_ID',
    'DATASET',
    'col_id', 
    '<b>id_creation</b><em style="color:red"> (mandatory)</em>', 
    '<b>id_creation</b>',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()

#### direct_mapping ####
direct_mapping =   paste(
  '<code>',c(
    'variable_A',
    'DATASET',
    'var_x'         , 
    '<b>direct_mapping</b>', 
    '<b>direct_mapping</b>',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()

#### recode ####
recode         =   paste(
  '<code>',c(
    'variable_B',
    'DATASET',
    'var_y'                              , 
    '<b>recode</b>'                             , 
    '<b>recode(</b>           
  "YES" = 1 ;         
  "NO"  = 0 ;   
  ELSE  = NA<b>) </b>',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()


#### case_when ####
case_when      =   paste(
  '<code>',c(
    'variable_C',
    'DATASET',
    'var_x ; var_z'                 , 
    '<b>case_when</b>'               , 
    '<b>case_when(</b>      
  var_x == 1 ~ var_z ;
  ELSE       ~ NA<b>)</b>',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()

#### paste ####
paste          =   paste(
  '<code>',c(
    'variable_D',
    'DATASET',
    '<b>__BLANK__</b>'   , 
    '<b>paste</b>'  , 
    'Hello word',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()


#### operation ####
operation      =   paste(
  '<code>',c(
    'variable_E',
    'DATASET',
    'var_x'              , 
    '<b>operation</b>'     , 
    'var_x - mean(var_x) / stats::sd(var_x)',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()

#### other ####
other          =  paste(
  '<code>',c(
    'variable_F',
    'DATASET',
    '<b>__BLANK__</b>' , 
    '<b>other</b>'     , 
    '# place R code here...',  
    '<b>complete</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()

#### impossible ####
impossible     =   paste(
  '<code>',c(
    'variable_G',
    'DATASET',
    '<b>impossible</b>' , 
    '<b>impossible</b>' , 
    '<b>impossible</b>',  
    '<b>impossible</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row() 

#### undetermined ####
undetermined     =   paste(
  '<code>',c(
    'variable_H',
    'DATASET',
    '<b>undetermined</b>' , 
    '<b>undetermined</b>' , 
    '<b>undetermined</b>',  
    '<b>undetermined</b>'),
  '</code>') %>% setNames(col_names_dpe) %>% as_tibble_row()


#### rule_categories ####
rule_categories <- 
  bind_rows(
    id_creation,
    direct_mapping,
    recode,
    case_when,
    operation,
    paste,
    other,
    impossible,
    undetermined)


#### data_proc_elem_expl ####

data_proc_elem_expl <- 
  rule_categories %>% slice(1:3) %>%
  mutate(`<b>ss_table</b>` = str_replace(
    `<b>ss_table</b>`,'DATASET','dataset_MELBOURNE')) %>%
  
  bind_rows(
    
    rule_categories %>% slice(1,5,8) %>%
      mutate(`<b>ss_table</b>` = str_replace(
        `<b>ss_table</b>`,'DATASET','dataset_PARIS')) %>%
      mutate(`<b>ss_variables</b>` = str_replace(
        `<b>ss_variables</b>`,'col_id','ID_part')) %>%
      mutate(`<b>dataschema_variable</b>` = str_replace(
        `<b>dataschema_variable</b>`,'variable_E','variable_A')) %>%
      mutate(`<b>dataschema_variable</b>` = str_replace(
        `<b>dataschema_variable</b>`,'variable_G','variable_B'))
  ) %>%
  mutate(`<b>dataschema_variable</b>` = str_replace(
    `<b>dataschema_variable</b>`,'variable_ID','<b>variable_ID</b>')) %>%
  mutate(`<b>Mlstr::rule_category</b>` = ifelse(
    str_detect(`<b>dataschema_variable</b>`, 'variable_ID'),
    '<code><b>id_creation</b></code>',`<b>Mlstr::rule_category</b>`)) %>%
  add_column(`<b>index</b>` = c(
    '<code>1</code>','<code>2</code>','<code>3</code>',
    '<code>1</code>','<code>2</code>','<code>3</code>'),.before = TRUE) %>%
  select(-last_col())

#### DT_rule_categories ####
DT_rule_categories <- 
  rule_categories %>%
  datatable(
    extensions = "Buttons",
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(
      searching = FALSE,
      paging = FALSE,
      info = FALSE,
      scrollX = FALSE,
      ordering = FALSE,
      pageLength = nrow(.), 
      dom = 'Bfrtip',
      buttons = c('copy', 'csv', 'excel')
    ))

#### DT_glossary ####
DT_glossary <- 
  glossary %>%
  datatable( 
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(
      pageLength = nrow(.), 
      ordering = TRUE,
      autoWidth = TRUE,
      columnDefs = list(list(width = '50%', targets = c(1)))))  %>%
  formatStyle(seq_len(ncol(.$x$data)),'vertical-align'='top') %>% 
  formatStyle(seq_len(ncol(.$x$data)),'text-align' = 'left')


#### DT_data_proc_elem_expl ####
DT_data_proc_elem_expl <- 
  data_proc_elem_expl %>%
  datatable( 
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(pageLength = nrow(.), ordering = TRUE),
    autoHideNavigation = TRUE)

#### DT_impundebla ####
DT_impundebla <- 
  rule_categories %>%
  select(-last_col()) %>%
  filter(str_detect(`<b>ss_variables</b>`, 'BLANK|impossible|undetermined')) %>%
  datatable( 
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

#### DT_id_creation ####
DT_id_creation <- 
  t(id_creation %>%  
      select(-last_col()) %>%
  mutate(`<b>Mlstr::rule_category</b>` = ifelse(
    str_detect(`<b>dataschema_variable</b>`, 'variable_ID'),
    '<code><b>id_creation</b></code>',`<b>Mlstr::rule_category</b>`))) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_direct_mapping <- 
  t(direct_mapping %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_recode <- 
  t(recode %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_case_when <- 
  t(case_when %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_paste <- 
  t(paste %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_operation <- 
  t(operation %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)


DT_other <- 
  t(other %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_impossible <- 
  t(impossible %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

DT_undetermined <- 
  t(undetermined %>% select(-last_col())) %>%
  datatable( 
    escape = FALSE,
    colnames = rep('',ncol(.)),
    class = 'cell-border stripe',
    filter = 'none',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)


#### DT_mlstr_status ####
DT_mlstr_status <-
  mlstr_status %>%
  datatable( 
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

#### DT_data_proc_elem_def ####
DT_data_proc_elem_def <-
  data_proc_elem_def %>%
  datatable( 
    escape = FALSE,
    rownames = FALSE,
    class = 'cell-border stripe',
    options = list(pageLength = nrow(.), ordering = FALSE),
    autoHideNavigation = TRUE)

