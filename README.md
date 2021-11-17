#  **Coming soon**:

  * create_data_dict(): 
  If the variables (columns): in the input dataset have associated metadata, create_data_dict
  incorporates them all by creating corresponding columns in the output data dictionary.
  * new feature: update index
  * new feature: QA functions for datasets and datadictionaries!

--------------------------------------------------------------------------------

# **latest version**: 2.0.1 update 01.01 - 1 Nov 2021

*This version includes*

* Updates:

  * [MAJOR UPDATE]: Update of all functions to fit with new Maelstrom standards. 
  The package version 1.00 has been archived.
  * **generate_original_study_bookdown_report()**: All new bookdown (html-based) 
  to get a summary of your original dataset (with the possibility to group by a 


## **Naming standardization**

| OLD                              |  NEW                             |
|:---------------------------------|:---------------------------------|
| harmonization project (plain Eng)| research initiative              |
| harmo_project                    | research_initiative              |
| dd             (R variable name) | data_dict                        |
| datadictionary (plain English)   | data dictionary                  |
| harmorule (plain English)        | data processing elements         |
| harmorule (long acronym)         | data_processing_elements         |
| harmorule (R variable name)      | data_proc_elem                   |
| original study (plain English)   | individual study                 |
| study specific (plain English)   | individual study                 |
| dataschema (plain English)       | DataSchema                       |
| rank (in data_proc_elem)         | index                            |
| opal (in documentation)          | Opal                             |

## **Mandatory standardization**

`label:en` is no longer mandatory. `label:` is instead.

`description:en` is no longer mandatory. 


## **Testing after updating to standards**
 
| Function                                  |  func test  | roxy   | vigtt  |
|:------------------------------------------|:------------|:-------|:-------|
| message_on_prompt                         |     X       |   -    |  -     |
| silently_run                              |     X       |   -    |  -     |
| parceval                                  |     X       |   -    |  -     |
| read_csv_sans_echec                       |     X       |   X    |  -     |
| read_excel_allsheets                      |     X       |   X    |  -     |
| as.mlstr_date                             | suppr       | suppr  |suppr   |
| harmonizR_help                            |     X       |   X    |  X     |
| project_envir_create                      |     X       |   X    |  X     |
| mlstr_file_index_create                   |     X       |   X    |  X     |
| mlstr_file_index_read                     |     X       |   X    |  X     |
| mlstr_file_index_search                   |     X       |   X    |  X     |
| create_data_dict                          |     X       |   X    |  -     |
| shape_dictionary_mlstr_format             | suppr       | suppr  |suppr   |
| mlstr_all_na_column                       |     X       |   X    |  -     |
| mlstr_count_tag                           |     X       |   X    |  -     |
| generate_individual_study_bookdown_report |     X       |   X    |  X     |
| generate_harmonized_study_bookdown_report |     X       |   X    |  X     |
| create_markdown_template                  |     X       |   X    |  -     |
| mlstr_identify_plot_type                  |     X       |   X    |  -     |
| mlstr_identify_viz_type                   |     X       |   X    |  -     |
| mlstr_plot_bar                            |     X       |   X    |  -     |
| mlstr_plot_box                            |     X       |   X    |  -     |
| mlstr_plot_date                           |     X       |   X    |  -     |
| mlstr_plot_density                        |     X       |   X    |  -     |
| mlstr_plot_histogram                      |     X       |   X    |  -     |
| mlstr_plot_main_word                      |     X       |   X    |  -     |
| mlstr_plot_pie                            |     X       |   X    |  -     |
| mlstr_plot_pie_valid_value                |     X       |   X    |  -     |
| mlstr_process_harmonization               |     X       |   X    |  -     |
| mlstr_summary_category                    |     X       |   X    |  -     |
| mlstr_summary_numerical                   |     X       |   X    |  -     |
| mlstr_summary_text                        |     X       |   X    |  -     |
| summarize_harmonization                   |     X       |   X    |  X     |
| harmo_parse_process_rule                  |     X       |   -    |  -     |
| rename_process_rule_columns               |     X       |   -    |  -     |
| harmo_process_add_variable                |     X       |   -    |  -     |
| harmo_process_case_when                   |     X       |   -    |  -     |
| harmo_process_direct_mapping              |     X       |   -    |  -     |
| harmo_process_function                    |     X       |   -    |  -     |
| harmo_process_id_creation                 |     X       |   -    |  -     |
| harmo_process_impossible                  |     X       |   -    |  -     |
| harmo_process_merge_variable              |     X       |   -    |  -     |
| harmo_process_operation                   |     X       |   -    |  -     |
| harmo_process_other                       |     X       |   -    |  -     |
| harmo_process_paste                       |     X       |   -    |  -     |
| harmo_process_recode                      |     X       |   -    |  -     |
| harmo_process_rename                      |     X       |   -    |  -     |
| harmo_process_undetermined                |     X       |   -    |  -     |
| create_project_in_opal                    |     X       |   X    |  -     |
| download_files_from_opal                  |     X       |   X    |  -     |
| download_tables_from_opal                 |     X       |   X    |  -     |
| upload_files_to_opal                      |     X       |   X    |  -     |
| upload_tables_to_opal                     |     X       |   X    |  -     |

* Suppression:
  * **as.mlstr_date()**: this function has been unpublished to correct it.


--------------------------------------------------------------------------------

# **version**: 1.00 update 10.01 - 30 oct 2021

*This version includes*

* Bug correction:
* Updates:
  * **generate_original_study_bookdown_report()**: All new bookdown (html-based) 
  to get a summary of your original dataset (with the possibility to group by a 
  variable, have ggplot output, plotly output, downloadable CSV datasets)
  * **generate_harmonized_study_bookdown_report()**: All new bookdown (html-based)
  to get a summary of your harmonized dataset (have ggplot output, plotly output, 
  downloadable CSV datasets)
  * **create_markdown_template()**: creates a template for the visual report bookdown
  * **mlstr_file_index_create()**: provides the path of the tree associated to the folder
  * **mlstr_file_index_read()**: this function can now open html files in user browser 
  and any other type of file in the R studio environment.
  format
* Suppression:
  * **create_dd_opal_format()**: this function has been unpublished to correct it.
* New feature:
  * **mlstr_identify_viz_type()**: Automatize identification of visual type based on value type of the variable
  * **mlstr_identify_plot_type()**: Generate R script of plots based on viz type of the variable.
  * **mlstr_count_tag()**:  Count tags in a datadictionary
  * **mlstr_all_na_column()**: Extract 'all NA' columns in a dataset
  * **mlstr_plot_main_word()**: Draws bar plot of one open text column in a dataset
  * **mlstr_plot_histogram()**: Draws histogram plot of one column in a dataset
  * **mlstr_plot_box()**: Draws box plot of one column in a dataset
  * **mlstr_plot_date()**: Draws lollipop plot of one time related column in a dataset
  * **mlstr_plot_bar()**: Draws bar plot of one column in a dataset
  * **mlstr_plot_density()**: Draws density line plot of one column in a dataset
  * **mlstr_plot_pie()**: Draws pie plot of one column in a dataset
  * **mlstr_plot_pie_valid_value()**: Draws pie plot of one column in a dataset (valid, non-valid and missing values)
  * **mlstr_summary_text()**: Create datatable of one (possibly grouped) text-type variable of a dataset
  * **mlstr_summary_numerical()**: Create datatable of one (possibly grouped) numerical-type variable of a dataset 
  * **mlstr_summary_category()**: Create datatable of one (possibly grouped) category-type variable of a dataset
  * **as.mlstr_date()**: xxx
* Deprecation:  
  * **mlstr_harmo_vizual_report_get()**: renamed to generate_harmonized_study_bookdown_report()
  * **mlstr_render_r_markdown()**: renamed to create_markdown_template()
* General:
  * Correction of typo
  * Substantial update of documentation in help center for all functions except Opal functions
  * Update of documentation for vignette
  * Creation of the vignette for the main purpose of the documentation
  * Documentation review: 
    * project_envir_create()
    * mlstr_file_index_create()
    * mlstr_file_index_search()
    * mlstr_file_index_read()
    * create_dd()
    * shape_dictionary_mlstr_format()
    * generate_original_study_bookdown_report()
    * generate_harmonized_study_bookdown_report()
    * mlstr_plot_main_word()
    * mlstr_plot_histogram()
    * mlstr_plot_box()
    * mlstr_plot_date()
    * mlstr_plot_bar()
    * mlstr_plot_density()
    * mlstr_plot_pie()
    * mlstr_plot_pie_valid_value()
    * mlstr_identify_viz_type()
    * mlstr_identify_plot_type()
    * mlstr_count_tag()
    * mlstr_all_na_column()
    * mlstr_summary_text()
    * mlstr_summary_numerical()
    * mlstr_summary_category()
    * create_markdown_template()
    
* Coming soon
  * download_files_from_opal(): does not allow to download a file. Only a folder. this
  will be corrected.
  * upload_tables_to_opal(): This function will soon handle the maelstrom taxonomy if the
  datadictionary is not in Opal format.
  * replace in index the relative path to the absolute path

--------------------------------------------------------------------------------

# **version**: 1.00 update 8.01 - 1 oct 2021

*This version includes*

* Bug correction:
  * **mlstr_file_index_create()**: haven library import included to handle spss,
  sav and dta files
  * **mlstr_process_harmonization()**: correction of undetermined function
* Updates:
  * **project_envir_create()**: names of folder are less restrictive. The user can 
  provide names starting with numbers.
* Suppression:
* New feature:
  * **harmonizR_help()**: description of versioning in rmd_file
  * **mlstr_file_index_create()**: handle spss files 
  * **mlstr_file_index_read()**: possibility to filter by extension
  * **read_excel_allsheets()**: possibility for the user to provide the names of
  the sheets they want to download. If the excel is composed of one sheet, the object
  is a tibble, else a list of tibbles
  * **mlstr_process_harmonization()**: possibility to re or post-harmonize an harmonized 
  variable
  * **mlstr_process_harmonization()**: auto attribution of the value type provided 
  * **mlstr_process_harmonization()**: new harmo rule!: rename  
  in the harmorule
* Deprecation:  
  * **package_version()**: renamed to harmonizR_help()
* General:
  * Correction of typo


--------------------------------------------------------------------------------

# **version**: 1.00 update 7.11 - 1 july 2021
*This version includes*

* Bug correction:
  * **project_envir_create()**: existing project can no longer be silently re-created
  * **shape_dictionary_mlstr_format()**: control order columns in Categories
* Updates:
  * **package_version()**: description of versioning
  * **project_envir_create()**: existing project can no longer be silently re-created
  * **mlstr_process_harmonization()**: suppression of date in harmonization report
  * **summarize_harmonization()**: percentage of success of harmonization shown 
  in the summary table
* Suppression:
  * **opal()** wrapper functions: Those functions will be corrected and updated 
  in a later version
  * **project_envir_create()**: 'provenance' column is no longer provided
* New feature:
  * **project_envir_create()**: possibility to create a version when none was
  * **mlstr_file_index_create()**: indicates whether the query returns empty output 
  anticipated in the first place. 
  Enter *copy_from = ""* 
  * **summarize_harmonization()**: show error in the console and not only the line code
* Deprecation:
  * **package_version()**: renamed to mlstr_package_version()
  * **mlstr_file_index_download()**: renamed to mlstr_file_index_read()
  * **check_error_1()**: renamed to summarize_harmonization()
* General:
  * Documentation: creation of parameter documentation in the function call
  * Correction of typo
  * Unnecessary function steps have been removed
  * Remove importation of car libs (may generate some conflicts in library call
