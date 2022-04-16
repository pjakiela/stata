clear all

display 7 - 4
dis 7 - 4
di 7 - 4
//d 7-4 -- this wouldn't work because "d" is an ambiguous abbreviation

//this applies to any command, and variable names as well
clear all
use "/Users/tristanwille/Desktop/Stata Modules/Data/mpd2020.dta"

tab country if _n <100 //note that this is also an abbreviation for countrycode, but it works since the full variable name takes precedence over an abbreviation

//tab count if _n < 100 -- this also won't work because it's an ambiguous abbreviation

tab countryc if _n <100
