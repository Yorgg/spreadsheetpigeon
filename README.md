# SpreadsheetPigeon
A simple API proxy for accessing Google Spreadsheets data.

## Endpoints 

* **GET**  /spreadsheet

Returns data for a spreadsheet and requires the following parameters:

* **s_id=**spreadsheet_id (ID of the spreadsheet)

* **range=**range (Range of data)  

### example
https://name-of-api/spreadsheet?s_id=12345&range=sheet1

## Why?
Useful for very basic SPA's (githubpages), as the client can make ajax requests without worrying about API key security or CORS issues.  
