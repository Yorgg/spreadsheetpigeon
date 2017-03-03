# SpreadsheetPigeon
A simple API proxy for accessing Google Spreadsheets data.

## Endpoints 

* **GET**  /spreadsheet

Returns data for a spreadsheet and requires the following parameters:

* **s_id=**spreadsheet_id (ID of the spreadsheet)

* **range=**range (Range of data)  

### example
https://url-prefix/spreadsheet?s_id=12345&range=sheet1

