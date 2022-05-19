//stored values -- some commands produce values that are automatically stored in stata
clear all
sysuse auto

summ price
return list
//these are summary statistics

gen posFromEnd = r(N) - _n

di "Distance from max to min: " r(max)-r(min)
gen centeredPrice = price - r(mean)
gen standardizedPrice = (price - r(mean))/r(sd)

count if price > 10000 & weight > 3000
di "There are " r(N) " expensive heavy cars"
local expensiveheavyN=r(N)
count
local allN=r(N)
local myfraction=`expensiveheavyN'/`allN'
di "The expensive heavy cars are `myfraction' of the sample"

help system variables //for more explanation

//there are also estimation specific summary statistics
reg price mpg
ereturn list
di _b[mpg]
di _se[mpg]
di _b[_cons]


di "R-squared is:" e(r2)


//could do something fun like

foreach i of varlist mpg headroom trunk {
	reg price `i'
	di "This was a regression with the command " e(cmdline)
	 di "The key coefficient is " _b[`i'] " and SE is " _se[`i']
}

