clear all
sysuse auto

preserve

summ price
drop if price <5000
summ price
//dropping the observations which are <5000 in price

summ price
keep if price <10000
summ price
//keeping the observations which are <10000 in price; that is, dropping any above 10k

restore

summ price


//note: if this data set is locally saved, and I save over it in its current state, it will NOT be recoverable in its prior form. That's not a problem here since it's not locally saved.

//can always clear and reimport!
clear all
sysuse auto

gen insurance =. //missing observation, how stata would handle an empty excel cell, for instance.
replace insurance = 2500 if _n >25

//probably most common use of dropping is removing missing observations
drop if insurance ==.

