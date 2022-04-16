clear all 
use "/Users/tristanwille/Desktop/Stata Modules/Data/nzDataSubset.dta" //importing data, manually-created subset of labor statistics from NZ Stats Bureau

count //seeing how many observations we have

//what data structure does each variable have?

describe //describes our data set in terms of the data structures
describe period //info about just period
//what different values does a given variable attain?

tabulate period //different values it gets

//list command
list
//this is hard to read all of, what if we just want a random observation, and specific variables?
list period suppressed in 20
//can also use if statement
list period suppressed if _n <20 //first 20 observations
list period subject if suppressed == "Y"

//note that these "in" and "if" options available for summarize and tabulate as well

//now getting summary information about a given variable
summarize data_value
summarize data_value, detail

//note summarize does not work with non-numeric data
summarize units

//tabulate, on the other hand, does
tabulate units



