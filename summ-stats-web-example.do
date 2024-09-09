
// PRELIMINARIES

clear all 
set scheme s1mono 
set more off

** sort out your working directory
cd "[YOUR DIRECTORY]"


// GETTING STARTED

** load data
webuse set https://pjakiela.github.io/ECON523/exercises
webuse E1-CohenEtAl-data.dta

** you can learn about the baseline variables by typing 

desc b_*

** which is stata shorthand for describe [all the variables that start with b_]

** you can see summary statistics on the baseline variables by typing

sum b_*

** which is stata shorthand for summarize [all the variables that start with b_]

** Go ahead and relabel all the baseline variables, so that the labels are short and self-explanatory

label var b_h_edu "Education"
label var b_knowledge "Malaria Knowledge"
label var b_hh_size "Household Size"
label var b_acres "Acres of Land"
label var b_dist_km "Distance to Health Center"
label var b_h_age_imputed "Age"
label var b_h_age_missing "Age Data Missing"

estpost summarize b_*

esttab, cells("mean(fmt(2)) sd min max count(fmt(%9.0g))") ///
label noobs nonum nomtitle varwidth(28) ///
collabels("Mean" "S.D." "Min." "Max." "N") ///
title(Summary Statistics Table)