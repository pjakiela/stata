clear all


di floor(4.999) //rounding down
di ceil(4.0001) //rounding up
di round(4.5) //rounding normally (ie. up, in this case)

di log(5) //natural log of 5
di exp(5) //e^5

di sqrt(64)

//what if we use multiple operators
di 1*1*1 + 2*2*2 + 3*3*3 + 4*4*4 

//help mathematical functions

//a really useful application of this might be generating variables
/*
syuse auto
gen headroomfloor = floor(headroom)
gen headroomceil = ceil(headroom)
gen headroomrounded = round(headroom)

gen lnprice = log(price)
gen e_trunk = exp(trunk)

gen stl = sqrt(turn/length)
*/

di normal(0) //cumulative standard normal density, makes sense that 0.5 of all density is left of 0
di 2*(1-normal(345/154)) //eg. testing statistical significance of an estaimte of 345 with SE 154

//help statistical functions

