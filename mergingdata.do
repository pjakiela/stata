//Merging data sets
clear all
//both fake data sets I made about hypothetical Psychology classes
//Let's look at the first data set
use "/Users/tristanwille/Desktop/Stata Modules/Data/classdata1.dta"
browse
//Let's look at the second data set
clear all
use "/Users/tristanwille/Desktop/Stata Modules/Data/classdata2.dta"
browse

clear all
//Notice that these all use the same base data -- the same set of classes
//So, we can merge these two data sets one-to-one, meaning each observation has the 

clear all

use "/Users/tristanwille/Desktop/Stata Modules/Data/classdata1.dta"
merge 1:1 classnumber using "/Users/tristanwille/Desktop/Stata Modules/Data/classdata2.dta"
//if you didn't have this matching common variable of "classnumber", you could match by observation, meaning that an observation in one data set is the same as another, even if the underlying data are different (ie. there is no common variable like "classnumber") by using 'merge 1:1 _n'
browse
drop _merge
browse
//Now observations are matched and combined neatly

//m:1 merging, like VLOOKUP in excel
clear all
cd "/Users/tristanwille/Desktop/Stata Modules/Data/"
// open first dataset
use "food-orders.dta", clear
// try to merge prices. doesn't work 1:1 because multiple people ordered the same item.
//merge 1:1 fooditem using "food-prices.dta"
// so merge m:1 instead:
merge m:1 fooditem using "food-prices.dta"
// what didn't merge? nobody ordered this one thing:
tab fooditem if _merge==2
// keep the matches
keep if _merge==3
// now we can compute the total price of the order for everyone if we like:
sum price
display r(sum)



//Note: Not all data are so neat! You can still merge using a 1:m or m:m -- see command "help merge", especially the pdf manual entry

