*** Settings ***
Documentation     Template robot main suite.
Library    RPA.PDF
Library    Collections
Library    RPA.Tables
Library    RPA.FileSystem
Library    String
Resource    helpers.robot

*** Tasks ***
Extract Text
    ${files}    ${keywords}=    Display Picker

    ${keywordsToLowercase}=    Evaluate     "${keywords}".lower()
    ${keywordsList}=    Split String    ${keywordsToLowercase}    ,
    ${joinedKeywords}=    Catenate    SEPARATOR=|    @{keywordsList}

    ${csvData}=    Create List


    FOR    ${file}    IN    @{files}
        ${text}=    Get Text From PDF    ${file}
        ${matches}=    Get Regexp Matches    ${text[1]}    ${joinedKeywords}
        ${deduplicatedMatches}=    Remove Duplicates    ${matches}
        ${joinedDeduplicatedMatches}=    Catenate    SEPARATOR=,    @{deduplicatedMatches}
        ${currentFile}=    Create Dictionary    file=${file}    keywords=${joinedDeduplicatedMatches}
        Append To List    ${csv_data}    ${currentFile}

    END

    ${csvData}=    Create table    ${csvData}

    Write table to CSV    ${csvData}    ${OUTPUT_DIR}${/}pdf_with_keywords.csv