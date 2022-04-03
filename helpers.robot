*** Settings ***
Library    RPA.Dialogs

*** Keywords ***

Display Picker
  Add heading     PDF Keywords Extractor
  Add file input    name=files     file_type=PDF files (*.pdf)    multiple=true
  Add text input    name=keywords     label=Keywords (comma separated)
  ${result}=      Run dialog

  [Return]    ${result.files}    ${result.keywords}