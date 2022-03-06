clear all

//Importing CSV data
//I am using publically-accessible CSV data from the New Zealand Bureau of Statistics
//Download link: https://www.stats.govt.nz/large-datasets/csv-files-for-download/
import delimited "/Users/tristanwille/Desktop/Stata Modules/Data/nzEmploymentData.csv"
//Ok our data is in, but the second column is numeric data -- it should probably be a string?

clear all
import delimited "/Users/tristanwille/Desktop/Stata Modules/Data/nzEmploymentData.csv", stringcols(2)
//now, column 2's data is converted to string data!

//what if we wanted to convert something to numeric?
clear all
 
import delimited "/Users/tristanwille/Desktop/Stata Modules/Data/nzEmploymentData.csv", numericcols(1)
//doesn't make sense in this scenario (column 1 is obviously not numeric data), but you'd use a similar command!

//finally, if you ever forget this command, you can just use the import button under file. 

//Importing excel data
clear all
//sample airline data from http://www.principlesofeconometrics.com/excel.htm
import excel "/Users/tristanwille/Desktop/Stata Modules/Data/airline.xls", sheet("Sheet1") 
//now data is in, but the first row showing variable names is included as data -- how do we fix?
clear all

import excel "/Users/tristanwille/Desktop/Stata Modules/Data/airline.xls", sheet("Sheet1") firstrow 

//finally, if you wanted this numeric data saved as strings:
clear all
import excel "/Users/tristanwille/Desktop/Stata Modules/Data/airline.xls", sheet("Sheet1") firstrow allstring


