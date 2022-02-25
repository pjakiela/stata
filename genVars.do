clear all
set seed 12345

sysuse auto //This is dummy data about cars preloaded into stata

//Different syntaxes for generating dummies


//Simplest:

generate expensive = 0
replace expensive = 1 if price >= 9000 //dummy for "expensive" cars
tab expensive

//More complex syntax doing the same thing
drop expensive

gen expensive = price >= 9000
//IMPORTANT NOTE: for logic statements such as 'if' which are equating, double equals sign is necessary
//eg. gen ninethousand = price == 9000
//in this case, since we are not equating, we do not use a double equals sign

//tab expensive -- to be uncommented out to test
drop expensive

gen expensive = cond(price>=9000,1,0)
//tab expensive
//Missing obs included here -- but what if you wanted to explicitly not include them?
drop expensive

gen expensive = cond(price>=9000,1,0) if !missing(price)
drop expensive

gen expensive = cond(price>=9000,1,0) if price!=.
//either of these work

//Now to make a simulated data set

clear all
set obs 10
generate y=cond(_n<=6,1,0)
generate x=cond(_n<=3,1,0)
generate z=cond(_n>=8,1,0)
browse

//Example analysis
reg y x z
