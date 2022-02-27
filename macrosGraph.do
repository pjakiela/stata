
clear all 

sysuse auto
// summarize miles per gallon
summarize mpg
// see what "return" values we have access to after the summarize command
return list
// save the mean and SD to local macros
local mpgm=r(mean)
local mpgs=r(sd)
// round the mean for ease of reading
local roundmpgm=round(r(mean))

//now, same thing for price
summarize price
return list
local pricem = r(mean)
local prices = r(sd)
local roundpricem = round(r(mean))


//using the locals in a scatter plot
twoway scatter mpg price, scheme(s1mono) color(red) title("Miles per gallon: mean near `roundmpgm', Price: mean near `roundpricem'") xline(`pricem') note("MPG mean = `mpgm' Price SD = `mpgs' Price mean = `pricem' Price SD = `pricesd'")
