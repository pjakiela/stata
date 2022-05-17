clear all

sysuse auto

//Loops -- very useful for recursion/repetition

//forvalues -- looping over consecutive values
//Let's say we wanted to make cubic variables for mpg

forval i = 1/3 { 
	gen mpg`i' = mpg^`i' 
} 

//foreach -- looping over specific items

gen large = 0

foreach i of varlist headroom trunk weight length {
	replace large = 1 if `i' >= 3000
}
 

