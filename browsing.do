//Browsing Data
clear all
use "/Users/tristanwille/Desktop/Stata Modules/Data/mpd2020.dta"
browse
//what if I want to sort something in ascending order? Or alphabetical if it's a string
sort pop
drop if pop ==.
browse
//what about for descending order?
gsort - pop //gsort is a more complex sort, by negating population, it's essentially making it ascending order 
//What if I want to convert some numerical data to a string?
tostring year, replace
//What if I want to convert string data to numeric?
destring year, replace
