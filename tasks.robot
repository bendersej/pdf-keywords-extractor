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
        ${pages}=    Get Text From PDF    ${file}

        FOR    ${pageNumber}    IN    @{pages}
            ${matches}=    Get Regexp Matches    ${pages[${pageNumber}]}    (?im)${joinedKeywords}
            ${deduplicatedMatches}=    Remove Duplicates    ${matches}
            ${deduplicatedMatchesCount}=    Get Length    ${deduplicatedMatches}

            Continue For Loop If    ${deduplicatedMatchesCount} == ${0}

            ${joinedDeduplicatedMatches}=    Catenate    SEPARATOR=,    @{deduplicatedMatches}
            ${currentFile}=    Create Dictionary    file=${file} - page ${pageNumber}    keywords=${joinedDeduplicatedMatches}
            Append To List    ${csv_data}    ${currentFile}
        END

    END

    ${csvData}=    Create table    ${csvData}

    Write table to CSV    ${csvData}    ${OUTPUT_DIR}${/}pdf_with_keywords.csv