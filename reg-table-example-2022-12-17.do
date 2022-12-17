
// PRELIMINARIES

clear all 
set scheme s1mono 
set more off

** sort out your working directory
cd "C:\Users\pj\Dropbox\stata-skills"


// GETTING STARTED

** load data
webuse set https://pjakiela.github.io/ECON523/exercises
webuse E1-CohenEtAl-data.dta


// RUNNING A REGRESSION

reg c_act coartemprice b_*

// USING ESTSTO TO STORE REGRESSION RESULTS

** run a regression of use of ACTs (c_act) on treatment (act_any)

eststo clear
eststo:  reg c_act coartemprice
eststo:  reg c_act coartemprice b_*



// USING ESTTAB TO SAVE REGRESSION RESULTS TO WORD

esttab using reg-table.rtf, nolabel replace

** label the variables 
label var coartemprice "Randomized Price"
label var b_h_edu "Education"
label var b_knowledge "Malaria Knowledge"
label var b_hh_size "Household Size"
label var b_acres "Acres of Land"
label var b_dist_km "Distance to Health Center"
label var b_h_age_imputed "Age"
label var b_h_age_missing "Age Data Missing"

label var c_act "Treated with ACT"

esttab using reg-table.rtf, label replace

** not so bad, and we can use varwidth() and modelwidth() to alter column widths

esttab using reg-table.rtf, label varwidth(28) modelwidth(16) replace

** more table clean up

drop if b_acres==. | b_dist_km==. | b_h_edu==.

replace coartemprice = coartemprice/1000
label var coartemprice "Price (1000s of Shillings)"

eststo clear
eststo:  reg c_act coartemprice
eststo:  reg c_act coartemprice b_*

esttab, label varwidth(28) modelwidth(16) replace

eststo clear
eststo:  reg c_act coartemprice
eststo:  reg c_act coartemprice b_*
esttab, label indicate(Baseline Controls = b_*) varwidth(28) modelwidth(16) replace



// EXPORT TO EXCCEL

esttab using myregtable.csv, keep(coartemprice) mtitles("No Controls" "W/ Controls") nonumbers label nogaps varwidth(28) modelwidth(16) se replace


// EXPORT TO LATEX

esttab using reg-table.tex, nolabel replace ///
   title(Regression table\label{tab1})
   
