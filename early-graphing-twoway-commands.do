// Isabel Beckrich graphing commands

clear all

//cd "YOUR DIRECTORY HERE"

// included in video:

sysuse auto

twoway scatter price mpg, scheme(stmono1) mcolor(purple) msymbol(diamond) msize(small) title("Association between car price and mileage") ytitle("Price (dollars)") xtitle("Mileage")
graph export examplescatter.png, replace

hist weight, bin(30)

// FOR MORE INFORMATION, UNCOMMENT ONE OF THESE LINES:

// help twoway
// help histogram