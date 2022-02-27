clear all
set seed 12345

sysuse auto //This is dummy data about cars preloaded into stata

//Explanation of local vs. global
//TL;DR -- local macros are saved only to the contents of a given do file/program and goes away when it is done running, globals are accesible in any other Stata program you may run after creating it
//many uses for macros, one of the most relevant is storing variable names


//Let's say I wanted to run a complex multiple regression which examines how all these different aspects of a car affect its price
local controls mpg rep78 headroom trunk weight length turn displacement 
reg price `controls'

//very helpful for keeping long, complex pieces of code relatively neat and organized, other possible uses include for loops, for summarizing multiple variables at once, and any other command which may take multiple variables at once!

global controls mpg rep78 headroom trunk weight length turn displacement

reg price $controls

//You have the same outcome, but now if I were to use this global in a different window of stata, it would still exist, if I used the global in a different window it wouldn't.
//You can test this yourself by opening a new .do file editor window!

//Ways of denoting locals/globals that aren't lists:
local string = "Hello World"
local value = 600

global string = "Goodbye World"
global value = 400

//These have similar names -- how do I distinguish between them when I want to refer to one and not the other?

display "$string" //global
display "`string'" //locals

//You can also do calculations with numerical macros, just don't include quote marks






